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
    <title>Chat</title>
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

    .container2 {
        width: 500px;
        margin: 0 auto;
        padding: 25px
    }

    .container2 h1 {
        text-align: center;
        padding: 5px 5px 5px 15px;
        color: #000000;
        margin-bottom: 20px;
    }

    .chat {
        background-color: #FFFFFF;
        width: 500px;
        height: 500px;
        overflow: auto;
        border: 1px solid black;
    }

    .chat p {
        color: #000000;
        text-align: left;
    }

    input {
        width: 330px;
        height: 25px;
    }

    #yourMsg {
        display: none;

    }

    .logout {
        border-left: 1px solid rgba(255, 255, 255, 0.3);
    }

</style>

<%@ page import="com.styldle.vo.UserVO" %>
<header class="header-v4">
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    Free Shipping!
                </div>

                <div class="right-top-bar flex-w h-full">
                    <c:if test="${userVO.userId == null}">
                        <a href="/styldle/login" class="flex-c-m trans-04 p-lr-25">
                            Login
                        </a>
                        <a href="/styldle/register" class="flex-c-m trans-04 p-lr-25">
                            Join Us
                        </a>
                        <a href="https://kauth.kakao.com/oauth/logout?client_id=bed9ecbd77739e52ca31d22ed37388f3&logout_redirect_uri=http://localhost:8080/styldle/logout"
                           class="flex-c-m trans-04 p-lr-25 logout">
                            Kakao Logout
                        </a>
                    </c:if>
                    <c:if test="${userVO.userId != null}">
                        <a href="/styldle/mypage?userId=${userVO.userId}" class="flex-c-m trans-04 p-lr-25">
                            My Page
                        </a>
                        <a href="/styldle/logout" class="flex-c-m trans-04 p-lr-25">
                            Logout
                        </a>

                        <a href="https://kauth.kakao.com/oauth/logout?client_id=bed9ecbd77739e52ca31d22ed37388f3&logout_redirect_uri=http://localhost:8080/styldle/logout"
                           class="flex-c-m trans-04 p-lr-25 logout">
                            Kakao Logout
                        </a>

                    </c:if>
                </div>
            </div>
        </div>

        <div class="wrap-menu-desktop how-shadow1" style="top: 40px;">
            <nav class="limiter-menu-desktop container">

                <!-- Logo desktop -->
                <a href="/styldle/main" class="logo">
                    <h3 class="ltext-103 cl5">
                        STYLDLE
                    </h3>
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li>
                            <a href="/styldle/main">Home</a>
                        </li>

                        <li>
                            <a href="/store/list">Store</a>
                        </li>

                        <li class="label1" data-label1="hot">
                            <a href="/style/list">Style</a>
                        </li>

                        <li>
                            <a href="/qna/list">Q&A</a>
                        </li>
                        <li>
                            <a href="/styldle/chatting">Chat</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
            <a href="/styldle/main">
                <h3 class="ltext-103 cl5">
                    STYLDLE
                </h3>
            </a>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>
    </div>


    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li>
                <div class="left-top-bar">
                    Free shipping!
                </div>
            </li>

            <li>
                <div class="right-top-bar flex-w h-full">
                    <c:if test="${userVO.userId ==null}">
                        <a href="/styldle/login" class="flex-c-m trans-04 p-lr-25">
                            Login
                        </a>
                        <a href="/styldle/register" class="flex-c-m trans-04 p-lr-25">
                            Join Us
                        </a>
                    </c:if>
                    <c:if test="${userVO.userId != null}">
                        <a href="/styldle/mypage?userId=${userVO.userId}" class="flex-c-m trans-04 p-lr-25">
                            My Page
                        </a>
                        <a href="/styldle/logout" class="flex-c-m trans-04 p-lr-25">
                            Logout
                        </a>
                    </c:if>
                </div>
            </li>
        </ul>

        <ul class="main-menu-m">
            <li>
                <a href="/styldle/main">Home</a>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li>
                <a href="store/list">Store</a>
            </li>

            <li>
                <a href="/style/list" class="label1 rs1" data-label1="hot">style</a>
            </li>

            <li>
                <a href="/qna/list">Q&A</a>
            </li>

            <li>
                <a href="/styldle/chatting">Chat</a>
            </li>


        </ul>
    </div>

    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                <img src="/resources/images/icons/icon-close2.png" alt="CLOSE">
            </button>
        </div>
    </div>
</header>

<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="/styldle/main" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <a href="/styldle/chatting" class="stext-109 cl8 hov-cl1 trans-04">
            Kakao Login
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
				Chat
			</span>
    </div>
</div>


<script type="text/javascript">
    var ws;

    function wsOpen() {
        // ws = new WebSocket("ws://" + location.host + "/chating");
        ws = new WebSocket("ws://localhost:8080/chat")
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function (data) {
            //소켓이 열리면 초기화 세팅하기
        }

        ws.onmessage = function (data) {
            var msg = data.data;
            if (msg != null && msg.trim() != '') {
                $("#chat").append("<p>" + msg + "</p>");
            }
        }

        document.addEventListener("keypress", function (e) {
            if (e.keyCode == 13) { //enter press
                send();
            }
        });
    }

    function chatName() {
        var userName = $("#userName").val();
        if (userName == null || userName.trim() == "") {
            alert("사용자 이름을 입력해주세요.");
            $("#userName").focus();
        } else {
            wsOpen();
            $("#yourName").hide();
            $("#yourMsg").show();
        }
    }

    function send() {
        var uN = $("#userName").val();
        var msg = $("#chatting").val();
        ws.send(uN + " : " + msg);
        $('#chatting').val("");
    }
</script>
<body>
<div id="container2" class="container2">
    <h1>채팅</h1>
    <div id="chat" class="chat">
    </div>

    <div id="yourName">
        <table class="inputTable">
            <tr>
                <th>닉네임</th>
                <th><input type="text" name="userName" id="userName"></th>
                <th>
                    <button onclick="chatName()" id="startBtn">등록</button>
                </th>
            </tr>
        </table>
    </div>
    <div id="yourMsg">
        <table class="inputTable">
            <tr>
                <th>메시지</th>
                <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                <th>
                    <button onclick="send()" id="sendBtn">입력</button>
                </th>
            </tr>
        </table>
    </div>

</div>
</body>


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