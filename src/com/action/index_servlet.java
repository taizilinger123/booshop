package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tcatelog;
import com.orm.Tgonggao;
import com.service.liuService;

public class index_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		 
		req.getSession().setAttribute("catelogList", liuService.catelogList());
		
		List<Tcatelog> oneCatelogList = liuService.catelogOneList(0);
		List<Tcatelog> twoCatelogList = new ArrayList<Tcatelog>();
		if(oneCatelogList!=null && oneCatelogList.size()>0){
			Tcatelog one = oneCatelogList.get(0);
			twoCatelogList = liuService.catelogOneList(one.getId());
			if(twoCatelogList!=null && twoCatelogList.size()>0){
				req.setAttribute("goodsList", liuService.goodsByCatelog(twoCatelogList.get(0).getId()));
			}
		}
		req.setAttribute("newList", liuService.goodsNew()); //新上架
		req.setAttribute("topxlList", liuService.goodsPaihang4());//销量排行
		req.setAttribute("oneList", oneCatelogList);
		req.setAttribute("twoList", twoCatelogList);
		req.getRequestDispatcher("qiantai/index.jsp").forward(req, res);
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
