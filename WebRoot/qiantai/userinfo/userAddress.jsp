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
            
            function toEidtAddress(id){
               window.location.href = '<%=path%>/user?type=toeadress&id=' + id;
            }
             function deladdress(id){
               window.location.href = '<%=path%>/user?type=delAddress&id=' + id;
            }
             function mr(id){
               window.location.href = '<%=path%>/user?type=mrAddress&id=' + id;
            }
            
	         function saveAddress()
		    {
		       
		      
		         if(document.form2.address.value=="")
		        {
		            alert("请输入收货地址");
		            return false;
		        }
		        
		        
		        if(document.form2.name.value=="")
		        {
		            alert("请输入收货人");
		            return false;
		        }
		         if(document.form2.telphone.value=="")
		        {
		            alert("请输入联系电话");
		            return false;
		        }
	 
		        document.forms[1].submit();
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
        <div class="userMenu">   <!-- class="curs" -->
<a href="<%=path%>/user?type=userInfo" ><img src="<%=webpath%>/images/u2.gif"> 用户信息</a>
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
         
              
        
      
              <h1><span>收货地址</span></h1>
       <div class="blank"></div>
       <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <tbody>	<tr align="center">
						<td bgcolor="#ffffff">
							收货人
						</td>
						<td width="40%" bgcolor="#ffffff">
							收货地址
						</td>
						<td bgcolor="#ffffff">
							联系电话
						</td>
						<td width="25%" bgcolor="#ffffff">
							操作
						</td>
						 
					</tr>


<c:forEach items="${requestScope.addressList}" var="address">
					<tr align="center">
						<td bgcolor="#ffffff">
							${address.name}  <c:if test="${address.mr==1}">&nbsp;(默认地址)</c:if>
						</td>
						<td bgcolor="#ffffff">
							${address.address}
						</td>
						<td bgcolor="#ffffff">
							${address.telphone}
						</td>
						 
						<td bgcolor="#ffffff">
							<input value="编辑" type="button"  onclick="toEidtAddress(${address.id})"  />
							
							<input value="删除" type="button" onclick="deladdress(${address.id})"/>
							
							<input value="设为默认" type="button" onclick="mr(${address.id})"/>
						</td>
					</tr>

</c:forEach>
          
                    </tbody></table>
        <div class="blank5"></div>
 
 
          
     
          
    <form action="<%=path %>/user?type=saveAddress" method="post" name="form2"  style="margin-bottom: 10px;">
              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                <tbody> 
                                <tr>
                                     <td align="right" bgcolor="#ffffff">收货地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="address" type="text" class="inputBg" id="address_0" value="" style="width:250px">
                  (必填)</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">收货人：</td>
                  <td align="left" bgcolor="#ffffff"><input name="name" type="text" class="inputBg" id="consignee_0" value="" style="width:250px">
                  (必填) </td>               
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">联系电话：</td>
                  <td align="left" bgcolor="#ffffff"><input name="telphone" type="text" class="inputBg" id="tel_0" value="" style="width:250px">
                  (必填)</td>
                </tr> 
                          
                <tr>
                  <td align="right" bgcolor="#ffffff">&nbsp;</td>
                  <td colspan="3" align="center" bgcolor="#ffffff">                    
                  <input type="button" onclick="saveAddress();"   class="bnt_blue_1" value="保存">
         
                   
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




























 

		<div class="blank"></div>
			<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>
</html>
