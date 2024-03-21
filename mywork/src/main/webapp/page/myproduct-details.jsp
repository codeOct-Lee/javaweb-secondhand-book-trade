
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>更新商品</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fav Icon
    ============================================ -->
    <link id="favicon" rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.ico" />
    <!-- Style Import CSS
    ============================================ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

</head>


<body>
<%@ include file="/page/header.jsp"%>

<!-- Shop Sidebar Product Container
============================================ -->
<div class="blog-page pages">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">


                <div class="blog-comments fix">


                    <div class="comment-form">
                        <h2>更新商品</h2>
                        <form  id="userUpdateProductForm"  action="${pageContext.request.contextPath}/product/userUpdateProduct.do" class="moon-form" method="post">
                            <%-- 不予修改的表项 --%>
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="hidden" name="user_id" value="${product.user_id}">
                            <input type="hidden" name="start_time" value="${product.start_time}">
                            <input type="hidden" name="status" value="${product.status}">
                            <input type="hidden" name="image" value="${product.image}">

                            <div class="input-box">
                                商品名称：
                                <input type="text" value="${product.name}" name="name" id="name">
                            </div>

                            <div class="input-box ">
                                商品类别：

                                 <select name="caid">
                                    <c:forEach items="${cLists}" var="category">
                                        <c:if test="${product.caid == category.cid}">
                                            <option value="${category.cid}" selected="selected">${category.cname}</option>
                                        </c:if>
                                        <c:if test="${product.caid != category.cid}">
                                            <option value="${category.cid}" >${category.cname}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>

                            </div>

                            <div class="input-box ">
                                商品价格：
                                <input type="text" value="${product.price}" name="price" id="price">
                            </div>

                            <div class="input-box ">
                                商品详情：
                                <input type="text" value="${product.describle}" name="describle" id="describle">
                            </div>

                            <div class="input-box ">
                                更新商品图片：
                                <input type="file" placeholder="商品图片" name="images" id="images" value="zhifuba">
                            </div>


                            <div class="input-box">
                                <input type="submit" value="更新">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%-- 这两个JS用于菜单栏的搜索： --%>
<!-- MeanMenu JS
============================================ -->
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.meanmenu.min.js"></script>
<!-- Main JS
============================================ -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>


</body>
</html>
