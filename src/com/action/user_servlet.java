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
import com.orm.TAddress;
import com.orm.TAdmin;
import com.orm.Tcatelog;
import com.orm.Tuser;
import com.service.liuService;

public class user_servlet extends HttpServlet
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
		if(type.endsWith("userReg"))
		{
			userReg(req, res);
		}
		if(type.endsWith("userLogout"))
		{
			userLogout(req, res);
		}
		if(type.endsWith("userEdit"))
		{
			userEdit(req, res);
		}
		if(type.endsWith("userMana"))
		{
			userMana(req, res);
		}
		if(type.endsWith("userDel"))
		{
			userDel(req, res);
		}
		if(type.endsWith("userXinxi"))
		{
			userXinxi(req, res);
		}
		if(type.endsWith("setVip"))
		{
			setVip(req, res);
		}
		if(type.endsWith("userInfo"))
		{
			userInfo(req, res);
		}
		if(type.endsWith("userEditInfo"))
		{
			userEditInfo(req, res);
		}
		
		if(type.endsWith("mpwd"))
		{
			mpwd(req, res);
		}
		if(type.endsWith("userAddress"))
		{
			userAddress(req, res);
		}
		if(type.endsWith("saveAddress"))
		{
			saveAddress(req, res);
		}
		if(type.endsWith("editAddress"))
		{
			editAddress(req, res);
		}
		if(type.endsWith("delAddress"))
		{
			delAddress(req, res);
		}
		if(type.endsWith("mrAddress"))
		{
			mrAddress(req, res);
		}
		
		if(type.endsWith("toeadress"))
		{
			toeadress(req, res);
		}
		if(type.endsWith("selectmradress"))
		{
			selectmradress(req, res);
		}
		
		
	}
	
	
	public void userReg(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String name=req.getParameter("name");
		String sex="";
		String age="";
		String address=req.getParameter("address");
		String tel=req.getParameter("loginname");
		String email="";
		String qq="";
		String del="no";
		
		String sql="insert into t_user values(?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={id,loginname,loginpw,name,sex,age,address,tel,email,qq,del,"n"};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
        String targetURL = "/qiantai/default.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void userLogout(HttpServletRequest req,HttpServletResponse res)
	{
		req.getSession().setAttribute("user", null);
		String targetURL = "/qiantai/default.jsp";
		dispatch(targetURL, req, res);		
	}
	
	
	
	public void setVip(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		String vip=req.getParameter("vip");
	
	 
		
		String sql="update t_user set vip=? where id=?";
		Object[] params={vip,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		 
		
		userMana(req,res);
	}
	
	public void userEdit(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String name=req.getParameter("name");
		String sex="";
		String age="";
		String address=req.getParameter("address");
		String tel=req.getParameter("loginname");
		String email="";
		String qq="";
		
		String sql="update t_user set loginpw=?,name=?,sex=?,age=?,address=?,tel=?,email=?,qq=? where id=?";
		Object[] params={loginpw,name,sex,age,address,tel,email,qq,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		Tuser user=new Tuser();
		user.setId(id);
		user.setLoginname(loginname);
		user.setLoginpw(loginpw);
		user.setLoginpw(loginpw);
		user.setName(name);
		user.setSex(sex);
		user.setAge(age);
		user.setAddress(address);
		user.setTel(tel);
		user.setEmail(email);
		
		
		req.getSession().setAttribute("user", user);
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/add_success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void mpwd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String oldpwd=req.getParameter("oldpwd");
		String loginpw=req.getParameter("loginpw");
		Tuser user= (Tuser) req.getSession().getAttribute("user");
		if(!oldpwd.equals(user.getLoginpw())){
			req.setAttribute("message", "原密码错误");
			req.setAttribute("path", "user?type=userInfo");
			
	        String targetURL = "/common/success.jsp";
	        dispatch(targetURL, req, res);
		}else{
			String sql="update t_user set loginpw=?  where id=?";
			Object[] params={loginpw,id};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			req.setAttribute("message", "操作成功");
			req.setAttribute("path", "user?type=userInfo");
	        String targetURL = "/common/success.jsp";
			user.setLoginpw(loginpw);
			req.getSession().setAttribute("user", user);
			dispatch(targetURL, req, res);
			
		}
 
	}
	
	public void userEditInfo(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
 
		
		String sql="update t_user set  name=?,sex=? where id=?";
		Object[] params={name,sex,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		Tuser user= (Tuser) req.getSession().getAttribute("user");
		user.setName(name);
		user.setSex(sex);
		req.getSession().setAttribute("user", user);
		
 
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userInfo");
		
        String targetURL = "/common/success.jsp";
		
		
		dispatch(targetURL, req, res);
	}
	
	public void userDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_user where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void userMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select * from t_user where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setAge(rs.getString("age"));
				user.setAddress(rs.getString("address"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setQq(rs.getString("qq"));
				user.setVip(rs.getString("vip"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
	}
	
	
	public void userAddress(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		Tuser user= (Tuser) req.getSession().getAttribute("user");
		String sql="select * from t_address where uid = '" + user.getId()+"'";
		Object[] params={};
		DB mydb=new DB();
		List<TAddress> addressList = new ArrayList<TAddress>();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TAddress address=new TAddress();
				
				address.setId(rs.getInt("id"));
				address.setUid(rs.getString("uid"));
				address.setAddress(rs.getString("address"));
				address.setTelphone(rs.getString("telphone"));
				address.setName(rs.getString("name"));
				address.setMr(rs.getInt("mr"));
			 
				addressList.add(address);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("addressList", addressList);
		req.getRequestDispatcher("qiantai/userinfo/userAddress.jsp").forward(req, res);
	}
	
	public void toeadress(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		String id=req.getParameter("id");
		String sql="select * from t_address where id = " + id;
		Object[] params={};
		DB mydb=new DB();
		TAddress address=new TAddress();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				
				
				address.setId(rs.getInt("id"));
				address.setUid(rs.getString("uid"));
				address.setAddress(rs.getString("address"));
				address.setTelphone(rs.getString("telphone"));
				address.setName(rs.getString("name"));
				address.setMr(rs.getInt("mr"));
			  
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("address", address);
 
		req.getRequestDispatcher("qiantai/userinfo/modifyAddress.jsp").forward(req, res);
 
	}
	
	
	
	public void saveAddress(HttpServletRequest req,HttpServletResponse res)
	{
		Tuser user= (Tuser) req.getSession().getAttribute("user");
		String address=req.getParameter("address");
		String telphone=req.getParameter("telphone");
		String name=req.getParameter("name");
		String sql="insert into t_address (uid,name,address,telphone) values(?,?,?,?)";
		Object[] params={user.getId(),name,address,telphone};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userAddress");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void editAddress(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String address=req.getParameter("address");
		String telphone=req.getParameter("telphone");
		String name=req.getParameter("name");
		String sql="update t_address set address=?,telphone=?,name=? where id = ?";
		Object[] params={address,telphone,name,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userAddress");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void delAddress(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String sql="delete from  t_address   where id = ?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userAddress");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void selectmradress(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		Tuser user= (Tuser) req.getSession().getAttribute("user");
		String sql="select * from t_address where mr=1 and uid = " + user.getId();
		Object[] params={};
		DB mydb=new DB();
		TAddress address=new TAddress();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				address.setId(rs.getInt("id"));
				address.setUid(rs.getString("uid"));
				address.setAddress(rs.getString("address"));
				address.setTelphone(rs.getString("telphone"));
				address.setName(rs.getString("name"));
				address.setMr(rs.getInt("mr"));
			  
		    }else{
		    	address.setName(user.getName());
		    	address.setAddress(user.getAddress());
		    	address.setTelphone(user.getTel());
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("address", address);
 
		req.getRequestDispatcher("qiantai/order/orderQueren.jsp").forward(req, res);
 
	}
	
	public void mrAddress(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String sql="update t_address set mr=0;";
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		
		sql = "update t_address set mr=1 where id="+id ;
		mydb.doPstm(sql, params);
		
		
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userAddress");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void userXinxi(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("user_id");
		
		List userList=new ArrayList();
		String sql="select * from t_user where del='no' and id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setAge(rs.getString("age"));
				user.setAddress(rs.getString("address"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setQq(rs.getString("qq"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/order/userXinxi.jsp").forward(req, res);
	}
	
	
	
	public void userInfo(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Tuser user = (Tuser) req.getSession().getAttribute("user");
		 
		List userList=new ArrayList();
		String sql="select * from t_user where del='no' and id=?";
		Object[] params={user.getId()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			if(rs.next())
			{
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setAge(rs.getString("age"));
				user.setAddress(rs.getString("address"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setQq(rs.getString("qq"));
				 
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("uinfo", user);
		req.getRequestDispatcher("qiantai/userinfo/userInfo.jsp").forward(req, res);
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
