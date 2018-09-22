<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String webpath = path + "/qiantai";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
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
			<script type="text/javascript">
function admin() {
	var url = "<%=path%>/login.jsp";
	window.open(url, "_blank");
}

function liuyanAll() {
<c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path%>/liuyan?type=liuyanAll";
				var targetWinName="newWin";
				var features="width="+screen.width-200+" ,height="+screen.height-150+" ,toolbar=no, top=0, left=0, menubar=no, scrollbars=yes, resizable=no,location=no, status=no"
				var new_win=window.open(url,targetWinName,features);
            </c:if>
         } 
          
         
          
         
         function mycart()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path%>/order?type=mygouwuche";
                window.open(url,"_self");
            </c:if>
         } 
         
         
         
         function myorder()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path%>/buy?type=myorder";
                window.open(url,"_self");
            </c:if>
         } 
         
         
      </script>
		
		
		
		
		<link href="<%=webpath%>/css/style.css" rel="stylesheet" type="text/css">

<script src="<%=webpath%>/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=webpath%>/js/common.js"></script>
<script type="text/javascript" src="<%=webpath%>/js/global.js"></script>
  
<script type="text/javascript" src="<%=webpath%>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=webpath%>/js/jquery.json-2.4.min.js"></script>
</head>
<body>
  <link href="<%=webpath%>/css/lanrenzhijia.css" rel="stylesheet" type="text/css">
 
<div class="top" id="top_nav" style="z-index:9999;position:fixed;width: 100%;">
  <div class="main_1200">
    <div class="welcome"> </div>
    <div class="f_r log">  <script type="text/javascript" src="<%=webpath%>/js/utils.js"></script>      <ul>
        <font id="ECS_MEMBERZONE"><div id="append_parent"></div>
 您好，网上书城欢迎您&nbsp;&nbsp;&nbsp;&nbsp;
 
 
 
 <c:if test="${sessionScope.user==null}">
				 <a href="<%=path%>/order?type=login" rel="nofollow">登录</a>｜
                 <a href="<%=path%>/order?type=register" rel="nofollow">免费注册</a>
			</c:if>
			
			
  <c:if test="${sessionScope.user!=null}">
				${sessionScope.user.loginname }｜
				 <a href="<%=path%>/user?type=userInfo" rel="nofollow">用户中心</a>｜
                 <a href="<%=path%>/user?type=userLogout" rel="nofollow">退出</a>
			</c:if>

 
 
 
 
 
 
 
 ｜客服热线:<strong style="color:#c9151e;">4008166188</strong>
 <!-- <strong style="color:#c9151e;">4008166188</strong> --> 
 </font>
      </ul>
    </div>
  </div>
</div>
<div class="top">
  <div class="main_1200">
 
  </div>
</div>
<div class="main_1200"> </div>
<div class="block header_bg">
  <div class="f_l" style="width:150px;"> <a href="#" name="top"><img src="<%=webpath%>/images/logo.jpg" usemap="#Map" style="float:left;" border="0"> </a> </div>
  <div id="search" class="clearfix">
    <script type="text/javascript">
    
      // <!--
    function checkSearchForm()
    {
        if(document.getElementById('queryname').value)
        {
            return true;
        }
        else
        {
           alert("请输入搜索关键词！");
            return false;
        }
    }   // -->
    
    </script>
    <form id="ThisForm1" name="ThisForm1" method="post"
					action="<%=path%>/goods?type=goodsByName">
      <div class="i-search ld">
        <div class="form">
          <input class="text1" name="queryname" type="text" id="queryname" value="">
          <input name="imageField" type="submit" value="搜 索" class="button1">
        </div>
      </div>
      <div class="hot_search"> 
      </div>
    </form>
  </div>
</div>
<div id="mainNav" class="clearfix">
  <div class="clearfix_c">
 
 
    <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;">
                 <a class="a1" href="<%=path %>/index">首页</a>
    </ul>
    <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;">
                 <a class="a1" href="<%=path %>/goods?type=goodsindex">图书</a>
    </ul>
    <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;">
           <a class="a1" href="#" onclick="myorder()"> 我的订单</a>
    </ul>
        <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;">
            <a class="a1" href="#" onclick="mycart();"> 购物车</a>
    </ul>
     <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;" >
            <a class="a1" href="<%=path%>/gonggao?type=gonggaoManaQian"> 书城公告</a>
    </ul>
        <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;" >
            <a class="a1" href="<%=path%>/liuyan?type=liuyanAll"> 投诉建议</a>
    </ul>
        <ul class="u1" onmouseover="this.className=&#39;u1 u1_over&#39;" onmouseout="this.className=&#39;u1&#39;">
            <a class="a1" href="#" onclick="admin()"> 后台登录</a>
    </ul>
         
        <div class="meun_float">
      
      </div>
    </div>
  </div>
 
		
		
		
		
		
</html>
