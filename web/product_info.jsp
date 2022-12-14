<%--
  Created by IntelliJ IDEA.
  User: zl520
  Date: 2019/9/4
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品列表</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.js"></script>


</head>

<body>

<div class="row" style="width:100%;margin:0 auto;">
    <div class="col-md-2 col-sm-0 col-xs-0"></div>
    <div class="col-md-8 col-sm-12 col-xs-12">
            <div class="col-md-12" style="padding-top: 10px;">
                <nav class="navbar navbar-default" style="border: 0px;">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="${pageContext.request.contextPath}/product?method=product_page&pagenumber=1">首页</a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <c:if test="${not empty sessionScope.user}">
                                    <li><a href="#">用户：${sessionScope.user.username}</a></li>
                                </c:if>
                                <c:if test="${empty sessionScope.user}">
                                    <li><a href="${pageContext.request.contextPath}/user?method=login">登陆</a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath}/user?method=register">注册</a></li>
                                <li><a href="${pageContext.request.contextPath}/product?method=cart">购物车</a></li>
                                <li><a href="${pageContext.request.contextPath}/order?method=orderList">订单</a></li>
                                <li><a href="${pageContext.request.contextPath}/user?method=quitLogin">退出</a></li>
                                <li><a href="${pageContext.request.contextPath}/company?method=toCompanyInfo">公司介绍</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>

                <div class="page-header">
                    <font color="#00bfff" size="4">商品详情</font>
                    <font size="2">PRODUCT INFORMATION</font>
                </div>
            </div>
        <c:if test="${not empty pro}">
            <div class="col-md-12" style="margin:0 auto;">
                <div class="col-md-2 col-sm-0 col-xs-0"></div>
                <div class="col-md-8 col-sm-12 col-xs-12" >
                        <div class="col-md-6 col-sm-6 col-xs-12" style="text-align: center;padding:0 0 0 0 ">
                            <img style="height: 310px;width: 310px" src="${pageContext.request.contextPath}/${pro.pimage}">

                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12" style="padding: 0 0 0 0">
                            <div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <br>
                                    <div><strong>${pro.pname}</strong></div>
                                    <div style="border-bottom: 1px dotted #dddddd;margin:10px 0 10px 0;">
                                        <div>编号：${pro.pid}</div>
                                    </div>
                                    <div style="margin:10px 0 10px 0;">价格: <strong style="color:#ef0101;">￥：${pro.price}元/份</strong> <br>
                                    </div>

                                    <div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2019-11-11)" style="background-color: #f07373;">限时抢购</a> </div>
                                </div>

                                <div class="col-md-12 col-sm-12 col-xs-12" style="padding:10px;border:1px solid #e7dbb1;margin:15px 0 10px 0;;background-color: #fffee6;">
                                    <div style="margin:5px 0 10px 0;">类别：
                                        <c:choose>
                                            <c:when test="${pro.category=='1'}">
                                                蛋糕
                                            </c:when>
                                            <c:when test="${pro.category=='2'}">
                                                面包
                                            </c:when>
                                            <c:when test="${pro.category=='3'}">
                                                饼干
                                            </c:when>
                                            <c:when test="${pro.category=='4'}">
                                                冰淇淋
                                            </c:when>
                                            <c:when test="${pro.category=='5'}">
                                                奶茶
                                            </c:when>
                                            <c:when test="${pro.category=='6'}">
                                                咖啡
                                            </c:when>
                                            <c:when test="${pro.category=='7'}">
                                                汽水
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/cart?method=addCart" method="post">
                                        <input type="hidden" name="pid" value="${pro.pid}">
                                        <div style="border-bottom: 1px solid #faeac7;margin-top:20px;">购买数量:
                                            <input id="quantity" name="count" value="1" maxlength="4" size="10" type="text">
                                        </div>

                                        <div style="margin:20px 0 10px 0;;text-align: left;">
                                            <a href="cart.htm">
                                                <input style="background: url('./images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="submit">
                                            </a>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                </div>
                <div class="col-md-2 col-sm-0 col-xs-0"></div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12" style="margin:0 auto;width:100%;">
                <div class="col-md-2 col-sm-0 col-xs-0"></div>
                <div class="col-md-8 col-sm-12 col-xs-0" style="margin:0 auto;">
                    <div style="height:20px;"></div>
                    <ul class="breadcrumb">
                        <li><font color="#00bfff">商品描述</font></li>
                    </ul>
                    ${pro.pdesc}
                </div>
                <div class="col-md-2 col-sm-0 col-xs-0"></div>

            </div>
        </c:if>
        <c:if test="${empty pro}">
            <center><h2><font color="red">没有商品</font></h2></center>
        </c:if>
    </div>
    <div class="col-md-2 col-sm-0 col-xs-0"></div>
</div>


</body>

</html>
