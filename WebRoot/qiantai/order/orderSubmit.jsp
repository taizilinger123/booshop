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
	 
	<body>

		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>


		<div class="blank"></div>




		<div class="block">
  <div class="box">
   <div class="box_1">
    <h3><span>系统信息</span></h3>
    <div class="boxCenterList RelaArticle" align="center">
      <div style="margin:20px auto;">
      <p style="font-size: 14px; font-weight:bold; color: red;">恭喜您，订单提交成功</p>
        <div class="blank"></div>
                            <p><a href="#"></a></p>
                        </div>
    </div>
   </div>
  </div>
</div>









		<div class="blank"></div>
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>
</html>
