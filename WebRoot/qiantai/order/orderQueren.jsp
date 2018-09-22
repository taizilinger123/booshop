<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
    String webpath = path + "/qiantai";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
 

	</head>
	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>

		<div class="blank"></div>
		<div class="block">





			 

			  <form action="<%=path %>/buy?type=orderSubmit" name="f" method="post">
				<div class="flowBox">
					<h2>
						<span>收货人信息</span>
					</h2>
					<table width="99%" align="center" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#dddddd">

						<tbody>
							<tr>
								<td bgcolor="#ffffff">
									收货人姓名:
								</td>
								<td bgcolor="#ffffff">
									<input name="consignee" type="text" class="inputBg" readonly="readonly"
										id="consignee_0" value="${address.name}">
									 
								</td>
								<td bgcolor="#ffffff">
									送货地址:
								</td>
								<td bgcolor="#ffffff">
									<input name="songhuodizhi" type="text" class="inputBg"
										id="address_0"  value="${address.address}">
									 
								</td>
							</tr>

							<tr>
								<td bgcolor="#ffffff">
									电话:
								</td>
								<td bgcolor="#ffffff">
									<input  readonly="readonly" type="text" class="inputBg" id="tel_0"
										value="${address.telphone}">
								 
								</td>
								<td bgcolor="#ffffff">
									付款方式:
								</td>
								<td bgcolor="#ffffff">
									<select name="fukuanfangshi" style="width:155px;">
					   		                               <option value="货到付款">货到付款</option>
					   		                               <option value="银行付款">银行付款</option>
					   		                             </select>
								</td>
		 
							<tr>
								<td colspan="4" align="center" bgcolor="#ffffff">




									<div align="center" style="margin: 8px auto;">
										<input type="image" src="<%=webpath%>/images/tijiao.png"  onclick="javascript:document.f.submit();">
										<input type="hidden" name="step" value="done">
									</div>



								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>




		</div>
		<div class="blank5"></div>

		<div class="blank"></div>
			<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>
</html>
