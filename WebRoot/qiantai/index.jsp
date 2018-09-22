<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String webpath = path + "/qiantai";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>网上书城</title>
 
</head>
<body>
   <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 

<div class="totop">
      <div id="top">
    TOP
      </div>      
</div>
<script type="text/javascript">
$(document).ready(function(){
$('#top').click(function(){$('html,body').animate({scrollTop:'0px'},500);return false;});
});
</script>

 <script type="text/javascript">
	        function buy1(goodid)
	        {
	        
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user!=null}">
		            document.getElementById("goods_id").value = goodid;
		            document.buy.submit();
	            </c:if>
	        }
	</script>
<div class="blank"></div>
 
 
 <div class="block clearfix">
  <div class="box clearfix" style="margin-top:15px;">
    <script language="javascript" type="text/javascript" src="./麻小外卖_files/jquery.tools.min.js"></script>
    <style>
.indexFocus {width:1200px;height:320px;  margin:0 auto;position: relative; overflow:hidden}
#focusPicList {overflow: hidden;position: relative;}
#focusPicList li {display: none;}
#focusPicList li.active {display: block;}
.indexFocus #picBtn {position: absolute;right:10px;top:288px;line-height:18px;z-index: 3;}
.indexFocus #picBtn span {margin-right:10px;width:18px; height:18px;border-radius: 15px; font-size:0; background: #cacaca;display:block; float:left;color: #FFF;cursor: pointer;font-family: Verdana;font-size: 0; overflow: hidden;}
.indexFocus #picBtn span.current {background: #c00;}
.scroll_div   {float:left;z-index:9999;position: absolute; font-size: 44px;color: #000;line-height: 55px;height: 52px;width: 1200px;overflow: hidden;white-space: nowrap;}
#scroll_begin, #scroll_end, #scroll_begin ul, #scroll_end ul, #scroll_begin ul li, #scroll_end ul li{display:inline;}
.goodsBox .goodsItem3 {
width: 560px!important;
float: left;
padding-right: 25px;
text-align: center;
}
</style>
<div class="scroll_div" id="scroll_div">
  <div id="scroll_begin">
    <ul>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>
    <div id="scroll_end">
    <ul>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>
</div>
<script language="javascript">
function ScrollImgLeft(){
  var speed = 20;
  var scroll_begin = document.getElementById("scroll_begin");
  var scroll_end = document.getElementById("scroll_end");
  var scroll_div = document.getElementById("scroll_div");
  scroll_end.innerHTML = scroll_begin.innerHTML
  function Marquee() {
    if (scroll_end.offsetWidth-scroll_div.scrollLeft<=0)
      scroll_div.scrollLeft-=scroll_begin.offsetWidth
    else
       scroll_div.scrollLeft++
  }
  var MyMar=setInterval(Marquee,speed)
  scroll_div.onmouseover=function() {clearInterval(MyMar)}
  scroll_div.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
}
ScrollImgLeft();
</script>
    <div id="focus">
      <div class="indexFocus">
        <ul id="focusPicList">
                    <li style="display: inline;"><a href="#" target="_blank"><img src="<%=webpath%>/images/1442259738304706843.jpg"   height="320" width="1200"></a><span></span></li>
                     
                  </ul>
       
        <script type="text/javascript">
			$(function() {
				for (i = 1; i <= $("#focusPicList > li").length; i++ ){
					$("#picBtn").append('<span>'+i+'</span>');
				}
				$("#picBtn").tabs("#focusPicList > li", {effect: 'fade', event: 'mouseover', rotate: true, tabs: 'span'}).slideshow({autoplay: true, interval:4000});
});
			</script>
      </div>
    </div>
  </div>
  <div class="blank"></div>
  <div class="box cat_goods">
    <h3> <em>1F</em> <span>
      <ul>
        <li class="name_img"> <a href="#">新书上架 </a> </li>
      </ul>
      </span> <!-- <a class="more"  href="search.php?intro=new">更多</a> --> </h3>
    <div class="box_1 cat_goods_box">
      <div class="clearfix goodsBox" style="border:none;">
      
      
      
      
       <c:forEach items="${requestScope.newList}" var="goods" varStatus="sta">
         
             <div class="" style="width:208px;float:left;margin-top:30px;margin-left:27px;text-align:center;">
              <div style="position:relative;">   
                <a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }&cid=${goods.catelog_id}" class="hot_pic" target="_blank">
                  <img style="width: 208px;height:208px;" src="<%=path %>/${goods.fujian }"  class="goodsimg">
                </a>
              <span style="height:48px;width:48px;display:block;position:absolute;top:-15px;right:0;z-index:2000;">
              </span>
              </div>  
              <p style="margin-top:8px;"><a style="display:block;height:30px;font-weight:bold;color: #3f3f3f;font-size:14px;text-align:left;" href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"  >${goods.mingcheng }</a></p>
              <font class="shop_s">${goods.shichangjia }元</font>
               <br>
               
               
               
               
                            <!--a href="javascript:addToCart1(58)" class="fs red_inp1">立即购买</a-->
              <a href="javascript:buy1(${goods.id })" class="fs red_inp2" id="gwc">加入购物车</a>
                           
            </div>
                                            
           </c:forEach>
           
       </div>
    </div>
  </div>
      
  <div class="blank"></div>
  <div class="box cat_goods">
    <h3> <em>2F</em> <span>
       <ul>
        <li class="name_img"> <a href="#" target="_blank">畅销图书 </a> </li>
      </ul>
      </span>   </h3>
    <div class="box_1 cat_goods_box">
      <div class="clearfix goodsBox" style="border:none;">
              
              
            <c:forEach items="${requestScope.topxlList}" var="goods" varStatus="sta">
         
         
         
              <div class="goodsItem">
          <div style="position:relative;"> <a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }&cid=${goods.catelog_id}" class="hot_pic" target="_blank"> <img src="<%=path %>/${goods.fujian }"   class="goodsimg"  > </a> <span style="height:48px;width:48px;display:block;position:absolute;top:-15px;right:0;z-index:2000;"></span> </div>
          <p class="f1" style="text-align:center;height: 36px;"><a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }&cid=${goods.catelog_id}" title="${goods.mingcheng }">${goods.mingcheng }</a></p>
          <p class="f1">已售出${goods.xl }本</p>
          <font class="f1">
                   ${goods.shichangjia }元                    </font>  </div>
                            
           </c:forEach>
           
           
              
              
              
             
                      </div>
    </div>
  </div>
   
  
  
<script type="text/javascript">
$(document).ready(function(){
  $('.goodsItem img').mouseover(function(){
      $(this).addClass("mhover");
  }).mouseout(function(){
      $(this).removeClass("mhover");
  });
})
</script>
</div>
 
 
  
<div class="blank"></div>
 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> 
 
 </body></html>