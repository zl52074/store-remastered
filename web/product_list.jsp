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
    <title>ๅๅๅ่กจ</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jquery/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.js"></script>

    <style>
        .image-header{
            position:relative;
            width:100%;
            height:0;
            padding-top:100%;

        }
        .image-header img{
            position:absolute;
            top:0;
            left:0;
            width:100%;
            height:100%;

        }
    </style>
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
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/product?method=product_page&pagenumber=1">้ฆ้กต</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">



                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${not empty sessionScope.user}">
                                <li><a href="#">็จๆท๏ผ${sessionScope.user.username}</a></li>
                            </c:if>
                            <c:if test="${empty sessionScope.user}">
                                <li><a href="${pageContext.request.contextPath}/user?method=login">็ป้</a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/user?method=register">ๆณจๅ</a></li>
                            <li><a href="${pageContext.request.contextPath}/product?method=cart">่ดญ็ฉ่ฝฆ</a></li>
                            <li><a href="${pageContext.request.contextPath}/order?method=orderList">่ฎขๅ</a></li>
                            <li><a href="${pageContext.request.contextPath}/user?method=quitLogin">้ๅบ</a></li>
                            <li><a href="${pageContext.request.contextPath}/company?method=toCompanyInfo">ๅฌๅธไป็ป</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

            <div  style="padding-left: 0px ;padding-right: 0px" class=" col-md-12" >
                <div class="col-md-3 col-sm-3"  style="padding-left: 0px; float: left;height: 30px;padding-top: 15px;" >
                    <font color="#00bfff" size="4">ๅๅๅ่กจ</font>
                    <font size="2">&nbsp;PRODUCTS</font>
                </div>

                <form style="">
                    <div class="col-md-1 col-sm-1 col-xs-12" style="float: left; height: 10px"></div>
                    <div class="col-md-4 col-sm-4 col-xs-12"  style="padding-left: 0px; margin:0 auto;float: left;height: 30px;padding-top: 10px;">
                        <div class="col-md-10 col-sm-10 col-xs-10" ><input id="keyword" style="float: left" type="text"  name="keyword" class="form-control" placeholder="ๅๅๆ่ฟฐๆๅๅๅ็งฐ" value="${requestScope.keyword}"></div>
                        <input style="position: absolute" type="button" onclick="search()" value="ๆ็ดข" class="btn btn-default">
                    </div>
                </form>
                <div style=" padding-left: 0px;padding-right: 0px" class="col-md-12 col-xs-12"><hr></div>
            </div>
            <div style="margin: 5px">
                <ul class="nav nav-pills">
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <span id="categoryTitle">
                            <c:choose>
                                <c:when test="${requestScope.category=='1'}">
                                    ่็ณ
                                </c:when>
                                <c:when test="${requestScope.category=='2'}">
                                    ้ขๅ
                                </c:when>
                                <c:when test="${requestScope.category=='3'}">
                                    ้ฅผๅนฒ
                                </c:when>
                                <c:when test="${requestScope.category=='4'}">
                                    ๅฐๆทๆท
                                </c:when>
                                <c:when test="${requestScope.category=='5'}">
                                    ๅฅถ่ถ
                                </c:when>
                                <c:when test="${requestScope.category=='6'}">
                                    ๅๅก
                                </c:when>
                                <c:when test="${requestScope.category=='7'}">
                                    ๆฑฝๆฐด
                                </c:when>
                                <c:otherwise>
                                    ๅจ้จ
                                </c:otherwise>

                            </c:choose>

                            </span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0);" flag="0" onclick="changeCategory(this)">ๅจ้จ</a></li>
                            <li><a href="javascript:void(0);" flag="1" onclick="changeCategory(this)">่็ณ</a></li>
                            <li><a href="javascript:void(0);" flag="2" onclick="changeCategory(this)">้ขๅ</a></li>
                            <li><a href="javascript:void(0);" flag="3" onclick="changeCategory(this)">้ฅผๅนฒ</a></li>
                            <li><a href="javascript:void(0);" flag="4" onclick="changeCategory(this)">ๅฐๆทๆท</a></li>
                            <li><a href="javascript:void(0);" flag="5" onclick="changeCategory(this)">ๅฅถ่ถ</a></li>
                            <li><a href="javascript:void(0);" flag="6" onclick="changeCategory(this)">ๅๅก</a></li>
                            <li><a href="javascript:void(0);" flag="7" onclick="changeCategory(this)">ๆฑฝๆฐด</a></li>
                        </ul>
                        <input id="category" value="${requestScope.category}" style="display: none">
                    </li>
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <span id="sortTitle">
                            <c:choose>
                                <c:when test="${requestScope.sort=='1'}">
                                    ไปทๆ?ผๅๅบ
                                </c:when>
                                <c:when test="${requestScope.sort=='2'}">
                                    ไปทๆ?ผ้ๅบ
                                </c:when>
                                <c:otherwise>
                                    ้ป่ฎค
                                </c:otherwise>

                            </c:choose>
                            </span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0);" flag="0" onclick="changeSort(this)">้ป่ฎค</a></li>
                            <li><a href="javascript:void(0);" flag="1" onclick="changeSort(this)">ไปทๆ?ผๅๅบ</a></li>
                            <li><a href="javascript:void(0);" flag="2" onclick="changeSort(this)">ไปทๆ?ผ้ๅบ</a></li>
                        </ul>
                    </li>
                    <input id="sort" style="display: none">

                </ul>
            </div>

        </div>
        <c:if test="${not empty pp.list}">
            <c:forEach items="${pp.list}" var="pro">
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <a href="${pageContext.request.contextPath}/product?method=product_info&pid=${pro.pid}">
                        <div class="image-header">
                            <img src="${pageContext.request.contextPath}/${pro.pimage}"  style="display: inline-block;">
                        </div>
                    </a>
                    <p style="margin-top:10px"><font size="4" color="green">${pro.pname}<font></font></p>
                    <p><font size="4" color="#FF0000">ไปทๆ?ผ๏ผ&yen;${pro.price}</font></p>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty pp.list}">
            <center><h2><font color="red">ๆฒกๆๅๅ</font></h2></center>
        </c:if>
    </div>

    <!--ๅ้กต -->
    <div style="width:380px;margin:0 auto;margin-top:50px;text-align: center">
        <ul class="pagination" style="text-align:center; margin-top:10px;">
            <li id="liprevious"><a id="previous" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>

            <c:forEach begin="1" end="${pp.pageTotal}" var="page">
                <c:if test="${pp.pageNumber==page}">
                    <li class="active"><a href="#">${page}</a></li>
                </c:if>
                <c:if test="${pp.pageNumber!=page}">
                    <li><a href="javascript:void(0);" page="${page}" onclick="jumpPage(this)">${page}</a></li>
                </c:if>
            </c:forEach>

            <li id="linext"><a id="next" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </div>
    <div class="col-md-2 col-sm-0 col-xs-0"></div>
