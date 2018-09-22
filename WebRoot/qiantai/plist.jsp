<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>   
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
  
  <div class="AreaL">
<div class="box">
 <div class="box_10">
  <div id="category_tree">
  
  
  
   <c:forEach items="${requestScope.oneList}" var="catelog">
   
         <dl>
     <dt><a href="<%=path %>/goods?type=goodsByCatelog&catelog_id=${catelog.id}">${catelog.name}</a></dt>
            
       </dl>
       
       
       </c:forEach>
       
     
  </div>
 </div>
</div>
 
  
  </div>
  
  
  <div class="AreaR">
   
       
   
<div class="box">
 <div class="box_1">
  <h3>
  <span>${names}</span>
  
  
  <a name="goods_list">
  
  <c:forEach items="${requestScope.twoList}" var="catelog">
    <a href="<%=path %>/goods?type=goodsByCatelog1&catelog_id=${catelog.id}&fid=${catelog.fid}">${catelog.name}</a>
  </c:forEach>
  </a>
 
  </h3>
      <form action="<%=path %>/buy?type=addToCart" method="post" name="buy">
        <div class="centerPadd">
          <div class="clearfix goodsBox" style="border:none;">
                    

<pg:pager url="goods" items="${itemSize}" maxPageItems="${pageItem}"
 maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"
 scope="request">
 <pg:param name="type" value="${qtype}" />
 



            <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta" begin="${offset}" end="${offset+pageItem-1}">
         
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

   <input name="goods_id" id="goods_id"   type="hidden"/> 
   <input name="quantity" value="1" type="hidden"/> 

                                  </div>
                                  
                                  
        </div>
        
        
            <pg:index>
			 <jsp:include page="/qiantai/pagination_tag.jsp" flush="true" />
		</pg:index>
         
       </pg:pager>   
      
      </form>
   </div>
</div>
<div class="blank5"></div>
<script type="text/javascript">
$(document).ready(function(){
  $('.goodsBox div img').mouseover(function(){
      $(this).addClass("mhover");
  }).mouseout(function(){
      $(this).removeClass("mhover");
  });
})
</script>
 

  
  </div>  
  
</div>
<div class="blank"></div>
 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> 
 
 </body></html>