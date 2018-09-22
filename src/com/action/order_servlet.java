package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tcatelog;
import com.orm.Torder;
import com.service.liuService;

public class order_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        
        List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
		if(oneCatelogList!=null && oneCatelogList.size()>0){
			Tcatelog one = oneCatelogList.get(0);
			twoCatelogList = liuService.catelogOneList(one.getId());
			if(twoCatelogList!=null && twoCatelogList.size()>0){
				req.setAttribute("goodsList", liuService.goodsByCatelog(twoCatelogList.get(0).getId()));
			}
		}
		req.setAttribute("oneList", oneCatelogList);
		req.setAttribute("twoList", twoCatelogList);
		
		
		if(type.endsWith("orderMana"))
		{
			orderMana(req, res);
		}
		if(type.endsWith("orderDel"))
		{
			orderDel(req, res);
		}
		if(type.endsWith("orderShouli"))
		{
			orderShouli(req, res);
		}
		
		if(type.endsWith("register"))
		{
			register(req, res);
		}
		
		if(type.endsWith("login"))
		{
			login(req, res);
		}
		if(type.endsWith("mygouwuche"))
		{
			mygouwuche(req, res);
		}
		if(type.endsWith("report"))
		{
			report(req, res);
		}
		
	}
	
	
	public void orderDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_order where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "order?type=orderMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void login(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		 
		req.getRequestDispatcher("qiantai/userinfo/login.jsp").forward(req, res);
	}
	public void register(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		 
		req.getRequestDispatcher("qiantai/userinfo/userReg.jsp").forward(req, res);
	}
	public void mygouwuche(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		 
		req.getRequestDispatcher("qiantai/cart/mycart.jsp").forward(req, res);
	}
	

	public void orderMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List orderList=new ArrayList();
		String sql="select * from t_order order by zhuangtai desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Torder order=new Torder();
				
				order.setId(rs.getString("id"));
				order.setBianhao(rs.getString("bianhao"));
				order.setShijian(rs.getString("shijian"));
				order.setZhuangtai(rs.getString("zhuangtai"));
				order.setSonghuodizhi(rs.getString("songhuodizhi"));
				order.setFukuanfangshi(rs.getString("fukuanfangshi"));
				order.setJine(rs.getDouble("jine"));
				order.setUser_id(rs.getString("user_id"));
				
				orderList.add(order);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("admin/order/orderMana.jsp").forward(req, res);
	}
	
	
	public void report(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List<Torder> orderList=new ArrayList<Torder>();
		String sql="select goods_id,sum(goods_quantity) nums,b.mingcheng from t_orderitem a left join t_goods b on a.goods_id=b.id  where a.goods_id in (select id from t_goods ) group by a.goods_id order by nums desc limit 0,5";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Torder order=new Torder();
				order.setMingcheng(rs.getString("mingcheng"));
				order.setNums(rs.getInt("nums"));
				orderList.add(order);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("title", "销量排行榜(Top 5)");
		String items="";
		String score="";
		if(orderList!=null && orderList.size()>0){
			for (Torder order : orderList) {
				items = items + "'"+order.getMingcheng()+"',";
				score = score + order.getNums() + ",";
			}
			items = items.substring(0, items.length()-1);
			score = score.substring(0, score.length()-1);
		
		}
		req.setAttribute("items", items);
		req.setAttribute("score", score);
		req.getRequestDispatcher("admin/order/report1.jsp").forward(req, res);
	}
	
 
	
	
	public void orderShouli(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="update t_order set zhuangtai='已发货' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "order?type=orderMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
