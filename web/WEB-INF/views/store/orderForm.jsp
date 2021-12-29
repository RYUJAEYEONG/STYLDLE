<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Styldle - store</title>
    <style>
        table img {
            width: 150px;
            height: auto;
        }
        table {
            margin-top: 10px;
            /*margin-left: 30px;*/
        }
        table th, td {
            text-align: center;
        }
        .orderInfo { border:5px solid #eee; padding:20px; }

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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                                <a href="index.html">BEST</a>
                            </li>
                            <li>
                                <a href="product.html">OUTER</a>
                            </li>
                            <li>
                                <a href="shoping-cart.html">TOP</a>
                            </li>
                            <li>
                                <a href="blog.html">BOTTOM</a>
                            </li>
                            <li>
                                <a href="about.html">DRESS</a>
                            </li>
                            <li>
                                <a href="contact.html">ACC</a>
                            </li>
                            <li>
                                <a href="contact.html">SHOES & BAG</a>
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
                    <a href="index.html">BEST</a>
                </li>
                <li>
                    <a href="product.html">OUTER</a>
                </li>
                <li>
                    <a href="shoping-cart.html">TOP</a>
                </li>
                <li>
                    <a href="blog.html">BOTTOM</a>
                </li>
                <li>
                    <a href="about.html">DRESS</a>
                </li>
                <li>
                    <a href="contact.html">ACC</a>
                </li>
                <li>
                    <a href="contact.html">SHOES & BAG</a>
                </li>
            </ul>
        </div>
    </header>

    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">이미지</th>
            <th scope="col">상품명</th>
            <th scope="col">가격</th>
            <th scope="col">수량</th>
            <th scope="col">합계</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="sum" value="0" />
        <c:forEach items="${list}" var="i">
            <tr>
                <td class="uploadOneImg${i.productId}">

                </td>
                <td>
                    <a href="${i.productId}" class="move">${i.productName}</a>
                </td>
                <td>
                    <fmt:formatNumber value="${i.price}" pattern="###,###,###"/>원
                </td>
                <td>${i.count}개</td>
                <td>
                    <fmt:formatNumber value="${i.price * i.count}" pattern="###,###,###"/>원
                </td>
            </tr>
            <c:set var="sum" value="${sum + (i.price * i.count)}" />
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                합계 :
                <strong class="total">
                    <fmt:formatNumber value="${sum}" pattern="###,###,###"/>
                </strong>원
            </td>
        </tr>
        </tfoot>
    </table>

    <div class="orderInfo">
        <form action="/store/orderForm" method="post" id="orderForm">
            <fieldset class="container">
                <div class="form-group">
                    <label class="col-form-label mt-4" for="orderRec">받으시는 분</label>
                    <input type="text" class="form-control" name="orderRec" id="orderRec">
                </div>
                <div class="form-group">
                    <label class="col-form-label mt-4" for="postCode">우편번호</label>
                    <input type="text" class="form-control" name="postCode" id="postCode"> <input type="button" class="addrBtn" value="우편번호 찾기&nbsp;" onClick="execDaumPostCode()">
                </div>
                <div class="form-group">
                    <label class="col-form-label mt-4" for="roadAddress">도로명주소</label>
                    <input type="text" class="form-control" name="roadAddress" id="roadAddress">
                </div>
                <div class="form-group">
                    <label class="col-form-label mt-4" for="detailAddress">상세주소</label>
                    <input type="text" class="form-control" name="detailAddress" id="detailAddress">
                </div>
                <div class="form-group">
                    <label class="col-form-label mt-4" for="orderPhone">휴대전화</label>
                    <input type="text" class="form-control" name="orderPhone" id="orderPhone">
                </div>
                <button type="submit" class="btn btn-dark order_btn">결제하기</button>
                <button type="button" class="btn btn-outline-secondary cancel_btn">취소</button>
            </fieldset>

            <c:forEach items="${list}" var="i">
                <input type="hidden" name="productId"  value="${i.productId}"/>
                <input type="hidden" name="count"  value="${i.count}"/>
            </c:forEach>
            <input type="hidden" name="total" value="${sum}" />
        </form>
    </div>

    <div>
        <form action="/store/get" id="actionForm" method="get">
        </form>
    </div>

    <script type="text/javascript">
        function execDaumPostCode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var fullAddr = data.address; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 기본 주소가 도로명 타입일때 조합한다.
                    if(data.addressType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('roadAddress').value = fullAddr;
                    document.getElementById('detailAddress').focus();
                }
            }).open()
        }

        $(document).ready(function() {
            var string = ''
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
                // string += "<input type='hidden' name='productId' value='"+productId+"'>"
            </c:forEach>

            var formObj = $('#orderForm')
            $('.order_btn').click(function(e) {
                e.preventDefault()

                let orderRec = $("input[name='orderRec']").val()
                let detailAddress = $("input[name='detailAddress']").val()
                let orderPhone = $("input[name='orderPhone']").val()
                let allOk = true

                //공란 체크
                if(!orderRec) {
                    alert('받으시는 분을 입력하세요.')
                    allOk = false
                } else if (!detailAddress) {
                    alert('상세주소를 입력하세요.')
                    allOk = false
                } else if (!orderPhone) {
                    alert('휴대전화를 입력하세요.')
                    allOk = false
                }

                console.log(string)
                if(allOk) formObj.submit()
            })

            $('.cancel_btn').click(function(e) {
                self.location = "/store/list"
            })

            var actionForm = $('#actionForm')
            $('.move').click(function (e) {
                console.log('move 눌렸다')
                e.preventDefault()
                actionForm.append("<input class='productIdTemp' type='hidden' name='productId' value='"+$(this).attr('href')+"'>")
                actionForm.attr('action', '/store/get')
                actionForm.submit()
                $('.productIdTemp').detach()
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
