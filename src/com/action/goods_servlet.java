package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.service.liuService;

public class goods_servlet extends HttpServlet
{ 
	int PAGE_IETM = 10;  //每页的图书个数
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		

			
			
		if(type.endsWith("goodsAdd"))
		{
			goodsAdd(req, res);
		}
		if(type.endsWith("goodsMana"))
		{
			goodsMana(req, res);
		}
		if(type.endsWith("goodsDel"))
		{
			goodsDel(req, res);
		}
		if(type.endsWith("goodsDetailHou"))
		{
			goodsDetailHou(req, res);
		}
		
		
		if(type.endsWith("goodsByCatelog"))
		{
			goodsByCatelog(req, res);
		}
		if(type.endsWith("goodsDetailQian"))
		{
			goodsDetailQian(req, res);
		}
		if(type.endsWith("goodsUpdate"))
		{
			goodsUpdate(req, res);
		}
		if(type.endsWith("goodsByName"))
		{
			goodsByName(req, res);
		}
		if(type.endsWith("goodsByCatelog1"))
		{
			goodsByCatelog1(req, res);
		}
		if(type.endsWith("goodsindex"))
		{
			goodsindex(req, res);
		}
		
		

	}
	
	
	public void goodsAdd(HttpServletRequest req,HttpServletResponse res)
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		String nannvkuan=req.getParameter("nannvkuan");
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String pinpai=req.getParameter("pinpai");
		String fujian=req.getParameter("fujian");
		double shichangjia=Double.parseDouble(req.getParameter("shichangjia"));
		
		 
		String chandi=req.getParameter("chandi");
		String gongsi=req.getParameter("gongsi");
		
		
		
		String sql="insert into t_goods(catelog_id,nannvkuan,bianhao,mingcheng,jieshao,pinpai,fujian,shichangjia,kucun,chandi,gongsi) " +
				   "values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={catelog_id,nannvkuan,bianhao,mingcheng,jieshao,"",fujian,shichangjia,0,chandi,gongsi};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void goodsUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		String nannvkuan=req.getParameter("nannvkuan");
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String pinpai=req.getParameter("pinpai");
		String fujian=req.getParameter("fujian");
		double shichangjia=Double.parseDouble(req.getParameter("shichangjia"));
		
		String chandi=req.getParameter("chandi");
		String gongsi=req.getParameter("gongsi");
		int kucun= 0;
		
	 
		
		String id=req.getParameter("id");
		 
		
		String sql="update t_goods set catelog_id=?,bianhao=?,mingcheng=?,jieshao=?,pinpai=?,shichangjia=?,chandi=?,gongsi=?,kucun=? where id=?";
		Object[] params={catelog_id , bianhao, mingcheng ,jieshao, pinpai ,shichangjia,chandi,gongsi,kucun,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	
	public void goodsDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="delete from t_goods where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods  order by shichangjia";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setNannvkuan(rs.getString("nannvkuan"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setPinpai(rs.getString("pinpai"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getDouble("shichangjia"));
		
				goods.setKucun(rs.getInt("kucun"));
				
				goods.setGongsi(rs.getString("gongsi"));
				goods.setChandi(rs.getString("chandi"));
				
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}
	
	
	
	 
	
	  
	public void goodsDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("admin/goods/goodsDetailHou.jsp").forward(req, res);
	}
	
	public void goodsShezhiTejia(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		int tejia=Integer.parseInt(req.getParameter("tejia"));
		
		String sql="update t_goods set tejia=?,shifoutejia='shi' where id="+id;
		Object[] params={tejia};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsByCatelog(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
		List<Tgoods> goodsList = new ArrayList<Tgoods>();
		twoCatelogList = liuService.catelogOneList(catelog_id);
		req.setAttribute("names", liuService.catelog(catelog_id).getName());
		req.setAttribute("oneList", oneCatelogList);
		req.setAttribute("twoList", twoCatelogList);
		goodsList = liuService.goodsByCatelog1(catelog_id);
		req.setAttribute("goodsList", goodsList);
		
		req.setAttribute("itemSize", goodsList.size());
		int page_count = goodsList.size() % PAGE_IETM == 0 ? goodsList.size() / PAGE_IETM : goodsList.size() / PAGE_IETM + 1;
		req.setAttribute("pageItem",PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("qtype","goodsByCatelog");
		req.getRequestDispatcher("qiantai/plist.jsp").forward(req, res);
	}
	
	
	public void goodsindex(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
	 
		List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
		List<Tgoods> goodsList = liuService.goodsByCatelog(0);
//		if(oneCatelogList!=null && oneCatelogList.size()>0){
//			twoCatelogList = liuService.catelogOneList(oneCatelogList.get(0).getId());
//		}
		req.setAttribute("names", "全部");
		req.setAttribute("oneList", oneCatelogList);
		req.setAttribute("twoList", twoCatelogList);
		req.setAttribute("goodsList", goodsList);
//		if(twoCatelogList!=null && twoCatelogList.size()>0){
//			req.setAttribute("goodsList", liuService.goodsByCatelog(0));
//		}
		
		req.setAttribute("itemSize", goodsList.size());
		int page_count = goodsList.size() % PAGE_IETM == 0 ? goodsList.size() / PAGE_IETM : goodsList.size() / PAGE_IETM + 1;
		req.setAttribute("pageItem",PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("qtype","goodsindex");
		
		req.getRequestDispatcher("qiantai/plist.jsp").forward(req, res);
	}
	
	
	
	
	public void goodsByCatelog1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		int fid=Integer.parseInt(req.getParameter("fid"));
	  
		
		List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
		List<Tgoods> goodsList = liuService.goodsByCatelog(catelog_id);
		twoCatelogList = liuService.catelogOneList(fid);
		req.setAttribute("oneList", oneCatelogList);
		req.setAttribute("twoList", twoCatelogList);
		req.setAttribute("names", liuService.catelog(catelog_id).getName());
		req.setAttribute("goodsList",goodsList );
		
		
		req.setAttribute("itemSize", goodsList.size());
		int page_count = goodsList.size() % PAGE_IETM == 0 ? goodsList.size() / PAGE_IETM : goodsList.size() / PAGE_IETM + 1;
		req.setAttribute("pageItem",PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("qtype","goodsByCatelog1");
		
		req.getRequestDispatcher("qiantai/plist.jsp").forward(req, res);
	}
	
	
	
	
	public void goodsByName(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		String name=req.getParameter("queryname");
		
		
		List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
//		if(oneCatelogList!=null && oneCatelogList.size()>0){
//			Tcatelog one = oneCatelogList.get(0);
//			twoCatelogList = liuService.catelogOneList(one.getId());
//			if(twoCatelogList!=null && twoCatelogList.size()>0){
//				req.setAttribute("goodsList", liuService.goodsByCatelog(twoCatelogList.get(0).getId()));
//			}
//		}
		req.setAttribute("oneList", oneCatelogList);
		req.setAttribute("twoList", twoCatelogList);
		req.setAttribute("names", name);
		List<Tgoods> goodsList = liuService.goodsByName(name);
		req.setAttribute("goodsList",goodsList);
		
		
		req.setAttribute("itemSize", goodsList.size());
		int page_count = goodsList.size() % PAGE_IETM == 0 ? goodsList.size() / PAGE_IETM : goodsList.size() / PAGE_IETM + 1;
		req.setAttribute("pageItem",PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("qtype","goodsByCatelog1");
		
		
		req.getRequestDispatcher("qiantai/plist.jsp").forward(req, res);
	}
	
	
	public void goodsDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		Tcatelog cl = liuService.catelog(cid);
		
		 List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		 List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
		 if(oneCatelogList!=null && oneCatelogList.size()>0){
			twoCatelogList = liuService.catelogOneList(cl.getFid());
		 }
		 req.setAttribute("oneList", oneCatelogList);
		 req.setAttribute("twoList", twoCatelogList);
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("qiantai/goods/goodsDetailQian.jsp").forward(req, res);
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

}
