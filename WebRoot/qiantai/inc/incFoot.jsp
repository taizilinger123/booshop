<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String webpath = path + "/qiantai";
%>

<div class="footer_box" style="width:100%;">
</div>
<style type="text/css">
/*底部*/
.link_all{border:1px solid #ddd; border-top:none; width:1198px; margin:0 auto;}
.link_all h3{padding-left:10px;}
.link_all ul{display:block; padding:15px; font-size:14px;}
.link_all ul a{margin:0 8px;}
 
.footer_c{
width:1200px;
margin:0 auto;
overflow:hidden;
height:100%;
}
.footer_cl{
width:170px;
float:left;
}
.footer_cr{
width:990px;
/*float:right;*/
}
.footer_cr ul{
width:176px;
padding-bottom:10px;
margin-top:10px;
float:left;
}
.footer_cr ul h1{
height:26px;
line-height:26px;
color:#fff;
font-size:16px;
font-weight:bold;
padding-left:30px;
margin-bottom:10px;
}
 
.footer_cr ul li{
}
.footer_cr ul li a{
  clear:both;
height:24px;
padding-left:30px;
line-height:24px;
color:#fff !important;
}
.footer_cr ul li a:hover{
text-decoration:underline;
}
.footer_b{
width:100%;
height:160px;
background:#eeeded;
}
.footer_bc{
margin-top:20px;
width:400px;
margin:0 auto;
}
.footer_bc dl{
height:80px;
width:130px;
float:left;
}
.footer_bc dl dd{
height:80px;
width:50px;
float:left;
}
 
.footer_bc dl dt{
margin-top:15px;
height:65px;
width:65px;
float:left;
}
.footer_bc dl dt p{
line-height:24px;
font-size:16px;
}
.footer_bb{
width:780px;
margin:0 auto;
}
.f_p{
margin-left:30px;
margin-top: 15px;
}
</style>
<div class="footer" style="overflow:hidden;">
      <div class="footer_c">
        <div class="footer_cr">
                    <ul>
            <h1 class="guide1">购物指南</h1>
                         <li><a href="#" title="购物流程">购物流程</a></li>            
                                    <li><a href="#" title="友情链接">友情链接</a></li>
                      </ul>
                  <ul>
            <h1 class="guide2">配送方式</h1>
                         <li><a href="#" title="送货上门">送货上门</a></li>            
                                  </ul>
                  <ul>
            <h1 class="guide3">支付方式</h1>
                         <li><a href="#" title="货到付款">货到付款</a></li>            
                                  </ul>
                  <ul>
            <h1 class="guide4">售后服务</h1>
                         <li><a href="#" title="关于我们">关于我们</a></li>            
                        <li><a href="#" title="联系客服">联系客服</a></li>            
                                  </ul>
                    <ul>
              <div style="width:220px;">
              <span style="display:block;height:30px;color:#fff;font-size:24px;line-height:24px;padding-left:35px;">联系我们</span>
              <span style="line-height:45px;color:#F9FFB9;font-size:30px;font-weight:bold;margin-top:10px;">4008166188</span>
              </div>
   
          </ul>   
          </div>
      </div>    
    </div>
<div id="footer" style="padding:20px 0; font-size:14px !important; line-height:30px;">
 <div class="text" style="margin:0 auto;text-align:center;">
  Copyright © 2018 网上书城  版权所有 <br>
 
  ICP备案证书号:京ICP备123456789号-1<br>
  <a target="_blank" href="#" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="<%=webpath%>/images/beian.png" style="float:left;">京公网安备123456789号</a><br>
 
 
 
 </div>
</div>
 
<div id="compareBox" align="center" style="display: none; top: 200px;"><ul id="compareList"></ul><input type="button" value=""></div>
