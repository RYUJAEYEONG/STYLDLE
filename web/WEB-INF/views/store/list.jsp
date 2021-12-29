<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.styldle.vo.UserVO" %>
<html>
<head>
    <title>Styldle - store</title>
    <style>
        .pageNum ul {
            text-align: center;
        }
        .pageNum ul li {
            list-style: none;
            display: inline-block;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon_modify.png"/>
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
    <link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/MagnificPopup/magnific-popup.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
</head>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">
<header class="header-v4">
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    styldle은 언제나 무료배송!
                </div>
                <div class="right-top-bar flex-w h-full">
                    <c:if test="${userVO.userId == null}">
                        <a href="/styldle/main" class="flex-c-m trans-04 p-lr-25">
                            HOME
                        </a>
                        <a href="/styldle/login" class="flex-c-m trans-04 p-lr-25">
                            Login
                        </a>
                        <a href="/styldle/register" class="flex-c-m trans-04 p-lr-25">
                            Join Us
                        </a>
                    </c:if>
                    <c:if test="${userVO.userId != null}">
                        <a href="/styldle/main" class="flex-c-m trans-04 p-lr-25">
                            HOME
                        </a>
                        <a href="/styldle/cartlist" class="flex-c-m trans-04 p-lr-25">
                            CART
                        </a>
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
                <a href="/store/list" class="logo">
                    <h3 class="ltext-103 cl5">
                        STYLDLE
                    </h3>
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu menuBar">
                        <li class="best active-menu">
                            <a href="/store/list">BEST</a>
                        </li>
                        <li class="outer">
                            <a href="/store/category?type=outer">OUTER</a>
                        </li>
                        <li class="top">
                            <a href="/store/category?type=top">TOP</a>
                        </li>
                        <li class="bottom">
                            <a href="/store/category?type=bottom">BOTTOM</a>
                        </li>
                        <li class="dress">
                            <a href="/store/category?type=dress">DRESS</a>
                        </li>
                        <li class="acc">
                            <a href="/store/category?type=acc">ACC</a>
                        </li>
                        <li class="shoes">
                            <a href="/store/category?type=shoes/bag">SHOES & BAG</a>
                        </li>
                    </ul>
                </div>

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m">
                    <form id="searchForm" action="/store/list" method="get" class="d-flex">
                        <input class="form-control me-sm-2" type="text" name="keyword" placeholder="Search">
                        <input type="hidden" name="page" value="${pageMaker.cri.page}">
                        <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
            <a href="/store/list">
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
                    styldle은 언제나 무료배송!
                </div>
            </li>

            <li>
                <div class="right-top-bar flex-w h-full">
                    <c:if test="${userVO.userId ==null}">
                        <a href="/styldle/main" class="flex-c-m p-lr-10 trans-04">
                            HOME
                        </a>
                        <a href="/styldle/login" class="flex-c-m p-lr-10 trans-04">
                            Login
                        </a>
                        <a href="/styldle/register" class="flex-c-m p-lr-10 trans-04">
                            Join Us
                        </a>
                    </c:if>
                    <c:if test="${userVO.userId != null}">
                        <a href="/styldle/main" class="flex-c-m p-lr-10 trans-04">
                            HOME
                        </a>
                        <a href="/styldle/cartlist" class="flex-c-m p-lr-10 trans-04">
                            CART
                        </a>
                        <a href="/styldle/mypage?userId=${userVO.userId}" class="flex-c-m p-lr-10 trans-04">
                            My Page
                        </a>
                        <a href="/styldle/logout" class="flex-c-m p-lr-10 trans-04">
                            Logout
                        </a>
                    </c:if>
                </div>
            </li>
        </ul>

        <ul class="main-menu-m">
            <li class="active-menu">
                <a href="/store/list">BEST</a>
            </li>
            <li>
                <a href="/store/category?type=outer">OUTER</a>
            </li>
            <li>
                <a href="/store/category?type=top">TOP</a>
            </li>
            <li>
                <a href="/store/category?type=bottom">BOTTOM</a>
            </li>
            <li>
                <a href="/store/category?type=dress">DRESS</a>
            </li>
            <li>
                <a href="/store/category?type=acc">ACC</a>
            </li>
            <li>
                <a href="/store/category?type=shoes/bag">SHOES & BAG</a>
            </li>
        </ul>
    </div>
</header>

<div class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="row">
            <c:forEach items="${list}" var="i">
                <div class="col-sm-6 col-md-4 col-lg-3 p-b-35">
                    <div class="block2">
                        <div class="block2-pic hov-img0 uploadOneImg${i.productId}">

                            <a href='#' data-value='${i.productId}' data-stock='${i.stock}'
                               class='block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 viewProduct'>
                                보기
                            </a>
                        </div>

                        <div class="block2-txt flex-w flex-t p-t-14">
                            <div class="block2-txt-child1 flex-col-l ">
                                <a href="${i.productId}" class="move">
                                        ${i.productName}
                                </a>

                                <span class="stext-105 cl3">
                                        <fmt:formatNumber value="${i.price}" pattern="###,###,###"/>원
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
        <span class="symbol-btn-back-to-top">
            <i class="zmdi zmdi-chevron-up"></i>
        </span>
</div>

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
    <form action="/store/list" id="actionForm" method="get">
        <input type="hidden" name="page" value="${pageMaker.cri.page}">
        <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    </form>
</div>

<!-- Modal1 -->
<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
    <div class="overlay-modal1 js-hide-modal1"></div>

    <div class="container">
        <div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
            <button class="how-pos3 hov3 trans-04 js-hide-modal1">
                <img src="../resources/images/icons/icon-close.png" alt="CLOSE">
            </button>

            <div class="row">
                <div class="col-md-6 col-lg-7 p-b-30">
                    <div class="p-l-25 p-r-30 p-lr-0-lg">
                        <div class="wrap-slick3 flex-sb flex-w">
                            <div class="wrap-slick3-dots">

                            </div>

                            <div class="slick3 gallery-lb">
                                <div class="slick-list draggable">
                                    <div class="slick-track">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-5 p-b-30">
                    <div class="p-r-50 p-t-5 p-lr-0-lg">
                        <h4 class="mtext-105 cl2 js-name-detail p-b-14 productName">

                        </h4>

                        <span class="mtext-106 cl2 price">

                        </span>

                        <p class="stext-102 cl3 p-t-23 detail" style="margin-bottom: 0px;">

                        </p>

                        <p class="stext-102 cl3 p-t-23">
                            One Size &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One Color
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<%--주문 하는 form--%>
<form action="/store/orderStraight" method="get" class="orderGo">

</form>

<script type="text/javascript">
    $(document).ready(function() {
        //선택한 카테고리의 색상 바뀌기
        (function() {
            <c:if test="${not empty type}">
            $('.menuBar > li').removeClass('active-menu')
            <c:if test="${type eq 'outer'}">
            $('.outer').addClass('active-menu')
            </c:if>
            <c:if test="${type eq 'top'}">
            $('.top').addClass('active-menu')
            </c:if>
            <c:if test="${type eq 'bottom'}">
            $('.bottom').addClass('active-menu')
            </c:if>
            <c:if test="${type eq 'dress'}">
            $('.dress').addClass('active-menu')
            </c:if>
            <c:if test="${type eq 'acc'}">
            $('.acc').addClass('active-menu')
            </c:if>
            <c:if test="${type eq 'shoes/bag'}">
            $('.shoes').addClass('active-menu')
            </c:if>
            </c:if>
        })()

        <c:forEach items="${list}" var="i">
        //상품 사진 가져오기
        var productId = ${i.productId}
            $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                var str = ''
                console.log(arr[0])
                var fileCallPath = encodeURIComponent(arr[0].uploadPath+'/'+arr[0].uuid+'_'+arr[0].fileName)
                str += "<img src='/display?fileName="+fileCallPath+"'>"
                console.log(fileCallPath)
                $('.uploadOneImg${i.productId}').prepend(str)
            })
        </c:forEach>

        function centerImg(productId, num) {
            //중앙 큰 이미지 가져오기
            var num = Number(num)
            $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                console.log(arr)
                var str = ''
                var fileCallPath = encodeURIComponent(arr[num].uploadPath+'/'+arr[num].uuid+'_'+arr[num].fileName)
                str += "<div class='item-slick3 slick-slide' data-thumb='/display?fileName="+fileCallPath+"'>"
                str += "<div class='wrap-pic-w pos-relative'>"
                str += "<img src='/display?fileName="+fileCallPath+"' alt='IMG-PRODUCT'>"
                str += "<a class='flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04' href='/display?fileName="+fileCallPath+"'>"
                str += "<i class='fa fa-expand'></i></a></div></div>"
                $('.slick-track').html(str)
            })
        }

        //보기 클릭시 모달창 오픈
        $('.viewProduct').click(function() {
            var productId = $(this).data('value')
            var stock = $(this).data('stock')
            console.log(productId)
            console.log(stock)
            //좌측 작은 이미지들 가져오기
            $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                console.log(arr)
                var str = ''
                $(arr).each(function(i, attach) {
                    var fileCallPath = encodeURIComponent(attach.uploadPath+'/'+attach.uuid+'_'+attach.fileName)
                    str += "<li role='presentation' class=''>"
                    str += "<img src='/display?fileName="+fileCallPath+"' data-value='"+productId+"' data-num='"+i+"' style='cursor: pointer;'>"
                    str += "</li>"
                })
                $('.slick3-dots').html(str)
            })

            //기본 첫 번째 사진이 중앙에 가져오기
            centerImg(productId, 0)

            //상품 정보 가져오기
            $.getJSON("/store/getProduct", {productId: productId}, function (product) {
                var str = ''
                console.log(product)
                $('.productName').html(product.productName)
                $('.price').html(product.price)
                $('.detail').html(product.detail)
            })
        })

        //좌측 다른 사진 눌러서 크게 보기
        $('.wrap-slick3-dots').on('click', 'img', function(e) {
            console.log('사진 눌린다!')
            var productId = $(this).data('value')
            var num = $(this).data('num')
            console.log(productId)
            console.log(num)
            $('.slick-slide').detach()
            centerImg(productId, num)
        })

        //모달창 닫기
        $('.js-hide-modal1').click(function() {
            $(".wrap-modal1").modal('hide');
            $('.productName').html('')
            $('.price').html('')
            $('.detail').html('')
        })

        //페이지 이동
        var actionForm = $('#actionForm')
        $('.paginate_button a').click(function(e) {
            e.preventDefault()
            console.log('page button click')
            actionForm.find("input[name='page']").val($(this).attr('href'))
            actionForm.submit()
        })

        //상품 상세 조회 이동
        $('.move').click(function (e) {
            console.log('move 눌렸다')
            e.preventDefault()
            actionForm.append("<input class='productIdTemp' type='hidden' name='productId' value='"+$(this).attr('href')+"'>")
            actionForm.attr('action', '/store/get')
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
    $(".js-select2").each(function(){
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/slick/slick.min.js"></script>
<script src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/parallax100/parallax100.js"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
    $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled:true
            },
            mainClass: 'mfp-fade'
        });
    });
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/sweetalert/sweetalert.min.js"></script>
<script>
    $('.js-addwish-b2').on('click', function(e){
        e.preventDefault();
    });

    $('.js-addwish-b2').each(function(){
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
        });
    });

    $('.js-addwish-detail').each(function(){
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
        });
    });

    /*---------------------------------------------*/

    $('.js-addcart-detail').each(function(){
        var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
        $(this).on('click', function(){
            swal(nameProduct, "is added to cart !", "success");
        });
    });

</script>
<!--===============================================================================================-->
<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function(){
        $(this).css('position','relative');
        $(this).css('overflow','hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function(){
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>


</body>
</html>