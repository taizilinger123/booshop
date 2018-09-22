<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
		<script language="JavaScript" src="<%=path%>/js/public.js"
			type="text/javascript">
</script>
		<script type='text/javascript'
			src='<%=path%>/dwr/interface/loginService.js'>
</script>
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'>
</script>
		<script type='text/javascript' src='<%=path%>/dwr/util.js'>
</script>
	<script language="javascript">
            
		     function check()
			{                                                                                         
			     if(document.ThisForm.loginname.value=="")
				 {
				 	alert("请输入用户名");
					return false;
				 }
				 if(document.ThisForm.loginpw.value=="")
				 {
				 	alert("请输入密码");
					return false;
				 }
				 
				 loginService.login(document.ThisForm.loginname.value,document.ThisForm.loginpw.value,1,callback);
			}
		
			function callback(data)
			{
			    
			    if(data=="no")
			    {
			        alert("用户名或密码错误");
			    }
			    if(data=="yes")
			    {   alert("登陆成功");
			        window.location.href = "<%=path%>/qiantai/default.jsp";
			    }
			    
			}
        </script>
	<body>

		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>


		<div class="blank"></div>




		<div class="usBox">
			<div class="usBox_2 clearfix"
				style="font-size: 16px !important; width: auto !important; padding: 20px 200px 50px 200px; border: 1px solid #ddd;">
				<div class="regtitle"></div>
				<form id="ThisForm" name="ThisForm" method="post"
					action="<%=path%>/userinfo!logon.action">
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
								<td>
									&nbsp;
								</td>
								<td align="left">
									 
									<input  onclick="check();"
										style="width: 296px; line-height: 40px; margin: 0;"
										type="button" value="登录" class="us_Submit_reg">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
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
