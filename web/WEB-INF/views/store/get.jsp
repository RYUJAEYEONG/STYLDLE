<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.styldle.vo.UserVO" %>
<html>
<head>
    <title>Styldle - store</title>
    <style>
        .modal-dialog{
            top: 20%;
            left: 0%;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon_modify.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/MagnificPopup/magnific-popup.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/main.css">
    <!--===============================================================================================-->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
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
                            <a href="/styldle/login" class="flex-c-m trans-04 p-lr-25">
                                Login
                            </a>
                            <a href="/styldle/register" class="flex-c-m trans-04 p-lr-25">
                                Join Us
                            </a>
                        </c:if>
                        <c:if test="${userVO.userId != null}">
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
                        <ul class="main-menu">
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
                            <a href="/styldle/login" class="flex-c-m p-lr-10 trans-04">
                                Login
                            </a>
                            <a href="/styldle/register" class="flex-c-m p-lr-10 trans-04">
                                Join Us
                            </a>
                        </c:if>
                        <c:if test="${userVO.userId != null}">
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

    <section class="sec-product-detail bg0 p-t-65 p-b-60">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-7 p-b-30">
                    <div class="p-l-25 p-r-30 p-lr-0-lg">
                        <div class="wrap-slick3 flex-sb flex-w">
                            <div class="wrap-slick3-dots">

                            </div>

                            <div class="slick3 gallery-lb">
                                <div class="slick-list draggable">
                                    <div class="slick-track" style="opacity: 1; width: 598px;">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-5 p-b-30">
                    <div class="p-r-50 p-t-5 p-lr-0-lg">
                        <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                            ${product.productName}
                        </h4>

                        <span class="mtext-106 cl2">
                            <fmt:formatNumber value="${product.price}" pattern="###,###,###"/>원
                        </span>

                        <p class="stext-102 cl3 p-t-23" style="margin-bottom: 0px">
                            ${product.detail}
                        </p>

                        <p class="stext-102 cl3 p-t-23">
                            One Size &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One Color
                        </p>

                        <!--  -->
                        <div class="countOrder">
                            <div class="flex-w flex-r-m p-b-10" style="display: block">
                                <div class="size-204 flex-w flex-m respon6-next">
                                    <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                        <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                            <i class="fs-16 zmdi zmdi-minus"></i>
                                        </div>

                                        <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1" min="1" max="${product.stock}">

                                        <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                            <i class="fs-16 zmdi zmdi-plus"></i>
                                        </div>
                                    </div>

                                    <div>
                                        <button class="btn btn-dark buyBtn">
                                            BUY IT NOW
                                        </button>
                                        <button class="btn btn-light cartBtn">
                                            ADD TO CART
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">장바구니 담기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>장바구니에 상품이 정상적으로 담겼습니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary cartGo">장바구니 이동</button>
                    <button type="button" class="btn btn-secondary shoppingGo" data-bs-dismiss="modal">쇼핑 계속하기</button>
                </div>
            </div>
        </div>
    </div>

    <form action="/store/list" method="get" class="listGo">
        <input type="hidden" name="page" value="${cri.page}">
        <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
        <input type="hidden" name="keyword" value="${cri.keyword}">
    </form>

    <%--주문 하는 form--%>
    <form action="/store/orderStraight" method="get" class="orderGo">

    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">

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

        $(document).ready(function() {
            (function() {
                //카테고리 배너 색 없애기
                $('.menuBar > li').removeClass('active-menu')
                //좌측 작은 이미지들 가져오기
                var productId = ${product.productId}
                $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
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
            })()

            //좌측 다른 사진 눌러서 크게 보기
            $('.wrap-slick3-dots').on('click', 'img', function(e) {
                var productId = $(this).data('value')
                var num = $(this).data('num')
                $('.slick-slide').detach()
                centerImg(productId, num)
            })

            //리스트로 돌아가기
            var formObj = $('.listGo')
            $("button[data-oper='list']").click(function(e) {
                formObj.attr('action', '/store/list')
                formObj.submit()
            })

            //주문 수량
            $(".zmdi-plus").click(function(e) {
                e.preventDefault()
                var cnt = Number($(".num-product").val()) + 1
                var stock = Number(${product.stock})
            })
            $(".zmdi-minus").click(function(e) {
                e.preventDefault()
                var cnt = Number($(".num-product").val()) - 1
                if(cnt <= 0) {
                    $(".num-product").val(2)
                    alert('최소 주문수량은 1개 입니다.')
                }
            })

            //카트에 담기
            var productId = ${product.productId}
            $('.cartBtn').click(function() {
                var str = ''
                var count = Number($('.num-product').val())
                <c:if test="${userVO.userId == null}">
                    alert("로그인 후 이용 가능합니다.")
                </c:if>
                <c:if test="${userVO.userId != null}">
                    $.getJSON("/store/addCart", {productId: productId, count: count}, function(result){
                        console.log(result)
                        if(result == 'success'){
                            $('.modal').show()
                        }
                    })
                </c:if>
            })

            //카트로 이동
            $('.cartGo').click(function() {
                self.location = '/styldle/cartlist?userId=${userVO.userId}'
            })

            //카트 모달 닫기
            $('.shoppingGo').click(function() {
                $('.modal').hide()
            })

            //바로 구매하기
            var orderFormObj = $('.orderGo')
            $('.buyBtn').click(function() {
                var str = ''
                var count = Number($('.num-product').val())
                <c:if test="${userVO.userId == null}">
                    alert("로그인 후 이용 가능합니다.")
                </c:if>
                <c:if test="${userVO.userId != null}">
                    str += "<input type='hidden' name='productId' value='"+productId+"'>"
                    str += "<input type='hidden' name='count' value='"+count+"'>"
                    orderFormObj.append(str).submit()
                    orderFormObj.detach()
                </c:if>
            })
        })



    </script>


    <!--===============================================================================================-->
    <script src="../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/bootstrap/js/popper.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/select2/select2.min.js"></script>
    <script>
        $(".js-select2").each(function(){
            $(this).select2({
                minimumResultsForSearch: 20,
                dropdownParent: $(this).next('.dropDownSelect2')
            });
        })
    </script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/daterangepicker/moment.min.js"></script>
    <script src="../resources/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/slick/slick.min.js"></script>
    <script src="../resources/js/slick-custom.js"></script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/parallax100/parallax100.js"></script>
    <script>
        $('.parallax100').parallax100();
    </script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
    <script src="../resources/vendor/isotope/isotope.pkgd.min.js"></script>
    <!--===============================================================================================-->
    <script src="../resources/vendor/sweetalert/sweetalert.min.js"></script>
    <script>
        $('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
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
    <script src="../resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
    <script src="../resources/js/main.js"></script>

</body>
</html>
