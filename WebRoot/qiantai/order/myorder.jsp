<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String webpath = path + "/qiantai";
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	 
 <script type="text/javascript">
	        function orderDetail(order_id)
	        {
	                 var url="<%=path %>/buy?type=orderDetail&order_id="+order_id;
	                 var n="";
	                 var w="600px";
	                 var h="500px";
	                 var s="resizable:no;help:no;status:no;scroll:yes";
				     openWin(url,n,w,h,s);
	        }
	        
	        
	         function fukuan(order_id,zt)
	        {
	                 var url="<%=path %>/buy?type=updateZT&zt="+zt+"&orderid=" +order_id ;
	                 window.location.href = url;
	        }
    </script>
	</head>
	<body>
		 <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>

		






<div class="block clearfix">
  
  <div class="AreaL">
    <div class="box">
     <div class="">
      <div class="userCenterBox">
        <div class="userMenu">
<a href="<%=path%>/user?type=userInfo" class="curs"><img src="<%=webpath%>/images/u2.gif"> 用户信息</a>
<a href="<%=path%>/buy?type=myorder"><img src="<%=webpath%>/images/u3.gif"> 我的订单</a>
<a href="<%=path%>/user?type=userAddress"><img src="<%=webpath%>/images/u4.gif"> 收货地址</a>
 
<a href="<%=path%>/user?type=userLogout" style="background:none; text-align:right;margin-left: 10px;margin-right: 60px;margin-top: 12px;border-bottom:0;"><img src="<%=webpath%>/images/bnt_sign.gif"></a>
</div>      </div>
     </div>
    </div>
  </div>
  
  
  <div class="AreaR">
    <div class="box">
     <div class="">
      <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
         
              
        
      
              <h1><span>我的订单</span></h1>
       <div class="blank"></div>
       <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <tbody>	<tr align="center">
						<td bgcolor="#ffffff">
							订单号
						</td>
						<td bgcolor="#ffffff">
							下单时间
						</td>
						<td bgcolor="#ffffff">
							订单总金额
						</td>
						<td bgcolor="#ffffff">
							订单状态
						</td>
						<td bgcolor="#ffffff">
							明细
						</td>
					</tr>


<c:forEach items="${requestScope.orderList}" var="order">
					<tr align="center">
						<td bgcolor="#ffffff">
							${order.bianhao}
						</td>
						<td bgcolor="#ffffff">
							${order.shijian}
						</td>
						<td bgcolor="#ffffff">
							${order.jine}
						</td>
						<td bgcolor="#ffffff">
							${order.zhuangtai}
						</td>
						<td bgcolor="#ffffff">
							<input value="明细" type="button" onclick="orderDetail(${order.id})"/>
							
							 <c:if test="${order.zhuangtai=='未付款' && order.zhuangtai!='已取消'}">
							     <input value="付款" type="button" onclick="fukuan(${order.id},2)"/>
							     <input value="取消" type="button" onclick="fukuan(${order.id},3)"/>
							 </c:if>
							  <c:if test="${order.zhuangtai=='已发货'}">
							     <input value="确认收货" type="button" onclick="fukuan(${order.id},4)"/>
							 </c:if>
							  
						</td>
					</tr>

</c:forEach>
          
                    </tbody></table>
        <div class="blank5"></div>
 
 
       <div class="blank5"></div>
      
             
       
          
     
          
    
                                                   
      
          
      
               




      </div>
     </div>
    </div>
  </div>
  
</div>
<div class="blank"></div>




























 

		<div class="blank"></div>
			<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>
</html>
