<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
<head>
    <title>Cart</title>
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
    .column-6 {
        text-align: center;
        padding-right: 10px;
        font-size: 16px;
        width: auto;
    }

    .column-7 {
        text-align: center;
        font-size: 16px;
        width: auto;
    }

    .width130 {
        width: 130%;
    }


    .outer {
        margin: 0 auto;
    }
    .imgg{
        margin: 0 auto;
    }


</style>

<body class="animsition">

<%@include file="/WEB-INF/views/includes/header.jsp" %>
<!--	카트자리-->

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
				Cart List
			</span>
    </div>
</div>
<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85">
    <div class="container">
        <div class="row">
            <div class="outer width130">
                <div class="m-l-25 m-r--38 m-lr-0-xl">
                    <div class="wrap-table-shopping-cart">
                        <table class="table-shopping-cart">
                            <tr class="table_head">
                                <th class="column-0">
                                    <div class="allCheck">
                                        <input type="checkbox" name="allCheck" id="allCheck"/><label
                                            for="allCheck"></label>
                                    </div>
                                    <script>
                                        $("#allCheck").click(function () {
                                            var chk = $("#allCheck").prop("checked");
                                            if (chk) {
                                                $(".chBox").prop("checked", true);
                                            } else {
                                                $(".chBox").prop("checked", false);
                                            }
                                        });
                                    </script>
                                </th>
                                <th class="column-7">NO</th>
                                <th class="column-7">Product</th>
                                <th class="column-7">Product Name</th>
                                <th class="column-7">Price</th>
                                <th class="column-7">Quantity</th>
                                <th class="column-6">Total</th>
                            </tr>

                            <c:forEach items="${list}" var="list" varStatus="listStatus">
                                <tr class="table_row">

                                    <td class="column-0">
                                        <div class="checkBox">
                                            <input type="checkbox" name="chBox" class="chBox"
                                                   data-cartId="${list.cartId}"
                                                   data-productId="${list.productId}"/>
                                        </div>
                                        <script>
                                            $(".chBox").click(function () {
                                                $("#allCheck").prop("checked", false);
                                            });
                                        </script>
                                    </td>
                                    <td class="column-7">

                                            ${listStatus.count}

                                    </td>
                                    <td class="column-7">
                                        <div class="how-itemcart1 imgg uploadOneImg${list.productId}">
                                        </div>
                                    </td>
                                    <td class="column-7">${list.productName}</td>
                                    <td class="column-7"><fmt:formatNumber pattern="###,###,###"
                                                                           value="${list.price}"/>원
                                    </td>

                                    <td class="column-7"><a href="/styldle/getcart?cartId=${list.cartId}"
                                                            target='_blank'>${list.count}개</a></td>

                                    <td class="column-6"><fmt:formatNumber pattern="###,###,###"
                                                                           value="${list.price * list.count}"/>원
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>

                    <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm outer">
                        <div class="flex-w flex-m m-r-20 m-tb-5">

                            <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
                                <div class="delBtn">
                                    <button type="button" class="selectDelete_btn">
                                        선택 삭제
                                    </button>
                                    <script>
                                        $(".selectDelete_btn").click(function () {

                                            var confirm_val = confirm("삭제하시겠습니까?");

                                            if (confirm_val) {
                                                var checkArr = new Array();
                                                $("input[class='chBox']:checked").each(function () {
                                                    checkArr.push($(this).attr("data-cartId"));
                                                });
                                                $.ajax({
                                                    url: "/styldle/deletecart",
                                                    type: "post",
                                                    data: {chbox: checkArr},
                                                    success: function (result) {
                                                        location.href = "/styldle/cartlist";
                                                        if (result == 1) {
                                                            location.href = "/styldle/cartlist";
                                                        } else {

                                                        }

                                                    }

                                                });

                                            }

                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                            <form action="/store/orderForm" method="get" class="orderGo">

                            </form>
                            <button class="orderBtn" type="submit">주문하기</button>
                            <script>
                                $(document).ready(function () {
                                    var str = ''
                                    var formObj = $('form')
                                    $('.orderBtn').click(function (e) {
                                        e.preventDefault()
                                        var checkArr = new Array();
                                        $("input[class='chBox']:checked").each(function () {
                                            checkArr.push($(this).attr("data-productId"));
                                        });
                                        console.log(checkArr)
                                        for (let i = 0; i < checkArr.length; i++) {
                                            str += '<input type="hidden" name="productId" value="' + checkArr[i] + '" />'
                                        }
                                        formObj.attr('action', '/store/orderForm').attr('method', 'get')
                                        formObj.append(str).submit()
                                    })
                                })

                            </script>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</form>


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

<script>
    function countOpen() {
        window.open("/styldle/getCart?cartId=", "네이버", "top=100px, left=100px, height=800px, width=1200px");
    }

    function daumOpen() {
        window.open("http://www.daum.net", "네이버", "top=100px, left=100px, height=800px, width=1200px");
    }
</script>


<script type="text/javascript">
    $(document).ready(function () {
        <c:forEach items="${list}" var="list">
        var productId = ${list.productId}
            $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                var str = ''
                console.log(arr[0])
                var fileCallPath = encodeURIComponent(arr[0].uploadPath + '/' + arr[0].uuid + '_' + arr[0].fileName)
                str += "<img src='/display?fileName=" + fileCallPath + "'>"
                console.log(fileCallPath)
                $('.uploadOneImg${list.productId}').html(str)
            })

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