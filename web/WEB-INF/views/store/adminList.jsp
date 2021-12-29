<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.styldle.vo.UserVO" %>
<html>
<head>
    <title>Styldle - admin</title>
    <style>
        table img {
            width: 150px;
            height: auto;
        }
        .pageNum ul {
            text-align: center;
        }
        .pageNum ul li {
            list-style: none;
            display: inline-block;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon_modify.png"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
</head>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">

<c:if test="${userVO.role != 'admin'}">
    <script>
        alert("관리자 권한입니다.");
        history.back();
    </script>
</c:if>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand">STYLDLE 관리자</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse show" id="navbarColor01" style="">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/store/register">상품 등록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/store/adminList">상품 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/store/adminOrderList">주문 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/store/list">메인 화면</a>
                </li>
            </ul>
            <form id="searchForm" action="/store/adminList" method="get" class="d-flex" style="margin-bottom: 0px">
                <input class="form-control me-sm-2" type="text" name="keyword" placeholder="Search">
                <input type="hidden" name="page" value="${pageMaker.cri.page}">
                <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit" style="height: 45px;">Search</button>
            </form>

        </div>
    </div>
</nav>

<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">번호</th>
        <th scope="col">이미지</th>
        <th scope="col">상품명</th>
        <th scope="col">상품분류</th>
        <th scope="col">가격</th>
        <th scope="col">재고</th>
        <th scope="col">등록날짜</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="i">
        <tr>
            <td>${i.productId}</td>
            <td class="uploadOneImg${i.productId}">

            </td>
            <td>
                <a href="${i.productId}" class="move">${i.productName}</a>
            </td>
            <td>${i.type}</td>
            <td>
                <fmt:formatNumber value="${i.price}" pattern="###,###,###"/>
            </td>
            <td>${i.stock}</td>
            <td>
                <fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="pageNum">
    <ul>
        <c:if test="${pageMaker.prev}">
            <li class="paginate_button previous">
                <a href="${pageMaker.startPage-1}">이전</a>
            </li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="paginate_button">
                <a href="${num}">${num}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next}">
            <li class="paginate_button next">
                <a href="${pageMaker.endPage+1}">다음</a>
            </li>
        </c:if>
    </ul>
</div>
<div>
    <form action="/store/adminList" id="actionForm" method="get">
        <input type="hidden" name="page" value="${pageMaker.cri.page}">
        <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    </form>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        //상품 정상 등록 알림
        <c:if test="${not empty result}">
        alert("${result}번 상품이 등록되었습니다.")
        </c:if>

        <c:if test="${not empty updateRes}">
        alert("${updateRes}번 상품이 수정되었습니다.")
        </c:if>

        <c:if test="${not empty removeRes}">
        alert("${removeRes}번 상품이 삭제되었습니다.")
        </c:if>

        <c:forEach items="${list}" var="i">
        var productId = ${i.productId}
            $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                var str = ''
                console.log(arr[0])
                var fileCallPath = encodeURIComponent(arr[0].uploadPath+'/'+arr[0].uuid+'_'+arr[0].fileName)
                str += "<img src='/display?fileName="+fileCallPath+"'>"
                console.log(fileCallPath)
                $('.uploadOneImg${i.productId}').html(str)
            })
        </c:forEach>

        var actionForm = $('#actionForm')
        $('.paginate_button a').click(function(e) {
            e.preventDefault()
            console.log('page button click')
            actionForm.find("input[name='page']").val($(this).attr('href'))
            actionForm.submit()
        })
        $('.move').click(function (e) {
            console.log('move 눌렸다')
            e.preventDefault()
            actionForm.append("<input class='productIdTemp' type='hidden' name='productId' value='"+$(this).attr('href')+"'>")
            actionForm.attr('action', '/store/adminGet')
            actionForm.submit()
            $('.productIdTemp').detach()
        })

        //검색
        var searchForm = $('#searchForm')
        $('#searchForm button').click(function(e) {
            searchForm.find("input[name='page']").val('1')
            e.preventDefault()
            searchForm.submit()
        })
    })
</script>
</body>
</html>
