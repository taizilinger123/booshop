<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
	     <script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
	
	
	 <script type="text/javascript">
            function delGoodsFromCart(goodsId)
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.delGoodsFromCart(goodsId,callback111);
	        }
           
            function clearCart()
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.clearCart(callback111);
	        }
           
            function modiNum(goodsId,quantity)
	        {
	            var r1= /^[0-9]*[1-9][0-9]*$/　　//正整数 
	            var val=r1.test(quantity); //str为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else
	            {
	                document.getElementById("indicator1").style.display="block";
	                cartService.modiNum(goodsId,quantity,callback111);
	            }
	        }
	        
	        function callback111(data)
	        {
	            document.getElementById("indicator1").style.display="none";
	            if(data=="no")
			    {
			        alert("库存不足");
			    }
			    if(data=="yes")
			    {
			        document.location.reload(true);
			    }
	        }
    </script>
	<body>
	   <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
	   
		 


		<div class="blank"></div>

		<div class="block">


			<div class="flowBox">
				<span
					style="font-size: 24px; font-weight: bold; overflow: hidden; color: #444; height: 30px; line-height: 30px; display: block; margin-top: 10px">我的购物车</span>
				<form id="formCart" name="formCart" method="post" action="#">
					<h1 class="header_title">
						<span style="float: left">商品列表</span>
						<span style="float: right; padding-right: 10px;"><input
								type="button" value="清空购物车" class="bnt_blue_1"
								style="float: none; margin: 0;"
								 onclick="clearCart()">  
						</span>
					</h1>
					<table width="1200" bgcolor="#dddddd" align="center"
						cellspacing="1" cellpadding="5" border="0"
						style="font-size: 14px;">
						<tbody>
							<tr>
								<th height="30" bgcolor="#dbeefd">
									商品名称
								</th>
								 
								<th bgcolor="#dbeefd">
									价格
								</th>
								<th bgcolor="#dbeefd">
									购买数量
								</th>
								<th bgcolor="#dbeefd">
									小计
								</th>
								<th bgcolor="#dbeefd">
									操作
								</th>
							</tr>
							
							
							
							<c:forEach items="${sessionScope.cart.items}" var="item">
							
							<tr>
								<td bgcolor="#ffffff" align="center">
									<a href="#" target="_blank"><img
											src="<%=path%>/${item.value.goods.fujian}"
											border="0" 
											style="width: 80px; height: 80px; margin-bottom: 12px;">
									</a>
									<br>
									${item.value.goods.mingcheng}
								</td>
								 
								<td align="center" bgcolor="#ffffff">
									${item.value.goods.shichangjia}元
								</td>
								<td align="center" bgcolor="#ffffff">
							 
							<input type="text"   class="inputBg" onChange="modiNum(${item.value.goods.id},this.value)" value="${item.value.goods_quantity}" size="4"/>
										
								</td>
								<td align="center" bgcolor="#ffffff">
									${item.value.goods.shichangjia * item.value.goods_quantity}元
								</td>
								<td align="center" bgcolor="#ffffff">
									<a href="#" onClick="delGoodsFromCart(${item.value.goods.id})"
										class="fs">删除</a>
								</td>
							</tr>
							
							
							</c:forEach>
						</tbody>
					</table>

					<table width="1200" align="center" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#ffffff">
						<tbody>
							<tr height="50" align="right">
								<td style="padding: 10px; line-height: 30px;">
									<span style="font-size: 14px; font-weight: bold;">总计:</span>
									<span
										style="color: #e4393c; font-size: 30px; font-weight: 800;">${sessionScope.cart.totalPrice}元</span>
									  &nbsp;&nbsp;&nbsp;&nbsp;
												    <img id="indicator1" src="<%=path %>/img/loading.gif" style="display:none"/>
								</td>

							</tr>
						</tbody>
					</table>
					<input type="hidden" name="step" value="update_cart">
				</form>
				<table width="1200" align="center" cellspacing="0" cellpadding="5"
					border="0">
					<tbody>
						<tr>
							<td style="padding: 10px;">
								<a class="go_accounts" href="<%=path%>/user?type=selectmradress">去结算</a>
								<a class="go_continue" href="<%=path %>/qiantai/default.jsp">继续购物</a>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="blank5"></div>








			</div>
			<div class="blank5"></div>

			<div class="blank"></div>
			<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>
</html>
