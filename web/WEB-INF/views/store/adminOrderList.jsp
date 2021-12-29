<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.styldle.vo.UserVO" %>
<html>
<head>
    <title>Styldle - admin</title>
    <style>
        div#container_box ul li {
            border:5px solid #eee;
            padding:10px 20px;
            margin-bottom:20px;
            margin-top: 20px;
            margin-right: 40px
        }
        div#container_box .orderList span {
            font-size:20px;
            font-weight:bold;
            display:inline-block;
            width:90px;
            margin-right:10px;
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
            <a class="navbar-brand" href="#">STYLDLE 관리자</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse show" id="navbarColor01" style="">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/store/register">상품 등록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/adminList">상품 목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/store/adminOrderList">주문 목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/list">메인 화면</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section id="container">
        <div id="container_box">
            <section id="content">
                <ul class="orderList">
                    <c:forEach items="${orderList}" var="i">
                        <li>
                            <div>
                                <p><span>주문번호</span><a href="${i.orderId}" class="move">${i.orderId}</a></p>
                                <p><span>주문날짜</span><fmt:formatDate value="${i.orderDate}" pattern="yyyy-MM-dd"/></p>
                                <p><span>주문자</span>${i.userId}</p>
                                <p><span>수령인</span>${i.orderRec}</p>
                                <p><span>주소</span>(${i.postCode}) ${i.roadAddress} ${i.detailAddress}</p>
                                <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${i.total}" /> 원</p>
                                <p><span>배송현황</span>${i.delivery}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </section>
        </div>
    </section>
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
        <form action="/store/adminOrderList" id="actionForm" method="get">
            <input type="hidden" name="page" value="${pageMaker.cri.page}">
            <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
        </form>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
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
                actionForm.append("<input class='productIdTemp' type='hidden' name='orderId' value='"+$(this).attr('href')+"'>")
                actionForm.attr('action', '/store/adminOrderView')
                actionForm.submit()
                $('.productIdTemp').detach()
            })
        })
    </script>
</body>
</html>