</div>

<script>
    $(function () {
        <c:if test="${pp.pageNumber!=1}">
        $("#previous").attr("href","${pageContext.request.contextPath}/product?method=product_page&pagenumber=${pp.pageNumber-1}")
        </c:if>

        <c:if test="${pp.pageNumber!=pp.pageTotal}">
        $("#next").attr("href","${pageContext.request.contextPath}/product?method=product_page&pagenumber=${pp.pageNumber+1}")
        </c:if>

        <c:if test="${pp.pageNumber==pp.pageTotal}">
        $("#linext").attr("class","disabled")
        </c:if>

        <c:if test="${pp.pageNumber==1}">
        $("#liprevious").attr("class","disabled")
        </c:if>

    })

    function search(){
        var keyword = $("#keyword").val();
        var category = $("#category").val();
        var sort = $("#sort").val();
        console.log(keyword);
        console.log(category);
        console.log(sort);
        var url = "/product?method=product_page&pagenumber=${pp.pageNumber}"
        if(keyword.length>0){
            url+="&keyword="+keyword;
        }
        if(category.length>0){
            url+="&category="+category;
        }
        if(sort.length>0){
            url+="&sort="+sort;
        }
        location.href=url;
    }

    function jumpPage(e){
        var page = $(e).attr("page");
        var keyword = $("#keyword").val();
        var category = ""
        var sort = ""
        console.log(keyword);
        console.log(page);
        location.href="/product?method=product_page&pagenumber="+page+"&keyword="+keyword;
    }

    function changeCategory(e){
        var category = $(e).attr("flag");
        if(category=="0"){
            $("#category").val("");
        }else{
            $("#category").val(category);
        }
        search();
    }

    function changeSort(e){
        var sort = $(e).attr("flag");
        if(sort=="0"){
            $("#sort").val("");
        }else{
            $("#sort").val(sort);
        }
        search();
    }

</script>
</body>

</html>
