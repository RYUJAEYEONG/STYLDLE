<%--
  Created by IntelliJ IDEA.
  User: nagas
  Date: 2021-12-03
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Update</title>
</head>
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
<%--로그인한 사람만 페이지 읽기--%>
<%--<%--%>
<%--    String userId = (String) session.getAttribute("userId");--%>
<%--    System.out.println(userId);--%>
<%--    if(userId == null) {--%>
<%--        request.getRequestDispatcher("/styldle/main").forward(request, response);--%>
<%--        System.out.println("로그인 안 함");--%>
<%--    } else {--%>
<%--        System.out.println("로그인 했음");--%>
<%--    }--%>
<%--%>--%>

<style>
    .outer {
        margin:0 auto;
    }
</style>

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
				Update
			</span>
    </div>
</div>

<!--	카트자리-->

<!-- Content page -->
<form action="${path}/styldle/update" method="post">
    <section class="bg0 p-t-104 p-b-116">
        <div class="container">
            <div class="flex-w flex-tr">
                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md outer">

                    <h4 class="mtext-105 cl2 txt-center p-b-30">
                        정보 수정
                    </h4>

                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="userId"
                               placeholder="아이디" value="${userVO.userId}" readonly>
                    </div>

                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="name"
                               placeholder="이름" value="${userVO.name}">
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="email" name="mail"
                               placeholder="이메일" value="${userVO.mail}">
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="date" name="birth"
                               placeholder="생일" value="${userVO.birth}">
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="phone" id="phone"
                               onKeyup="inputPhoneNumber(this);" maxlength="13"
                               style="text-align:center;" placeholder="-없이 전화번호를 입력하세요" value="${userVO.phone}"/>
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="button"
                               onclick="execDaumPostcode()" value="우편번호 찾기">
                    </div>
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
                               id="zipCode" name="zipCode" placeholder="우편번호" value="${userVO.zipCode}">
                    </div>

                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
                               id="address" name="address" placeholder="도로명주소" size="70" value="${userVO.address}">
                    </div>


                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
                            type="submit">
                        Submit
                    </button>



                    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                    <script>
                        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                        function execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function (data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                                    var fullRoadAddr = data.address; // 도로명 주소 변수

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('zipCode').value = data.zonecode; //5자리 새우편번호 사용

                                    document.getElementById('address').value = fullRoadAddr;

                                }
                            }).open();
                        }

                        function inputPhoneNumber(obj) {
                            var number = obj.value.replace(/[^0-9]/g, "");
                            var phone = "";
                            if (number.length < 4) {
                                return number;
                            } else if (number.length < 7) {
                                phone += number.substr(0, 3);
                                phone += "-";
                                phone += number.substr(3);
                            } else if (number.length < 11) {
                                phone += number.substr(0, 3);
                                phone += "-";
                                phone += number.substr(3, 3);
                                phone += "-";
                                phone += number.substr(6);
                            } else {
                                phone += number.substr(0, 3);
                                phone += "-";
                                phone += number.substr(3, 4);
                                phone += "-";
                                phone += number.substr(7);
                            }
                            obj.value = phone;
                        }

                    </script>

                </div>

            </div>
        </div>
    </section>
</form>

    <%--footer--%>

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