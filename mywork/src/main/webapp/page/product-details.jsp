
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en-US">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>商品详情</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fav Icon
    ============================================ -->
    <link id="favicon" rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.ico" />
    <!-- Google web fonts
    ============================================ -->
    <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,400italic,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,700italic,900italic,900,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- Style Import CSS
    ============================================ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <!-- RS-slider CSS
    ============================================ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/rs-plugin/css/settings.css" media="screen" />

    <!-- Modernizr JS
    ============================================ -->
    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<%@include file="/page/header.jsp"%>
<!-- Product Details 1
============================================ -->
<div class="product-details pages">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- Product Container -->
                <div class="pro-info-container fix">
                    <!-- Product Info -->
                    <div class="product-info col-md-6 col-xs-12">
                        <!-- Product Info Cat -->
                        <div class="pro-info-cat"><p></p></div>
                        <!-- Product Info Title Ratting -->
                        <div class="pro-title-rating fix">
                            <h2>${productBypid.name}</h2>
                            <div class="ratting pro-info-ratting float-right">
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                            </div>
                        </div>
                        <!-- Product Info Tab List -->
                        <ul class="pro-info-tab-list">
                            <li class="active"><a href="#description" data-toggle="tab">详情</a></li>
                            <li><a href="#reviews" data-toggle="tab">评论</a></li>
                            <li><a href="#userInfomation" data-toggle="tab">卖家信息</a></li>
                        </ul>
                        <!-- Product Info Tab container -->
                        <div class="pro-info-tab-container tab-content fix">
                            <!-- Product Info Tab -->
                            <div class="pro-info-tab tab-pane active" id="description">
                                <p>${productBypid.describle}</p>

                                <div class="pro-color-size fix">
                                    <div class="pro-color">
                                    </div>
                                    <div class="pro-size">

                                    </div>
                                </div>
                                <div class="pro-info-price fix">
                                    <h1 class="new">￥ ${productBypid.price}</h1>
                                </div>
                                <div class="pro-info-quantity-cart fix">
                                    <a href="${pageContext.request.contextPath}/concern/addconern.do?pid=${productBypid.id}"><button class="pro-info-addcart"  >点击关注</button></a>
                                    <a href="${pageContext.request.contextPath}/product/confirmBuy.do?pid=${productBypid.id}"><button class="pro-info-addcart">点击购买</button></a>
                                </div>
                                <div class="pro-info-quantity-cart fix">


                                </div>
                            </div>

                            <!-- Product Review Tab -->
                            <div class="pro-review-tab tab-pane" id="reviews">
                                <div class="pro-review-container">
                                    <c:forEach items="${comments}" var="commment">
                                    <div class="sin-pro-review">
                                        <div class="rev-image float-left">
                                            <img src="${pageContext.request.contextPath}/img/comments/1.png" alt="" />
                                        </div>
                                        <div class="rev-content fix">
                                            <div class="rev-head">

                                                <h3>${commment.user.username}</h3>
                                                <span>${commment.create_at}</span>


                                            </div>
                                            <p>${commment.content}</p>
                                            <c:if test="${commment.user_id eq userLogin.user_id}">
                                                <a onclick="deleteComments('${commment.id}','${productBypid.id}')"> <h4>删除</h4></a>
                                            </c:if>
                                        </div>
                                    </div>
                                    </c:forEach>

                                </div>

                                <div class="pro-rev-form fix">
                                    <h2>请输入评论</h2>
                                    <form action="${pageContext.request.contextPath}/comments/addComments.do" id="contentForm" class="moon-form" method="post">
                                        <input type="hidden" value="${productBypid.id}" name="pid">

                                        <div class="input-box">
                                            <textarea name="content" id="content" placeholder="Message" rows="5"></textarea>
                                        </div>
                                        <div class="input-box">
                                            <input type="submit" value="评论">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="pro-info-tab tab-pane " id="userInfomation">

                                <div class="pro-color-size fix">
                                    <div class="pro-color">
                                        <h4>卖家:</h4>
                                        <ul>
                                            <li>来自${productBypid.yuanxi.yname}的${productBypid.user.username}</li>

                                        </ul>
                                    </div>
                                    <div class="pro-size">
                                        <h4>联系电话:</h4>
                                        <ul>
                                            <li>${productBypid.user.telephone}</li>
                                        </ul>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>


                    <!-- Product Image -->
                    <div class="product-image col-md-6 col-xs-12">
                        <!-- Product Image Tab container -->
                        <div class="pro-image-tab-container tab-content fix">
                            <!-- Product Image Tab -->
                            <div class="pro-image-tab tab-pane" id="image-1">
                                <img src="${pageContext.request.contextPath}/product/${productBypid.image}" alt="" />
                            </div>
                            <div class="pro-image-tab tab-pane active" id="image-2">
                                <img src="${pageContext.request.contextPath}/product/${productBypid.image}" alt="" />
                            </div>
                            <div class="pro-image-tab tab-pane" id="image-3">
                                <img src="${pageContext.request.contextPath}/product/${productBypid.image}" alt="" />
                            </div>
                            <div class="pro-image-tab tab-pane" id="image-4">
                                <img src="${pageContext.request.contextPath}/product/${productBypid.image}" alt="" />
                            </div>
                        </div>
                        <!-- Product Image Tab List -->
                        <ul class="pro-image-tab-list">

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- Footer Area
============================================ -->
<%--<div class="footer-area">--%>
<%--    <!-- Footer Top -->--%>
<%--    <div class="footer-top">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <!-- Footer Widget About -->--%>
<%--                <div class="footer-widget footer-widget-about col-md-3 col-sm-5">--%>
<%--                    <img src="${pageContext.request.contextPath}/img/footer-logo.png" alt="" />--%>
<%--                    <p>Lorem ipsum dolor sit amet, consec adipisicing elit, sed do eiusmod empor incididunt oloremque laudantium,</p>--%>
<%--                    <div class="footer-social">--%>
<%--                        <a href="#"><i class="mo-facebook"></i></a>--%>
<%--                        <a href="#"><i class="mo-twitter"></i></a>--%>
<%--                        <a href="#"><i class="mo-google-plus"></i></a>--%>
<%--                        <a href="#"><i class="mo-pinterest"></i></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- Footer Widget Address -->--%>
<%--                <div class="footer-widget footer-widget-address col-md-2 col-md-offset-1 col-sm-5 col-sm-offset-2">--%>
<%--                    <h3>address</h3>--%>
<%--                    <p>1025-1035 Park Ave, <br />New York, <br />NY 10028, USA</p>--%>
<%--                    <p>+1 123-456-7890</p>--%>
<%--                    <p>sales@koolinc.com</p>--%>
<%--                </div>--%>
<%--                <!-- Footer Widget Collection -->--%>
<%--                <div class="footer-widget footer-widget-collection col-md-2 col-md-offset-1 col-sm-5">--%>
<%--                    <h3>collection</h3>--%>
<%--                    <ul>--%>
<%--                        <li><a href="#">Men</a></li>--%>
<%--                        <li><a href="#">Women</a></li>--%>
<%--                        <li><a href="#">Kids</a></li>--%>
<%--                        <li><a href="#">Accessories</a></li>--%>
<%--                        <li><a href="#">Sale</a></li>--%>
<%--                        <li><a href="#">Coming Soon</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <!-- Footer Widget Shop -->--%>
<%--                <div class="footer-widget footer-widget-shop col-md-2 col-md-offset-1 col-sm-5 col-sm-offset-2">--%>
<%--                    <h3>shop</h3>--%>
<%--                    <ul>--%>
<%--                        <li><a href="single-page.html">About Us</a></li>--%>
<%--                        <li><a href="single-page.html">Shipping Methods</a></li>--%>
<%--                        <li><a href="single-page.html">Career</a></li>--%>
<%--                        <li><a href="contact.html">Contact</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- Footer Bottom -->--%>
<%--    <div class="footer-bottom">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <!-- Footer Copyright -->--%>
<%--                <div class="copyright col-sm-6 text-left"><p>&copy; 2016 <a href="#">wilylab</a>. All Rights Reserved</p></div>--%>
<%--                <!-- Footer Payment -->--%>
<%--                <div class="payment col-sm-6 text-right"><img src="${pageContext.request.contextPath}/img/payment.png" alt="payment" /></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- jQuery 1.12.0
============================================ -->
<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.3.min.js"></script>
<!-- Bootstrap JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- MeanMenu JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.meanmenu.min.js"></script>
<!-- Slick Carousel JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slick.min.js"></script>
<!-- RS-Plugin JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/rs-plugin/rs.home.js"></script>
<!-- Scrollup JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.scrollup.min.js"></script>
<!-- jQuery UI JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<!-- Tree View JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.treeview.js"></script>
<!-- Nice Scroll JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
<!-- WOW JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<!-- Google Map APi
============================================ -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBuU_0_uLMnFM-2oWod_fzC0atPZj7dHlU"></script> -->
<script>
    new WOW().init();
</script>
<!-- Main JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>

<script type="text/javascript">

        $(function(){
            $("#contentForm").validate({
                rules:{
                    "content":{
                        "required":true
                        //"checkUsername":true
                    }


                },
                messages:{
                    "content":{
                        "required":"评论不能为空",

                    },

                }
            });
        });


    
    function deleteComments(id,pid) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/comments/deleteComments.do",
            data: {"id":id},
            dataType: "json",
            async: false,
            success: function(data){
                var flag=data.flag;
                var msg=data.msg;
                if(flag=="1"){
                    alert(msg) ;
                    window.location.href="${pageContext.request.contextPath}/product/getProductBypid.do?pid="+pid;

                }else if(flag=="2"){
                    alert(msg)
                }else {
                    alert(系统错误);
                }
            }
        });
    }

</script>
</body>
</html>
