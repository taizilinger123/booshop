<%@ page language="java" import="java.util.*,java.sql.*,com.dao.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/catelog?type=catelogUpdate" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#11a8f1" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">&nbsp;图书类别&nbsp;</td>
						</tr>
							
						<%
			 
				DB dbm = new DB();
				Connection conn1 = dbm.getCon();
				String id = request.getParameter("id");
				String sql = "select * from t_catelog where id='" + id + "'";
				PreparedStatement stat1 = conn1.prepareStatement(sql);
				ResultSet rs1 = stat1.executeQuery();
				rs1.next();
			%>
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         一级类别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select name="fid">
						          <option value="0">请选择</option>
						                  <%
							
							 
								String sql1 = "select * from t_catelog where fid = 0 ";
								Connection conn = dbm.getCon();
								PreparedStatement stat = conn.prepareStatement(sql1);
								ResultSet rs = stat.executeQuery();
								while(rs.next()){
				               %>
				                  <option  <% if(rs.getInt("id")==rs1.getInt("fid")){%> selected <%} %>    value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
				               <%
				              }
				              
				              
				              
				              
				              if (rs != null)
					rs.close();
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			                %>
						             
						    
						             
						             
						             
						       </select>
						  
						       
						        
                             
						    </td>
						</tr>
					
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         类别名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="name" size="40" value="<%=rs1.getString("name") %>"/>
						         <input type="hidden" name="id" size="60" value="<%=id %>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
			<%
				if (rs1 != null)
					rs1.close();
				if (stat1 != null)
					stat1.close();
				if (conn1 != null)
					conn1.close();
			%>
   </body>
</html>
