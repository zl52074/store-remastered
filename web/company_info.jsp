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
    <title>公司详情</title>

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
                    <font color="#00bfff" size="4">公司详情</font>
                    <font size="2">COMPANY INFORMATION</font>
                </div>
            </div>
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin:0 auto;width:100%;">
            <div class="col-md-2 col-sm-0 col-xs-0"></div>
            <div class="col-md-8 col-sm-12 col-xs-0" style="margin:0 auto;">
                <div style="height:20px;"></div>
                <ul class="breadcrumb">
                    <li><font color="#00bfff">品牌详情</font></li>
                </ul>
                <h4 style="text-align:center">星星甜品</h4>
                <p>
                    甜品是现在市场上的大众美食产品，喜欢吃的消费者们更是不计其数，它的美食产品得到了美食爱好者们的认可。甜品的美食味道好，是因为它采用的制作原料都非常的新鲜，这样制作出来的甜品自然是十分美味啦!甜品的每一份美食都健康美味，带给食客与众不同的味蕾震撼。
                </p>
            </div>
            <div class="col-md-2 col-sm-0 col-xs-0"></div>

        </div>

        <div class="col-md-12 col-sm-12 col-xs-12" style="margin:0 auto;width:100%;">
            <div class="col-md-2 col-sm-0 col-xs-0"></div>
            <div class="col-md-8 col-sm-12 col-xs-0" style="margin:0 auto;">
                <div style="height:20px;"></div>
                <ul class="breadcrumb">
                    <li><font color="#00bfff">公司详情</font></li>
                </ul>
                <div style="float: left;width: 60%">
                    <h4>中文名：星星甜品</h4>

                    <h4>外文名：Star dessert</h4>

                    <h4>经营范围：甜品</h4>

                    <h4>公司电话:0539-7962-8467</h4>
                    <p>
                        星星甜品隶属于星星有限公司公司拥有全新的技术支持团队，聘请了国内外专家，为中西甜品的专业制作提供了独家秘方。
                        公司总部设在合肥省长丰县蒙城北路230号。 我们有完善的客服组织机构: 企业策划部人力资源部、技术培训部、工程设计部、评估指导部、网络支持部、物流事业部、财务管理部、市场调研部、产品开发部。公司坚持并遵循星星甜品企业管理制度和特许经营的连锁模式。星星将为特许加盟店提供免费咨询、开店评估、开店策划、人员培训、营销策划、技术指导、经营分析、餐饮连锁推广等全面科学的投资指导服务、最完备有力的开店支持和最规范有效的营运指导。星星甜品，正以最具投资价值的特色餐饮连锁机构姿态，邀请您的加盟，共镶盛举。
                    </p>
                </div>

                <div style="float: left;width: 40%;padding-left: 50px;text-align:right">
                    <img style="height: 310px;width: 310px" src="products/logo.jpg">
                </div>
            </div>
            <div class="col-md-2 col-sm-0 col-xs-0"></div>

        </div>
    </div>
    <div class="col-md-2 col-sm-0 col-xs-0"></div>
</div>


</body>

</html>
