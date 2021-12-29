<%--
  Created by IntelliJ IDEA.
  User: nagas
  Date: 2021-12-13
  Time: 오후 3:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<html>
<head>
    <title>Mini Game</title>
</head>
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

<style>
    .outer {
        text-align: center;
        margin: 0 auto;
    }
    .outer2 {
        text-align: center;
        margin: 0 auto;
        font-size: x-large;
        font-weight: bold;
        margin-top:20px;
    }

</style>


</head>
<body class="animsition">

<%@include file="/WEB-INF/views/includes/header.jsp" %>

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
				Mini Game
			</span>
    </div>
</div>

<!-- 로그인한 상태 -->
<c:if test="${ userVO != null && userVO.role != 'admin' }">
<section class="outer2">
    가위바위보를 통해 포인트를 적립하세요
</section>
<section class="bg0 p-t-104 p-b-116">
    <div class="container outer">
        <div class="flex-w flex-tr">

            <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md outer">
    <script type="text/javascript">
        var arr = ["가위", "바위", "보"];
        var imgArray = new Array();
        imgArray[0] = "/resources/image/s.png";
        imgArray[1] = "/resources/image/r.png";
        imgArray[2] = "/resources/image/p.png";

        function showImage() {
            var randomNum = parseInt(Math.random() * 3);
            console.log(arr[randomNum])
            var objImg = document.getElementById("img");
            objImg.src = imgArray[randomNum];
            timer = setTimeout(showImage, 100);
        }

        function ChangeImg() {
            document.getElementById("img").src = "/resources/image/s.png";
            console.log("가위 들어오나")
        }

        function ChangeImg2() {
            document.getElementById("img").src = "/resources/image/r.png";
            console.log("바위 들어오나")
        }

        function ChangeImg3() {
            document.getElementById("img").src = "/resources/image/p.png";
            console.log("보 들어오나")
        }

        $(document).ready(function () {
            for (let i = 0; i < 3; i++) {
                $(".btn").eq(i).click(function () {
                    if ("${userVO.point}" < 100) {
                        alert("포인트가 부족합니다");
                    } else {
                        var c = parseInt(Math.random() * 3);
                        console.log("내가 뭐 냈냐?" + arr[i])
                        var msg = "";
                        console.log("컴퓨터가 뭐 냈냐?" + arr[c])
                        if (i == c) {
                            msg += "비겼습니다";
                            if (c == 0) {
                                ChangeImg();
                                clearTimeout(timer);
                            } else if (c == 1) {
                                ChangeImg2();
                                clearTimeout(timer);
                            } else {
                                ChangeImg3();
                                clearTimeout(timer);
                            }
                            $('.draw').trigger('click');
                        } else if (i % 3 == (c + 2) % 3) {
                            msg += "컴퓨터가 이겼습니다";
                            if (c == 0) {
                                ChangeImg();
                                clearTimeout(timer);
                            } else if (c == 1) {
                                ChangeImg2();
                                clearTimeout(timer);
                            } else {
                                ChangeImg3();
                                clearTimeout(timer);
                            }
                            $('.lose').trigger('click');
                        } else {
                            msg += "당신이 이겼습니다";
                            if (c == 0) {
                                ChangeImg();
                                clearTimeout(timer);
                            } else if (c == 1) {
                                ChangeImg2();
                                clearTimeout(timer);
                            } else {
                                ChangeImg3();
                                clearTimeout(timer);
                            }
                            $('.win').trigger('click');
                        }
                        alert(msg);
                    }
                });
            }
            $('.win').hide();
            $('.lose').hide();
            $('.draw').hide();
        });
    </script>
    <div class="inner">
        <body onload="showImage()">
        <div onclick="ChangeImg()"></div>

        <img id="img" src="/resources/image/s.png" width:="100" height="50"/>
        </body>
        <h1>가위바위보</h1>

        <div>

            <button id="scissor" class="btn"><img src="/resources/image/s.png" width:="100" height="50"></button>

            <button id="rock" class="btn"><img src="/resources/image/r.png" width:="100" height="50"></button>

            <button id="paper" class="btn"><img src="/resources/image/p.png" width:="100" height="50"></button>

        </div>
    </div>

    <form action="${path}/styldle/win" method="post">
        <div>
            <button class="win" type="submit" onclick="location='win'">승리</button>
            <input type="hidden" class="form-control" name='userId' value="${userVO.userId}"/>
        </div>
    </form>

    <form action="${path}/styldle/lose" method="post">
        <div>
            <button class="lose" type="submit" onclick="location='lose'">패배</button>
            <input type="hidden" class="form-control" name='userId' value="${userVO.userId}"/>
        </div>
    </form>

    <form action="${path}/styldle/draw" method="post">
        <div>
            <button class="draw" type="submit" onclick="location='draw'">무승부</button>
            <input type="hidden" class="form-control" name='userId' value="${userVO.userId}"/>
        </div>
    </form>
            </div>
        </div>
    </div>
</section>


</c:if>

<%--관리자--%>
<c:if test="${userVO.role == 'admin'}">
    <div class="inner">
        <span>관리자 화면</span>
        <span><a href='/styldle/logout'>로그아웃</a></span>
        <span><a href='/styldle/list'>회원관리</a></span>
    </div>
</c:if>

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