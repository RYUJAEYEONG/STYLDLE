<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Styldle</title>
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
<body>
<%--<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>--%>
<div class="bor10 p-lr-70 p-t-55 p-b-150 p-lr-15-lg w-100">
    <h5 class="p-b-5">상품 태그</h5>
    <div class="rs1-select2 rs2-select2 bor8 bg0 m-t-9">
        <select class="js-select2" id="tagName" name="tagName">
            <option value="null">품목</option>
            <option>아우터</option>
            <option>상의</option>
            <option>바지</option>
            <option>원피스/세트</option>
            <option>스커트</option>
            <option>신발</option>
            <option>가방</option>
            <option>모자</option>
            <option>액세서리</option>
        </select>
        <div class="dropDownSelect2"></div>
    </div>
    <div id="tagNameAlert" class="alert alert-danger bor8 m-b-12" role="alert" style="display: none;">
        품목을 선택해 주세요.
    </div>
    <div class="bor8 m-t-9">
        <input class="stext-111 cl2 plh3 size-111 p-l-15 p-r-15" type="text" id="linkInput" name="link"
               placeholder="판매처 링크">
    </div>
    <div id="linkAlert" class="alert alert-danger bor8 m-b-12" role="alert" style="display: none;"></div>
    <button type="button" id="done"
            class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 m-t-30 p-lr-15 trans-04 pointer">
        추가
    </button>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    // url 유효성 검사
    function checkUrl(url) {
        var regex = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
        return regex.test(url);
    }

    $(document).ready(function (e) {

        $("#done").click(function (e) {
            e.preventDefault();
            var tagName = $("#tagName option:selected").text();
            var link = $("input[name='link']").val();

            // 경고창 처리
            $("#tagNameAlert").hide();
            $("#linkAlert").hide();

            if ($("#tagName").val() === "null") {
                $('#tagNameAlert').show();
                return;
            }
            if (link === "") {
                $('#linkAlert').text("URL을 복사해 넣어주세요.").show();
                return;
            }
            if (!checkUrl(link)) {
                $('#linkAlert').text("URL 형식이 올바르지 않습니다.").show();
                return;
            }

            // 부모 페이지에 태그 내용 추가
            var str = "";
            var liNum = $(opener.document).find("#tagList li").length;
            var linkStr = link;
            if (linkStr.length > 55) {
                linkStr = linkStr.slice(0, 50) + "...";
            }
            str += "<li id='tag" + liNum + "' class='tags stext-111 cl2 plh3 p-tb-3 txt-left'><i class='fa fa-tag''></i> ";
            str += "<strong>" + tagName + "</strong>";
            str += " - <small>" + linkStr + "</small>";
            str += "<input type='hidden' name='tagList[" + liNum + "].tagName' value='" + tagName + "'/>";
            str += "<input type='hidden' name='tagList[" + liNum + "].link' value='" + link + "'/>";
            str += "</li>";
            $(opener.document).find("#tagList").append(str);
            window.close();
        })
    })
</script>
</body>
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
</html>
