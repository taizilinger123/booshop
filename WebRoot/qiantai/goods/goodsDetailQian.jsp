<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String webpath = path + "/qiantai";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>网上书城</title>
		<script language="JavaScript" src="<%=path%>/js/public.js"
			type="text/javascript"></script>
		<script type="text/javascript">
	        function buy1(kucun)
	        {
	        
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user!=null}">
		            if(document.buy.quantity.value=="")
		            {
		                alert("请输入购买数量");
		                return false;
		            }
		            document.buy.submit();
	            </c:if>
	        }
	</script>

	</head>
	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>

		<script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="./js/jquery.json-2.4.min.js"></script>



		<div class="blank"></div>
		<div class="block clearfix">

			<div class="AreaL">
				<div class="box">
					<div class="box_10">
						<div id="category_tree">
						<c:forEach items="${requestScope.twoList}" var="catelog">

								<dl>
									<dt>
										<a
											href="<%=path%>/goods?type=goodsByCatelog1&catelog_id=${catelog.id}&fid=${catelog.fid}">${catelog.name}</a>
									</dt>

								</dl>


							</c:forEach>

						</div>
					</div>
				</div>


			</div>




			<div class="AreaR">
				<div id="goodsInfo" class="clearfix"
					style="height: auto; overflow: hidden;">

					<div class="textInfo" style="height: auto; width: 970px;">
						 <form action="<%=path %>/buy?type=addToCart" method="post" name="buy">
							<div class="clearfix"
								style="font-size: 14px; color: #444; font-weight: bold; border: 1px solid #ddd;">

								<div id="imgInfo" class="imgInfo"
									style="width: 310px; float: left; padding: 10px;">

									<img src="<%=path%>/${requestScope.goods.fujian }"
										width="310px" height="310px" style="opacity: 1;">
									<div class="blank5"></div>

									<div class="clearfix">
										<span></span>
										<div class="gallery">
											<div id="demo" style="width: 210px;">
												<div id="demo1" style="float: left; width: 70px;">
													<ul>
														<li>

														</li>
													</ul>
												</div>
												<div id="demo2"
													style="display: inline; overflow: visible; width: 70px;"></div>
											</div>
										</div>

									</div>

									<div class="blank5"></div>

								</div>

								<ul
									style="position: relative; width: 618px; height: auto; float: right; padding: 0 10px; overflow: hidden;">
									<div style="height: 10px;"></div>
									<h1
										style="width: 579px; color: #444; font-size: 20px; line-height: 30px;">
										${requestScope.goods.mingcheng }
										 <input type="hidden" name="goods_id" value="${requestScope.goods.id }"/>
									</h1>
									<font
										style="color: #E7383D; width: 618px; font-size: 16px; display: block; height: 30px; line-height: 30px;"><span></span>
									</font>

									<li class="clearfix">
										<dd>
											<strong></strong><font class="shop"
												style="font-size: 30px; font-weight: bold; color: #CA151C;"
												id="ECS_SHOPPRICE"> ${requestScope.goods.shichangjia
												}元 </font>
										</dd>
									</li>


									<li class="clearfix">
										<dd style="padding-bottom: 0;">
											<strong>购买数量：</strong>
											<a href="javascript:;" onclick="red_num1();" title="减少数量"
												class="redu" style="float: none; text-decoration: none;">-</a>
											<input type="text"  name="quantity" id="quantity" value="1"
												size="3" class="common-input2" onblur="changePrice()"
												
												onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
												
												style="border: 1px solid #ccc; text-align: center;">
											<a href="javascript:;" onclick="add_num1();" title="增加数量"
												class="add" style="float: none; text-decoration: none;">+</a>
											<strong>商品总价：</strong>
											<font id="ECS_GOODS_AMOUNT" class="shop"><span id="jiage">${requestScope.goods.shichangjia
												}</span>元</font>
										</dd>
										<div class="blank"></div>
									</li>
									<style>
.redu,.add {
	display: inline-block;
	position: relative;
	text-align: center;
	font-size: 1em;
	background-color: #e3e3e5;
	border: 1px solid #a4a4a4;
	width: 20px;
	height: 18px;
	line-height: 18px;
	-moz-box-shadow: 0 1px 2px #d9d9db inset;
	-webkit-box-shadow: 0 1px 2px #d9d9db inset;
	box-shadow: 0 1px 2px #d9d9db inset;
	vertical-align: middle;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}
</style>
									<li class="padd"
										style="width: 618px; position: relative; padding: 10px 0; border-top: 1px dashed #ddd; overflow: hidden;"
										id="gwc">
										<dd style="height: 35px;">
											<a 
												style="width: 170px; margin-left: 20px; display: block; height: 40px; float: left;"
												href="javascript:buy1(${requestScope.goods.kucun})"><img
													src="<%=webpath%>/images/button2.jpg"> </a>
											<!-- a
												style="width: 120px; margin-left: 20px; display: block; height: 40px; float: left;"
												 ><img
													src="<%=webpath%>/images/button1.jpg"> </a-->

										</dd>
									</li>

									<div class="blank"></div>
								 
								</ul>
								<strong> </strong>
							</div>
							<strong> </strong>
						</form>
					</div>
					<strong>
						<div class="blank"></div>


						<div class="box" style="margin: 15px 0; border: 1px solid #ddd;">
							<div class="box_5">
								<h4 style="height: 40px; width: 100%; background: #F7F7F7;">
									<ul id="com_b">
										<li style="color: #fff; background: #CA151C; cursor: pointer;">
											商品描述
										</li>

									</ul>
								</h4>
								<script type="text/javascript">
$(document).ready(function(){
$("#com_b li").click(function(){
  $(this).css({"color":"#fff","background":"#CA151C","cursor":"pointer"}).siblings().css({"color":"#444","background":"#F7F7F7","cursor":"pointer"});
})
 
});
function add_num1(){
  document.getElementById("quantity").value++;
  if (document.getElementById("quantity").value > 0) {
    changePrice();
  }
}
function red_num1(){
  if (document.getElementById("quantity").value>1){
    document.getElementById("quantity").value--;
  }
  if (document.getElementById("quantity").value > 0) {
    changePrice();
  }
}

function changePrice(){
   var dj = '${requestScope.goods.shichangjia}';
   var sl = document.getElementById("quantity").value;
   var total = parseFloat(dj)*sl;
   console.log(total);
   document.getElementById("jiage").innerText = total;
}
</script>
								<div id="com_h" style="font-size: large;">
									<blockquote class="com_h_1">
										<p>
											&nbsp;
										</p>
										<p>
											<span style="font-size: large;"> <c:out
													value="${requestScope.goods.jieshao }" escapeXml="false"></c:out>
											</span>
										</p>

									</blockquote>

								</div>
							</div>
						</div>
						<div class="blank"></div> </strong>
				</div>
				<strong> </strong>
			</div>
			<strong> </strong>
		</div>
		<strong>
			<div class="blank5"></div>

			<div class="blank"></div> <jsp:include flush="true"
				page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>
</html>
