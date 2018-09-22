<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
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
<LINK href="<%=path%>/css/css.css" type=text/css rel=stylesheet>
</head>

<BODY text=#000000 leftMargin=0 topMargin=0>
	<div class="wrap">
		<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0
			background="<%=path%>/img/reservation01.gif">
			<TR height="90">
				<TD align="center"><jsp:include flush="true"
						page="/qiantai/inc/incTop.jsp"></jsp:include></TD>
			</TR>
		</TABLE>


		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>

		<TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0
			cellPadding=0 width="100%" align=center border=0>
			<TR>

				<TD class=Side vAlign=top align=right width="75%">
					<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%"
						border=0>
						<TR>
							<TD class=head><SPAN class=TAG>联系我们</SPAN></TD>
						</TR>
						<TR align="left">
							<TD height="5"></TD>
						</TR>
						<TR align="left" height="527">
							<TD align="left">&nbsp;&nbsp;全国加盟热线400-844-5177 <br />
								&nbsp;&nbsp;邮箱：sumys333@163.com<br />
								&nbsp;&nbsp;华发分店电话：18840832830<br />
								&nbsp;&nbsp;华发分店地址：大连市旅顺口区经济开发区兴发路195-34号<br />
								&nbsp;&nbsp;邮编：116052<br />



							</TD>
						</TR>
						<TR align="left">
							<TD height="5"></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</div>
</BODY>
</html>
