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

public class catelog_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        
		if(type.endsWith("catelogMana"))
		{
			catelogMana(req, res);
		}
		if(type.endsWith("catelogAdd"))
		{
			catelogAdd(req, res);
		}
		if(type.endsWith("catelogDel"))
		{
			catelogDel(req, res);
		}
		if(type.endsWith("catelogUpdate"))
		{
			catelogUpdate(req, res);
		}
		
	}
	
	
	public void catelogAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String name=req.getParameter("name").trim();
		int fid=Integer.parseInt(req.getParameter("fid"));
		String del="no";
		String sql="insert into t_catelog(name,del,fid) values(?,?,?)";
		Object[] params={name,del,fid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "catelog?type=catelogMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void catelogUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		 
		String name=req.getParameter("name").trim();
		String id=req.getParameter("id");
		int fid=Integer.parseInt(req.getParameter("fid"));
		String sql="update t_catelog set name=?,fid="+fid+"  where id=?";
		Object[] params={name,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "catelog?type=catelogMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	public void catelogDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="delete from t_catelog  where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "catelog?type=catelogMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void catelogMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List catelogList=new ArrayList();
		String sql="select * from t_catelog where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelog.setFid(rs.getInt("fid"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("catelogList", catelogList);
		req.getRequestDispatcher("admin/catelog/catelogMana.jsp").forward(req, res);
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
