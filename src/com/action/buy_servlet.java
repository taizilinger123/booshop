package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DB;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.orm.Torder;
import com.orm.TorderItem;
import com.orm.Tuser;
import com.service.liuService;
import com.util.Cart;

public class buy_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String type = req.getParameter("type");

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
		
		if (type.endsWith("addToCart")) {
			addToCart(req, res);
		}
		if (type.endsWith("orderSubmit")) {
			orderSubmit(req, res);
		}
		if (type.endsWith("myorder")) {
			myorder(req, res);
		}
		if (type.endsWith("orderDetail")) {
			orderDetail(req, res);
		}
		if (type.endsWith("orderBankSubmit")) {
			orderBankSubmit(req, res);
		}
		if(type.endsWith("updateZT"))
		{
			updateZT(req, res);
		}
	}

	public void addToCart(HttpServletRequest req, HttpServletResponse res) {
		int goods_id = Integer.parseInt(req.getParameter("goods_id"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		Tgoods goods = liuService.getGoods(goods_id);

		TorderItem orderItem = new TorderItem();
		orderItem.setGoods(goods);
		orderItem.setGoods_quantity(quantity);

		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		cart.addGoods(goods_id, orderItem);

		session.setAttribute("cart", cart);

		req.setAttribute("message", "");
		req.setAttribute("path", "qiantai/cart/mycart.jsp");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);

	}

	public void orderBankSubmit(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		String songhuodizhi = (String) session.getAttribute("songhuodizhi");
		String fukuanfangshi = "银行付款";

		Cart cart = (Cart) session.getAttribute("cart");
		Tuser user = (Tuser) session.getAttribute("user");

		Torder order = new Torder();
		order.setId(String.valueOf(new Date().getTime()));
		order.setBianhao(new SimpleDateFormat("yyyyMMddhhmmss")
				.format(new Date()));
		order.setShijian(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
				.format(new Date()));
		order.setZhuangtai("no");
		order.setSonghuodizhi(songhuodizhi);
		order.setFukuanfangshi(fukuanfangshi);
		order.setJine(cart.getTotalPrice());
		order.setUser_id(user.getId());
		liuService.saveOrder(order);

		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();) {

			TorderItem orderItem = (TorderItem) it.next();

			String id = String.valueOf(new Date().getTime());
			String order_id = order.getId();
			int goods_id = orderItem.getGoods().getId();
			int goods_quantity = orderItem.getGoods_quantity();
			liuService.saveOrderItem(id, order_id, goods_id, goods_quantity);

			liuService.updateGoodsKucun(goods_id, goods_quantity);
		}

		cart.getItems().clear();
		session.setAttribute("cart", cart);

		req.setAttribute("order", order);
		req.getRequestDispatcher("qiantai/order/orderSubmit.jsp").forward(req,
				res);

	}

	public void orderSubmit(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String songhuodizhi = req.getParameter("songhuodizhi");
		String fukuanfangshi = req.getParameter("fukuanfangshi");
		HttpSession session = req.getSession();

		 

			
			Cart cart = (Cart) session.getAttribute("cart");
			Tuser user = (Tuser) session.getAttribute("user");

			Torder order = new Torder();
			order.setId(String.valueOf(new Date().getTime()));
			order.setBianhao(new SimpleDateFormat("yyyyMMddhhmmss")
					.format(new Date()));
			order.setShijian(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new Date()));
			order.setZhuangtai("no");
			order.setSonghuodizhi(songhuodizhi);
			order.setFukuanfangshi(fukuanfangshi);
			order.setJine(cart.getTotalPrice());
			order.setUser_id(user.getId());
			order.setZhuangtai("未付款");
			liuService.saveOrder(order);

			for (Iterator it = cart.getItems().values().iterator(); it
					.hasNext();) {

				TorderItem orderItem = (TorderItem) it.next();

				String id = String.valueOf(new Date().getTime());
				String order_id = order.getId();
				int goods_id = orderItem.getGoods().getId();
				int goods_quantity = orderItem.getGoods_quantity();
				liuService
						.saveOrderItem(id, order_id, goods_id, goods_quantity);

				liuService.updateGoodsKucun(goods_id, goods_quantity);
			}

			cart.getItems().clear();
			session.setAttribute("cart", cart);

			req.setAttribute("order", order);
			req.getRequestDispatcher("qiantai/order/orderSubmit.jsp").forward(
					req, res);
		 

	}

	public void myorder(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		Tuser user = (Tuser) session.getAttribute("user");

		req.setAttribute("orderList", liuService.orderList(user.getId()));
		req.getRequestDispatcher("qiantai/order/myorder.jsp").forward(req, res);

	}

	public void orderDetail(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String order_id = req.getParameter("order_id");
		System.out.println(order_id + "DD");
		req.setAttribute("orderItemList", liuService.orderItemList(order_id));
		req.getRequestDispatcher("qiantai/order/orderDetail.jsp").forward(req,
				res);

	}
	
	
	public void updateZT(HttpServletRequest req,HttpServletResponse res)
	{
		String orderid=req.getParameter("orderid");
		int zt=Integer.parseInt(req.getParameter("zt"));
        String zts = "未付款";
		if(zt==2){
			zts = "已付款";
		}
		if(zt==3){
			zts = "已取消";
		}
		if(zt==4){
			zts = "确认收货";
		}
		String sql="update t_order set  zhuangtai=? where id=?";
		Object[] params={zts,orderid};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "buy?type=myorder");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void dispatch(String targetURI, HttpServletRequest request,
			HttpServletResponse response) {
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(
				targetURI);
		try {
			dispatch.forward(request, response);
			return;
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void destroy() {

	}
}
