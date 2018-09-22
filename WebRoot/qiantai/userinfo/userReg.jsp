<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<script language="javascript">
            
		    function check1()
		    {
		        if(document.form1.loginname.value=="")
		        {
		            alert("请输入手机号");
		            return false;
		        }
		        var mima = document.form1.loginpw.value;
		        if(document.form1.loginpw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        var reg = new RegExp(/^\d{6}$/);
		        var flag = reg.test(mima);
		        if(!flag){
		            alert("请输入6位数字密码");
		            return false;
		        }
		        if(document.form1.loginpw.value!=document.form1.loginpw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		       document.form1.submit();
		    }
        </script>
	<body>

		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>


		<div class="blank"></div>




		<div class="usBox">
			<div class="usBox_2 clearfix"
				style="font-size: 16px !important; width: auto !important; padding: 20px 200px 50px 200px; border: 1px solid #ddd;">
				<div class="regtitle"></div>
				<form action="<%=path %>/user?type=userReg" name="form1"  method="post">
					<table width="100%" border="0" align="left" cellpadding="5"
						cellspacing="3">
						<tbody>
							<tr>
								<td width="13%" align="right">
									用户名
								</td>
								<td width="87%">
									<input name="loginname" id="loginname"
										style="width: 296px; line-height: 40px; margin: 0;"
										type="text" size="25" class="inputBg">
									<span id="username_notice" style="color: #FF0000"> *</span>
								</td>
							</tr>

							<tr>
								<td align="right">
									密码
								</td>
								<td>
									<input name="loginpw"
										style="width: 296px; line-height: 40px; margin: 0;"
										type="password" class="inputBg">
									<span style="color: #FF0000" id="password_notice"> *</span>
								</td>
							</tr>

							<tr>
								<td align="right">
									确认密码
								</td>
								<td>
									<input name="loginpw1"
										style="width: 296px; line-height: 40px; margin: 0;"
										type="password" id="loginpw1"
										  class="inputBg">
									<span style="color: #FF0000" id="conform_password_notice">
										*</span>
								</td>
							</tr>
							<tr>
								<td align="right">
									真实姓名
								</td>
								<td>
									<input name="name"
										style="width: 296px; line-height: 40px; margin: 0;"
										type="text" size="25" class="inputBg">
								</td>
							</tr>
                             
							 
							 
							<tr>
								<td>
									&nbsp;
								</td>
								<td align="left">
									 
									<input  onclick="check1();"
										style="width: 296px; line-height: 40px; margin: 0;"
										type="button" value="注册" class="us_Submit_reg">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td class="actionSub">
									<a href="<%=path%>/order?type=login">我已有账号，我要登录</a>&nbsp;

								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>









		<div class="blank"></div>
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>
</html>
