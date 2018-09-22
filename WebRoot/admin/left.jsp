<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String applicationPath = basePath + "/" + "application";
%>
<html>
	<head>
		<title>菜单左侧页面</title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}

.STYLE3 {
	font-size: 12px;
	color: #033d61;
}

-->
.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #ffffff;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #FFCC00;
	POSITION: relative;
	TOP: 2px
}
</style>


		<table width="165" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="28" background="images/main_40.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="19%">
								&nbsp;
							</td>
							<td width="81%" height="20">
								<span class="STYLE1">管理菜单</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<table width="151" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="23" background="images/main_47.gif" id="imgmenu1"
											class="menu_title"
											onMouseOver="this.className='menu_title2';"
											onClick="showsubmenu(1)"
											onMouseOut="this.className='menu_title';"
											style="cursor: hand">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="18%">
														&nbsp;
													</td>
													<td width="82%" class="STYLE1">
														基本信息管理
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td background="images/main_51.gif" id="submenu1">
											<div class="sec_menu">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path %>/admin/userinfo/userPw.jsp" target="mainFrame">修改个人密码</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																 
																
															</table>
														</td>
													</tr>
													<tr>
														<td height="5">
															<img src="images/main_52.gif" width="151" height="5" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>

								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="23" background="images/main_47.gif" id="imgmenu2"
											class="menu_title"
											onmouseover="this.className='menu_title2';"
											onclick="showsubmenu(2)"
											onmouseout="this.className='menu_title';"
											style="cursor: hand">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="18%">
														&nbsp;
													</td>
													<td width="82%" class="STYLE1">
														菜单管理
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td background="images/main_51.gif" id="submenu2">
											<div class="sec_menu">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path %>/catelog?type=catelogMana" target="mainFrame">图书类别管理</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td height="23">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path%>/goods?type=goodsMana" target="mainFrame">图书信息管理</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																 
																
															</table>
														</td>
													</tr>
													<tr>
														<td height="5">
															<img src="images/main_52.gif" width="151" height="5" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="23" background="images/main_47.gif" id="imgmenu3"
											class="menu_title"
											onmouseover="this.className='menu_title2';"
											onclick="showsubmenu(3)"
											onmouseout="this.className='menu_title';"
											style="cursor: hand">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="18%">
														&nbsp;
													</td>
													<td width="82%" class="STYLE1">
														会员管理
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td background="images/main_51.gif" id="submenu3"
											>
											<div class="sec_menu">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path%>/user?type=userMana" target="mainFrame">会员管理</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																 
																
															</table>
														</td>
													</tr>
													<tr>
														<td height="5">
															<img src="images/main_52.gif" width="151" height="5" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="23" background="images/main_47.gif" id="imgmenu3"
											class="menu_title"
											onmouseover="this.className='menu_title2';"
											onclick="showsubmenu(3)"
											onmouseout="this.className='menu_title';"
											style="cursor: hand">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="18%">
														&nbsp;
													</td>
													<td width="82%" class="STYLE1">
														公告管理
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td background="images/main_51.gif" id="submenu3"
											>
											<div class="sec_menu">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path%>/gonggao?type=gonggaoMana" target="mainFrame">公告管理</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																 
																
															</table>
														</td>
													</tr>
													<tr>
														<td height="5">
															<img src="images/main_52.gif" width="151" height="5" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						
							<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="23" background="images/main_47.gif" id="imgmenu4"
											class="menu_title"
											onmouseover="this.className='menu_title2';"
											onclick="showsubmenu(4)"
											onmouseout="this.className='menu_title';"
											style="cursor: hand">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="18%">
														&nbsp;
													</td>
													<td width="82%" class="STYLE1">
														订单管理
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td background="images/main_51.gif" id="submenu4"
											 >
											<div class="sec_menu">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path%>/order?type=orderMana" target="mainFrame">订单管理</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																 <tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path%>/order?type=report" target="mainFrame">销量排行榜</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																
															</table>
														</td>
													</tr>
													<tr>
														<td height="5">
															<img src="images/main_52.gif" width="151" height="5" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
								<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="23" background="images/main_47.gif" id="imgmenu5"
											class="menu_title"
											onmouseover="this.className='menu_title2';"
											onclick="showsubmenu(5)"
											onmouseout="this.className='menu_title';"
											style="cursor: hand">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="18%">
														&nbsp;
													</td>
													<td width="82%" class="STYLE1">
														投诉建议管理
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td background="images/main_51.gif" id="submenu5"
											 >
											<div class="sec_menu">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="16%" height="25">
																		<div align="center">
																			<img src="images/left.gif" width="10" height="10" />
																		</div>
																	</td>
																	<td width="84%" height="23">
																		<table width="95%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="20" style="cursor: hand"
																					onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																					onmouseout="this.style.borderStyle='none'">
																					<span class="STYLE3"><a href="<%=path%>/liuyan?type=liuyanMana" target="mainFrame">投诉建议管理</a></span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																 
																
															</table>
														</td>
													</tr>
													<tr>
														<td height="5">
															<img src="images/main_52.gif" width="151" height="5" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						 
						
						
						 
						
						
						
						
					</table>
				</td>
			</tr>
			<tr>
				<td height="18" background="images/main_58.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="18" valign="bottom">
								<div align="center" class="STYLE3">
									版本：2016 V1.0
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<script>




function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="images/main_47.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="images/main_48.gif";
}
}

</script>