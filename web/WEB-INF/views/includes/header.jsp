<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a href="/styldle/chat">Chat</a>
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