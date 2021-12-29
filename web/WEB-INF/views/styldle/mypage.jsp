<%--
  Created by IntelliJ IDEA.
  User: nagas
  Date: 2021-12-06
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
<html>


<head>
    <title>My Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <!--===============================================================================================-->
</head>

<style>
    .outer {
        margin: 0 auto;
    }
</style>


<%
    String id = (String) session.getAttribute("id");

%>

<body class="animsition">


<%@include file="/WEB-INF/views/includes/header.jsp" %>

<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="/styldle/main" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
				My Page
			</span>
    </div>
</div>

<!-- Content page -->
<section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <div class="flex-w flex-tr">

            <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md outer">

                <!-- 로그인 하지 않은 상태 -->
                <c:if test="${userVO == null }">
                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								<a href="/styldle/login">로그인</a>
							</span>
                    </div>
                </div>
                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								<a href="/styldle/register">회원가입</a>
							</span>
                    </div>
                </div>
                <div class="flex-w w-full">
                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								<a href="/styldle/chatting">실시간 채팅</a>
							</span>
                    </div>
                </div>

            </div>
            </c:if>


            <!-- 로그인한 상태 -->
            <c:if test="${ userVO != null && userVO.role != 'admin' }">
                <div class="flex-w w-full p-b-42">

                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								마이페이지
							</span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            아이디 ${userVO.userId}
                        </p>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            이름 ${userVO.name}
                        </p>
                    </div>

                </div>


                <div class="flex-w w-full p-b-42">

                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								회원 정보
							</span>

                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/pwdlogin">비밀번호 변경</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/update?userId=${userVO.userId}">회원 정보 수정</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/userdelete">회원 탈퇴</a>
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">


                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								주문/배송
							</span>

                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/cartlist?userId=${userVO.userId}">장바구니</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/orderlist?userId=${userVO.userId}">주문조회</a>
                        </p>

                    </div>
                </div>

                <div class="flex-w w-full p-b-42">

                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								포인트
							</span>

                        <p class="stext-115 cl1 size-213 p-t-18">
                            내 포인트 : <fmt:formatNumber value="${userVO.point}" pattern="#,###"/>

                        </p>

                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/rock">미니게임</a>
                        </p>
                    </div>
                </div>
                <div class="flex-w w-full">
                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								<a href="/styldle/logout">로그아웃</a>
							</span>
                    </div>
                </div>

            </c:if>

            <%--관리자--%>
            <c:if test="${userVO.role == 'admin'}">

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            관리자 페이지
                        </span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            아이디 ${userVO.userId}
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            store 관리
                        </span>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/store/register">상품 등록</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/store/adminList">상품 목록</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/store/adminOrderList">주문 목록</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/list">유저 목록</a>
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full">
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/store/list">메인화면</a>
                        </p>
                        <p class="stext-115 cl1 size-213 p-t-18">
                            <a href="/styldle/logout">로그아웃</a>
                        </p>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
    </div>
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });
</script>
<script src="/resources/js/map-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>


</body>
</html>