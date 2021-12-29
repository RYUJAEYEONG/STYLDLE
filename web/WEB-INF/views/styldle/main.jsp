<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
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
<body>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/js/heart.js"></script>

<!-- Slider -->
<!-- Store 미리보기 -->
<section class="section-slide">
    <div class="wrap-slick1">
        <div class="slick1">

            <c:forEach items="${storeList}" var="i">
                <div class="item-slick1 uploadOneImg${i.productId}"
                     style="background-image: url(/resources/images/slide-01.jpg);">
                    <div class="container h-full">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
                            <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
                                <span class="ltext-101 cl2 respon2" style="font-size: 30px">${i.productName}</span>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="font-size: 50px">
                                    <fmt:formatNumber value="${i.price}" pattern="###,###,###"/>원
                                </h2>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                                <a href="/store/get?productId=${i.productId}"
                                   class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
                                    구매하기
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>

<script>
    // store 이미지 불러오기
    <c:forEach items="${storeList}" var="i">
    var productId = ${i.productId}
        $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
            var str = ''
            console.log(arr[0])
            var fileCallPath = encodeURIComponent(arr[0].uploadPath + '/' + arr[0].uuid + '_' + arr[0].fileName)
            str += "/display?fileName=" + fileCallPath;
            console.log(fileCallPath)
            $('.uploadOneImg${i.productId}').css("background-image", "url('" + str + "')");
        })
    </c:forEach>
</script>

<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
                <!-- Block1 -->
                <div class="block1 wrap-pic-w">
                    <img src="/resources/image/white.jpg"  alt="IMG-BANNER">

                    <a href="/store/list"
                       class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                        <div class="block1-txt-child1 flex-col-l">
                            <span class="block1-name ltext-102 trans-04 p-b-8">
                                Store
                            </span>

                            <span class="block1-info stext-102 trans-04">
                                오직 스타일들에서만 만날 수 있는 옷을 구경해보세요!
                            </span>
                        </div>

                        <div class="block1-txt-child2 p-b-4 trans-05">
                            <div class="block1-link stext-101 cl0 trans-09">
                                바로가기
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
                <!-- Block1 -->
                <div class="block1 wrap-pic-w">
                    <img src="/resources/image/white.jpg" alt="IMG-BANNER">

                    <a href="/style/list"
                       class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                        <div class="block1-txt-child1 flex-col-l">
                            <span class="block1-name ltext-102 trans-04 p-b-8">
                                Style
                            </span>

                            <span class="block1-info stext-102 trans-04">
                                다양한 패션 정보를 확인하고 자신만의 스타일링을 공유해보세요!
                            </span>
                        </div>

                        <div class="block1-txt-child2 p-b-4 trans-05">
                            <div class="block1-link stext-101 cl0 trans-09">
                                바로가기
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
                <!-- Block1 -->
                <div class="block1 wrap-pic-w">
                    <img src="/resources/image/white.jpg"  alt="IMG-BANNER">

                    <a href="/qna/list"
                       class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                        <div class="block1-txt-child1 flex-col-l">
                            <span class="block1-name ltext-102 trans-04 p-b-8">
                                Q&A
                            </span>

                            <span class="block1-info stext-102 trans-04">
                                패션과 관련된 질문과 답변을 주고 받아보세요!
                            </span>
                        </div>

                        <div class="block1-txt-child2 p-b-4 trans-05">
                            <div class="block1-link stext-101 cl0 trans-09">
                                바로가기
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 스타일 미리보기 -->
<section class="bg0 p-t-23 p-b-43">
    <div class="container">
        <div class="p-b-10 flex-w flex-sb-m">
            <h3 class="ltext-103 cl5">
                <a href="/style/list" style="color: black">Style</a>
            </h3>
            <a href="/style/list" class="stext-106 cl6 hov1 bor3 trans-04 m-tb-5 how-active1" data-filter="*">
                바로가기 >
            </a>
        </div>

        <div class="row isotope-grid">
            <%-- 스타일 목록 --%>
            <c:forEach items="${styleList}" var="board">
                <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                    <!-- Block2 -->
                    <div class="block2">
                            <%-- 스타일 사진 --%>
                        <div class="block2-pic hov-img0" id="uploadResult${board.postId}"></div>

                        <div class="block2-txt flex-w flex-t p-t-14">
                            <div class="row" style="width: 100%; flex: 100%;">
                                <div class="col">
                                    <p class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            ${board.userId}
                                    </p>
                                </div>
                                <div class="col cl3 flex-r">
                                    <div>
                                            <%-- 하트수 --%>
                                        <i class="fa fa-heart"></i>
                                        <span id="heartCnt${board.postId}"></span>
                                            <%-- 댓글수 --%>
                                        <i class="fa fa-comment"></i>
                                        <span id="replyCnt${board.postId}"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row stext-105 cl3 m-lr-0" style="width: 100%; flex: 100%;">
                                <c:choose>
                                    <c:when test="${fn:length(board.content) gt 29}">
                                        <p style="color: #808080">${fn:substring(board.content, 0, 28)}...</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p style="color: #666">${board.content}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<script>
    // style 목록 불러오기
    <c:forEach items="${styleList}" var="board">
    // 이미지 불러오기
    $.getJSON("/style/getStyleImg", {postId: ${board.postId}}, function (img) {
        var fileCallPath = encodeURIComponent(img.uploadPath + "/" + img.uuid + "_" + img.fileName);
        var str = "<img src='/display?fileName=" + fileCallPath + "'/>";
        $(`#uploadResult${board.postId}`).prepend(str);
    })

    // 댓글수 요청하기
    $.getJSON("/replies/cnt", {postId: ${board.postId}}, function (result) {
        var str = "<small>" + result + "</small>";
        $(`#replyCnt${board.postId}`).html(str);
    })

    // 좋아요수 요청하기
    heartService.getCount(${board.postId}, function (result) {
        var str = "<small>" + result + "</small>";
        $(`#heartCnt${board.postId}`).html(str);
    })
    </c:forEach>
