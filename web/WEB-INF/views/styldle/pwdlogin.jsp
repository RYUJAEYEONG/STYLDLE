<%--
  Created by IntelliJ IDEA.
  User: nagas
  Date: 2021-12-03
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Password Confirmation</title>
</head>
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
        margin:0 auto;
    }
</style>


<body class="animsition">

<%@include file ="/WEB-INF/views/includes/header.jsp" %>


<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="/styldle/main" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <a href="/styldle/mypage?userId=${userVO.userId}" class="stext-109 cl8 hov-cl1 trans-04">
            My Page
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
				Password Confirmation
			</span>
    </div>
</div>

<!-- Content page -->
<form action="${path}/styldle/pwdlogin" method="post">
<section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <div class="flex-w flex-tr">
            <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md outer">

                    <h4 class="mtext-105 cl2 txt-center p-b-30">
                        비밀번호 변경
                    </h4>

                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="userId"
                               placeholder="아이디" value="${userVO.userId}" readonly>

                    </div>

                <div class="bor8 m-b-20 how-pos4-parent">
                    <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="password" name="pwd" id="pwd"
                           placeholder="현재 비밀번호">
                </div>

                <div class="bor8 m-b-20 how-pos4-parent">
                    <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="password" name="pwd2"
                           id="pwd2"
                           placeholder="현재 비밀번호 확인">
                </div>

                <div class="bor8 m-b-20 how-pos4-parent">
                    <c:if test="${result == 0 }">
                        사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.
                    </c:if>
                </div>

                <div class="m-b-20 how-pos4-parent">
                    <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                    <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                </div>

                <script type="text/javascript"> $(function () {
                    $("#alert-success").hide();
                    $("#alert-danger").hide();
                    $("input").keyup(function () {
                        var pwd = $("#pwd").val();
                        var pwd2 = $("#pwd2").val();

                        if (pwd != "" || pwd2 != "") {
                            if (pwd == pwd2) {
                                $("#alert-success").show();
                                $("#alert-danger").hide();
                                $("#submit").removeAttr("disabled");
                            } else {
                                $("#alert-success").hide();
                                $("#alert-danger").show();
                                $("#submit").attr("disabled", "disabled");
                            }
                        }
                    });
                }); </script>

                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
                            type="submit" id="btn_submit">
                        Submit
                    </button>

            </div>
        </div>
    </div>
</section>
</form>

<%--footer--%>

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
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>


</body>
</html>