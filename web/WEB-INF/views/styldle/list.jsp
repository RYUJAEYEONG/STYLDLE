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
    <title>Member List</title>
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
<%--페이지 한 번만 새로고침--%>
<%--새로고침을 한 번해야 카트삭제가 바로 확인됨--%>
<%--<script>--%>
<%--    window.onload = function () {--%>
<%--        if (location.href.indexOf('reloaded') == -1) location.replace(location.href + '?reloaded');--%>
<%--        //if (parent.location.href.indexOf('reloaded')==-1) parent.location.replace(parent.location.href+'?reloaded');--%>
<%--    }--%>
<%--</script>--%>

<style>
    .column-6 {
        text-align: center;
        padding-right: 10px;
        font-size: 16px;
        width:auto;
    }

    .column-7 {
        text-align: center;
        font-size: 16px;
        width:auto;
    }

    .width130 {
        width:130%;
    }


    .outer {
        margin: 0 auto;
    }
</style>
<%
    String role = (String) session.getAttribute("role");
    System.out.println(role);
    if (!role.equals("admin")) {
        request.getRequestDispatcher("/styldle/main").forward(request, response);
        System.out.println("관리자가 아닙니다");
    } else {
        System.out.println("관리자입니다");
    }
%>
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
				Member List
			</span>
    </div>
</div>

<%--회원리스트--%>
<form class="bg0 p-t-75 p-b-85">
    <div class="container">
        <div class="row">
            <div class="out width130">
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
                                <th class="column-7">아이디</th>
                                <th class="column-7">이름</th>
                                <th class="column-7">생일</th>
                                <th class="column-7">성별</th>
                                <th class="column-7">이메일</th>
                                <th class="column-7">주소</th>
                                <th class="column-6">포인트</th>
                            </tr>

                            <c:forEach items="${list}" var="list">
                                <tr class="table_row">

                                    <td class="column-0">
                                        <div class="checkBox">
                                            <input type="checkbox" name="chBox" class="chBox"
                                                   data-userId="${list.userId}"/>
                                        </div>
                                        <script>
                                            $(".chBox").click(function () {
                                                $("#allCheck").prop("checked", false);
                                            });
                                        </script>
                                    </td>
                                    <td class="column-7">${list.userId}</td>
                                    <td class="column-7">${list.name}</td>
                                    <td class="column-7">${list.birth}</td>
                                    <td class="column-7">${list.gender}</td>
                                    <td class="column-7">${list.mail}</td>
                                    <td class="column-7">${list.address}</td>
                                    <td class="column-6">${list.point}</td>
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

                                            var confirm_val = confirm("정말 강퇴하시겠습니까?");

                                            if (confirm_val) {
                                                var checkArr = new Array();
                                                $("input[class='chBox']:checked").each(function () {
                                                    checkArr.push($(this).attr("data-userId"));
                                                });
                                                $.ajax({
                                                    url: "/styldle/userban",
                                                    type: "post",
                                                    data: {chbox: checkArr},
                                                    success: function (result) {
                                                        location.href = "/styldle/list";
                                                        if (result == 1) {
                                                            location.href = "/styldle/list";
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
                    </div>


                    <%--  페이지네이션  --%>

                        <div id="pagination"  class="flex-c-m flex-w w-full p-t-38">
                            <c:if test="${pageMaker.prev}">
                                <li class="paginate_button previous">
                                    <a class="flex-c-m how-pagination1 trans-04 m-all-7" href="${pageMaker.startPage - 1}" > << </a>
                                </li>
                            </c:if>

                            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}">
                                    <a class="flex-c-m how-pagination1 trans-04 m-all-7" href="${num}">${num}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next}">
                                <li class="paginate_button next">
                                    <a class="flex-c-m how-pagination1 trans-04 m-all-7" href="${pageMaker.endPage + 1}" > >> </a>
                                </li>
                            </c:if>
                        </div>


<%--                    <!-- Pagination -->--%>
<%--                    <div id="pagination" class="flex-c-m flex-w w-full p-t-38">--%>
<%--                        <c:if test="${pageMaker.prev}">--%>
<%--                            <a href="${pageMaker.startPage - 1}" class="flex-c-m how-pagination1 trans-04 m-all-7"> << </a>--%>
<%--                        </c:if>--%>
<%--                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">--%>
<%--                            <a href="${num}" class="flex-c-m how-pagination1 trans-04 m-all-7 ${pageMaker.cri.pageNum == num ? 'active-pagination1' : ''}">${num}</a>--%>
<%--                        </c:forEach>--%>
<%--                        <c:if test="${pageMaker.next}">--%>
<%--                            <a href="${pageMaker.endPage + 1}" class="flex-c-m how-pagination1 trans-04 m-all-7"> >> </a>--%>
<%--                        </c:if>--%>
<%--                        <form action="/style/list" id='actionForm' method="get">--%>
<%--                            <input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum}"/>--%>
<%--                            <input type='hidden' name="amount" value="${pageMaker.cri.amount}"/>--%>
<%--                        </form>--%>
<%--                    </div>--%>

                </div>

            </div>

        </div>
    </div>
</form>
<form action="/styldle/list" id='actionForm' method="get">
    <input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum}">
    <input type='hidden' name="amount" value="${pageMaker.cri.amount}">
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
    $(document).ready(function () {
        // 페이징 처리
        var actionForm = $("#actionForm");
        $(".paginate_button a").click(function (e) {
            e.preventDefault();
            var thisIs = $(this).attr("href");
            console.log("이동하려는 pageNum", thisIs);
            actionForm.find("input[name='pageNum']").val(thisIs);
            actionForm.submit();
        })
    });
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