</script>

<!-- QnA 미리보기 -->
<section class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="p-b-15 flex-w flex-sb-m">
            <h3 class="ltext-103 cl5">
                <a href="/qna/list" style="color: black">Q&A</a>
            </h3>
            <a href="/qna/list" class="stext-106 cl6 hov1 bor3 trans-04 m-tb-5 how-active1" data-filter="*">
                바로가기 >
            </a>
        </div>

        <div class=" p-b-80">
            <div class="p-r-0-lg">
                <c:forEach var="qna" items="${qna}">
                    <div>
                        <div class="p-tb-5">
                            <div class="row">
                                <div class="col">
                                    <h4 class="stext-108">
                                        <span class="cl4">${qna.boardNo}</span>
                                        <a href="<c:url value="/qna/read?boardNo=${qna.boardNo}"/>"
                                           class="trans-04" style="color: inherit">
                                                ${qna.title}
                                        </a>
                                    </h4>
                                </div>

                                <div class="col text-right" style="padding-right: 0; padding-left: 0;">
                                    <span class="stext-111 cl2 p-r-30 m-tb-10">
                                        <span>
                                            <span class="cl4">작성일</span> <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                                                         value="${qna.regDate}"/>
                                            <span class="cl12 m-l-4 m-r-6">|</span>
                                        </span>

                                        <span>
                                            댓글 ${qna.replyCnt}
                                            <span class="cl12 m-l-4 m-r-6">|</span>
                                        </span>
                                        <span>
                                            조회수 ${qna.cnt}
                                        </span>
                                    </span>
                                </div>
                            </div>

                            <hr>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

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
    $('.gallery-lb').each(function () { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled: true
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
    $('.js-addwish-b2').on('click', function (e) {
        e.preventDefault();
    });

    $('.js-addwish-b2').each(function () {
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
        });
    });

    $('.js-addwish-detail').each(function () {
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
        });
    });

    /*---------------------------------------------*/

    $('.js-addcart-detail').each(function () {
        var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
        $(this).on('click', function () {
            swal(nameProduct, "is added to cart !", "success");
        });
    });

</script>
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