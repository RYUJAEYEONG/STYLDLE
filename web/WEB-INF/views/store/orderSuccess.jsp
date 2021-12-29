<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<html>
<head>
    <title>Styldle</title>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <!--===============================================================================================-->
</head>
<style>
    .outer {
        margin:0 auto;
    }
    img{
        height: 200px;
        width: 200px;
    }
</style>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">
<%@include file ="/WEB-INF/views/includes/header.jsp" %>
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/bg-02.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
        주문 확인서
    </h2>
</section>
<!-- breadcrumb -->
<div class="container">
</div>
<section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <div class="flex-w flex-tr">

            <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md outer">
                <h4 class="mtext-105 cl2 txt-center p-b-30">
                    주문 확인서
                </h4>
                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            주문번호
                        </span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            ${order.orderId}
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            주문자 이름
                        </span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            ${order.userId}
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42" id="productImg">

                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            상품
                        </span>
                    </div>
                    <c:forEach items="${orderV}" var="i">
                        <div class="size-212 p-t-2" >
                            <p class="uploadOneImg${i.productId}" id="img">

                            </p>
                            <p class="stext-115 cl6 size-213 p-t-18">
                                [${i.productName}]    수량 ${i.count}
                            </p>

                        </div>

                    </c:forEach>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            받는 분 이름
                        </span>
                    </div>

                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            ${order.orderRec}
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            받는 분 전화번호
                        </span>
                    </div>

                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            ${order.orderPhone}
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                            <span class="mtext-110 cl2">
                                받는 분 주소
                            </span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            우편번호 ${order.postCode}
                        </p>
                    </div>
                    <div class="size-212 p-t-2">
                        ${order.roadAddress} ${order.detailAddress}
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">총 가격:   ${order.total}원</span>
                    </div>

                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            주문 날짜
                        </span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            ${orderV[0].orderDate}
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
                    <div class="size-212 p-t-2">
                        <span class="mtext-110 cl2">
                            배송 상태
                        </span>
                    </div>
                    <div class="size-212 p-t-2">
                        <p class="stext-115 cl6 size-213 p-t-18">
                            ${orderV[0].delivery}
                        </p>
                    </div>
                </div>
                <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick="location.href='/styldle/main'">
                    확인
                </button>
            </div>

        </div>
    </div>
    </div>
</section>
</body>

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

<script>
    $(document).ready(function() {
        var string = ''
        <c:forEach items="${orderV}" var="i">
        var productId = ${i.productId}
            $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                var str = ''
                console.log(arr[0])
                var fileCallPath = encodeURIComponent(arr[0].uploadPath+'/'+arr[0].uuid+'_'+arr[0].fileName)
                str += "<img src='/display?fileName="+fileCallPath+"'>"
                console.log(fileCallPath)
                $('.uploadOneImg${i.productId}').html(str)
            })
        string += "<input type='hidden' name='productId' value='"+productId+"'>"
        </c:forEach>
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