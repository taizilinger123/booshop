<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	 
	<body>

		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>


		<div class="blank"></div>




		<div >
   <div class="box">
  
    <div class="boxCenterList">
          <form action="" name="search_form" method="post" class="article_search">
       
      </form>
      <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
      <tbody><tr>
        <th bgcolor="#ffffff">文章标题</th>
         
          <th bgcolor="#ffffff">添加日期</th>
        </tr>
        
        <c:forEach items="${gonggaoList}" var="gonggao" >
            <tr>
        <td bgcolor="#ffffff"><a target="_blank" href="<%=path %>/gonggao?type=gonggaoDetailQian&id=${gonggao.id}"  class="f6"> ${gonggao.title}</a></td>
         
          <td bgcolor="#ffffff" align="center">${gonggao.shijian}</td>
        </tr>
        </c:forEach>
         
          </tbody></table>
    
   </div>
  </div>
  <div class="blank5"></div>
 
<script type="Text/Javascript" language="JavaScript">
<!--
function selectPage(sel)
{
  sel.form.submit();
}
//-->
</script>
  </div>









		<div class="blank"></div>
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>
</html>
