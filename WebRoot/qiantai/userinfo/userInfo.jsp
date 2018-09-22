<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String webpath = path + "/qiantai";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<script language="javascript">
            
		    function editInfo()
		    {
		       document.form1.submit();
		    }
		    
		    
		    function editInfo1()
		    {
		       
		      
		         if(document.form2.oldpwd.value=="")
		        {
		            alert("请输入原密码");
		            return false;
		        }
		        
		        
		        if(document.form2.loginpw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        
		        if(document.form2.loginpw.value!=document.form2.loginpw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		       document.form2.submit();
		    }
        </script>
	<body>

		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>


	
<div class="block clearfix">
  
  <div class="AreaL">
    <div class="box">
     <div class="">
      <div class="userCenterBox">
        <div class="userMenu">
<a href="<%=path%>/user?type=userInfo"><img src="<%=webpath%>/images/u2.gif"> 用户信息</a>
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
         
                       
      <h1><span>个人资料</span></h1>
      <div class="blank"></div>
     <form name="form1" method="post" action="<%=path %>/user?type=userEditInfo">
      <input type="hidden" name="id" value="${uinfo.id}"/> 
      <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                <tbody><tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">用户名： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF"> 
                      ${uinfo.loginname}
                  </td>
                </tr>
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">性　别： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF"> 
                      <select name="sex">
                          <option <c:if test="${uinfo.sex=='保密'}">selected</c:if> value="保密">保密</option>
                          <option <c:if test="${uinfo.sex=='男'}">selected</c:if> value="男">男</option>
                          <option <c:if test="${uinfo.sex=='女'}">selected</c:if> value="女">女</option>
                      </select>
                  </td>
                </tr>
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">真实姓名： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF">
                  <input name="name" type="text" value="${uinfo.name}" size="25" class="inputBg"><span style="color:#FF0000"> </span></td>
                </tr>
						 
			    <tr>
                  <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" type="hidden" value="act_edit_profile">
                    <input onclick="editInfo();"  type="button" value="确认修改" class="bnt_blue_1" style="border:none;">
                  </td>
                </tr>
       </tbody></table>
    </form>
     <form name="form2"   method="post" action="<%=path %>/user?type=mpwd">
      <input type="hidden" name="id" value="${uinfo.id}"/> 
     <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tbody><tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">原密码：</td>
          <td width="76%" align="left" bgcolor="#FFFFFF"><input name="oldpwd" type="password" size="25" class="inputBg"></td>
        </tr>
        <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">新密码：</td>
          <td align="left" bgcolor="#FFFFFF"><input name="loginpw" type="password" size="25" class="inputBg"></td>
        </tr>
        <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">确认密码：</td>
          <td align="left" bgcolor="#FFFFFF"><input name="loginpw1" type="password" size="25" class="inputBg"></td>
        </tr>
        <tr>
          <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" type="hidden" value="act_edit_password">
            <input   type="button" onclick="editInfo1();" class="bnt_blue_1" style="border:none;" value="确认修改">
          </td>
        </tr>
      </tbody></table>
    </form>
          
        
      
             
       
          
     
          
    
                                                   
      
          
      
               




      </div>
     </div>
    </div>
  </div>
  
</div>
<div class="blank"></div>




		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>
</html>
