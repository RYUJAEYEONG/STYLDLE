<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
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
<script>
    function selChange(){
        var sel = document.getElementById('amount').value;
        location.href="/qna/list?pageNum=1&amount="+sel;
    }
</script>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">
<%@include file ="/WEB-INF/views/includes/header.jsp" %>
<%--cart--%>

<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/bg-02.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
        Q&A
    </h2>
</section>
<section class="bg0 p-t-62 p-b-60">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-9 p-b-80">
                <div class="p-r-45 p-r-0-lg">
                    <c:forEach var="qna" items="${qna}" varStatus="loop">
                        <div class="p-b-63">
                            <div class="p-t-32">
                                <h4 class="p-b-15">
                                    <span>${qna.boardNo}</span>
                                    <a href="<c:url value="/qna/read?boardNo=${qna.boardNo}&pageNum=${paging.cri.pageNum}&amount=${paging.cri.amount}&type=${paging.cri.type}&keyword=${paging.cri.keyword}" /> "
                                       class="ltext-108 cl2 hov-cl1 trans-04">
                                            ${qna.title}
                                    </a>
                                </h4>

                                <p class="stext-117 cl6">
                                        ${qna.userId}
                                </p>

                                <div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4">작성일</span> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.regDate}"/>
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
                                    <a href="<c:url value="/qna/read?boardNo=${qna.boardNo}&pageNum=${paging.cri.pageNum}&amount=${paging.cri.amount}&type=${paging.cri.type}&keyword=${paging.cri.keyword}" />" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
                                        Continue Reading

                                        <i class="fa fa-long-arrow-right m-l-9"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
                    <c:if test="${paging.startPage != 1}">
                        <a href="/qna/list?pageNum=1&amount=${paging.cri.amount}" class="flex-c-m how-pagination1 trans-04 m-all-7"><< </a>
                    </c:if>
                    <c:if test="${paging.prev}">
                        <a href="/qna/list?pageNum=${paging.startPage -1}&amount=${paging.cri.amount}" class="flex-c-m how-pagination1 trans-04 m-all-7">이전</a>
                    </c:if>
                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                        <a href="/qna/list?pageNum=${num}&amount=${paging.cri.amount}" value="${num}" id="paginate_button" class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a>
                    </c:forEach>
                    <c:if test="${paging.next}">
                        <a href="/qna/list?pageNum=${paging.endPage +1}&amount=${paging.cri.amount}" class="flex-c-m how-pagination1 trans-04 m-all-7">다음</a>
                    </c:if>
                    <c:if test="${paging.endPage != paging.realEnd}">
                        <a href="/qna/list?pageNum=${paging.realEnd}&amount=${paging.cri.amount}" class="flex-c-m how-pagination1 trans-04 m-all-7"> >></a>
                    </c:if>
                </div>
            </div>

            <div class="col-md-4 col-lg-3 p-b-80">
                <div class="side-menu">
                    <div class="p-t-50">
                        <h4 class="mtext-112 cl2 p-b-27">
                            Search
                        </h4>
                        <form id="searchForm" action="/qna/list" method="get">
                            <div class="area-custom-select">
                                <select class="form-control" name="type">
                                    <option value=""
                                            <c:out value="${paging.cri.type == null?'selected':''}"/>>---</option>
                                    <option value="T"
                                            <c:out value="${paging.cri.type eq 'T'?'selected':''}"/>>제목</option>
                                    <option value="C"
                                            <c:out value="${paging.cri.type eq 'C'?'selected':''}"/>>내용</option>
                                    <option value="W"
                                            <c:out value="${paging.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                                    <option value="TC"
                                            <c:out value="${paging.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
                                    <option value="TW"
                                            <c:out value="${paging.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
                                    <option value="TCW"
                                            <c:out value="${paging.cri.type eq 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
                                </select>
                            </div>
                            <br>
                            <div class="bor17 of-hidden pos-relative">
                                <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="keyword" value="${paging.cri.keyword}" placeholder="검색" >
                                <input type="hidden" name="pageNum" value="${paging.cri.pageNum}"/>
                                <input type="hidden" name="amount" value="${paging.cri.amount}"/>
                                <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchBtn">
                                    <i class="zmdi zmdi-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="p-t-50">
                        <div class="area-custom-select">
                            <select id="amount" class="form-control" onchange="selChange()" >
                                <option value="5"
                                        <c:if test="${paging.cri.amount == 5}">selected</c:if>>5줄씩 보기</option>
                                <option value="10"
                                        <c:if test="${paging.cri.amount == 10}">selected</c:if>>10줄씩 보기</option>
                                <option value="15"
                                        <c:if test="${paging.cri.amount == 15}">selected</c:if>>15줄씩 보기</option>
                            </select>
                        </div>
                    </div>
                    <div class="p-t-55">
                        <%
                            if(session.getAttribute("userVO") != null){
                        %>
                        <button class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer" type="button" onclick="location.href='<c:url value="/qna/register"/>'">글쓰기</button>
                        <%
                        }else {
                        %>
                        <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04"  id="btnLogin" onclick="location.href='/styldle/login'">
                            로그인</button>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="btn-back-to-top" id="myBtn" style="display: flex;">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<form id="actionForm" action="/qna/list" method="get">
    <input type="hidden" name="pageNum" value="${paging.cri.pageNum}"/>
    <input type="hidden" name="amount" value="${paging.cri.amount}"/>
    <input type="hidden" name="type" value="${paging.cri.type}"/>
    <input type="hidden" name="keyword" value="${paging.cri.keyword}"/>
</form>
<%--footer--%>
<%@include file ="/WEB-INF/views/includes/footer.jsp" %>

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
    $(document).ready(function (){
        var actionForm = $('#actionForm');
        var pagingbtn = $('#paginate_button');
        console.log(pagingbtn);
        $(pagingbtn).on("click",function (e){
            e.preventDefault();
            console.log("click");
            var page= $(this).attr("value");
            console.log(page);
            actionForm.find("input[name='pageNum']").val(page);
            actionForm.submit();
        })
        $('#searchBtn').on("click",function (e){
            console.log("searchForm!!");
            e.preventDefault();
            var searchForm = $('#searchForm');
            console.log(searchForm);
            if(!searchForm.find("option:selected").val()){
                alert("검색 종류를 선택하세요");
                return false;
            }
            if(!searchForm.find("input[name='keyword']").val()){
                alert("키워드를 입력하세요");
                return false;
            }
            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            searchForm.submit()
        })
        $("h2").on("click",function (e){
            location.href="/qna/list";
        })
    })
    //화살표 누르면 맨위로 이동
    $('#myBtn').on("click",function (e){
        $('html,body').scrollTop(0);
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