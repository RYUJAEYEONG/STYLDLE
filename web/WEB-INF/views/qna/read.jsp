<%@ page import="com.styldle.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">

<%@include file ="/WEB-INF/views/includes/header.jsp" %>
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/bg-02.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
        Q&A
    </h2>
</section>
<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="/styldle/main" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <a href="/qna/list" class="stext-109 cl8 hov-cl1 trans-04">
            Q&A
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>
        <span class="stext-109 cl4">
				${board.boardNo}
			</span>
    </div>
</div>
<section class="bg0 p-t-52 p-b-20">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-9 p-b-80">
                <div class="p-r-45 p-r-0-lg">
                    <!--  -->
                    <div class="wrap-pic-w how-pos5-parent" id="uploadResult">
                        <ul>

                        </ul>
                    </div>

                    <div class="p-t-32">

                        <h4 class="ltext-109 cl2 p-b-28">
                            ${board.title}
                        </h4>
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
                                    <span class="cl4">작성일</span> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.regDate}"/>
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    </span>

                                    <span class="cl4">댓글 </span>
                                        ${board.replyCnt}
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    <span class="cl4">조회수</span> ${board.cnt}
							</span>

                        <p class="stext-117 cl6 p-b-26" style="white-space: pre-line;">
                            ${board.content}
                        </p>
                    </div>

                    <div class="flex-w flex-t p-t-16">
                        <div class="flex-w size-217">
                            <a href="/qna/list" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5" id="btnList">
                                목록
                            </a>
                            <c:if test="${userVO.userId == board.userId}">
                            <a href="/qna/modify?boardNo=<c:out value= '${board.boardNo}'/>" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5" id="btnUpdate">
                                수정
                            </a>

                            <a href="/qna/remove?boardNo=<c:out value= '${board.boardNo}'/>" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5" id="remove">
                                삭제
                            </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h4 class="mtext-112 cl2 p-b-33"> [Comment] </h4>
        <div class="p-t-40">
            <ul class="chat"></ul>
            <button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04" id="addReplyBtn">
                댓글 작성
            </button>
            <div class="panel-footer"></div>
        </div>
    </div>
</section>
<div id="outter">
    <div class="bigPictureWrapper">
        <div class="bigpicture">
        </div>
    </div>
    <style>
        .imgSize{
            width: auto;
            height: auto;
            max-width: 300px;
            max-height: 300px;
        }
        .bigPictureWrapper {
            position: absolute;
            display: none;
            justify-content: center;
            align-items: center;
            top: 0%;
            width: 100%;
            height: 100%;
            z-index: 100;
            background: rgba(255, 255, 255, 0.5);
        }
        .bigPicture {
            position: relative;
            display: flex;  /*화면의 정중앙 배치*/
            justify-content: center;  /*가운데 정렬*/
            align-items: center;
        }
        .bigPicture img {
            width: 600px;
        }
        #myModal {
            position: fixed; /* Stay in place front is invalid - may break your css so removed */
            padding-top: 100px; /* Location of the box - don't know what this does?  If it is to move your modal down by 100px, then just change top below to 100px and remove this*/
            z-index: 9999; /* Sit on top - higher than any other z-index in your site*/
        }
    </style>

    <form id="operForm" action="/qna/modify" method="get">
        <input type="hidden" id="boardNo" value="<c:out value="${board.boardNo}"/>">
        <input type="hidden" id="pageNum" value="<c:out value="${cri.pageNum}"/>">
        <input type="hidden" id="amount" value="<c:out value="${cri.amount}"/>">
        <input type="hidden" id="type" value="<c:out value="${cri.type}"/>">
        <input type="hidden" id="keyword" value="<c:out value="${cri.keyword}"/>">
    </form>
</div>
<!-- Modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Q&A 댓글</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label style="font-weight: bold">댓글</label>
                    <input class="form-controller" name="comment" placeholder="댓글을 입력해주세요." style="border: 1px solid black;">
                </div>
                <div class="form-group">
                    <label style="font-weight: bold">작성자</label>
                    <input class="form-controller" name="userId" value="${userVO.userId}" readonly>
                </div>
                <div class="form-group">
                    <label>작성일</label>
                    <input class="form-controller" name="regDate" value="">
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalRegister" type="button" class="btn btn-default">등록</button>
                <button id="modalRemove" type="button" class="btn btn-danger">삭제</button>
                <button id="modalModify" type="button" class="btn btn-default" data-dismiss="modal">수정</button>
                <button id="modalClose" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- 페이지 맨위로 -->
<div class="btn-back-to-top" id="myBtn" style="display: flex;">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>
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

<script type="text/javascript" src="/resources/js/qnareply.js"></script>
<script>
    $(document).ready(function (e){
        $('#btnList').click(function (e){
            self.location="/qna/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}";
        })
        $('#btnUpdate').click(function (e){
            self.location="/qna/modify?boardNo=${board.boardNo}&pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}";
        })
        $('#remove').click(function (e){

            alert("게시글 ${board.boardNo}번이 삭제되었습니다.")
        })
    })
    //이미지
    $(document).ready(function (){
        (function (){
            var boardNo = "${board.boardNo}";
            $.getJSON("/qna/getAttachList", {boardNo:boardNo}, function (arr){
                console.log(arr);
                var str ="";

                $(arr).each(function (i,attach){
                    console.log("attach: ",attach);
                    //imageType
                    if(attach){
                        console.log("들어오나?")
                        var fileCallPath = encodeURIComponent(attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='image'><div>";
                        str += "<img src='/display?fileName="+fileCallPath+"' class='imgSize'>";
                        str += "</div></li>";
                    }
                })
                $("#uploadResult ul").html(str);
            }) //end getJSON

        $("#uploadResult").on("click","li", function (e){
            console.log("image 보기")
            var liObj = $(this);
            var path= encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));

            if(liObj.data("type")){
                showImage(path.replace(new RegExp(/\\/g),"/"));
            }else {
                // download
                self.location = "/download?fileName="+path
            }
        })
        function showImage(fileCallPath){
        $(".bigPictureWrapper").css("display","flex").show();
        // 이미지 크게 보기
        $(".bigPicture")
            .html("<img src='/display?fileName="+fileCallPath+"'>")
            .animate({width:'100%',height:'100%'},700);
        // 다시 누르면 감추기
        $(".bigPictureWrapper").on("click", function (e){
            $(".bigPicture").animate({width:'0%', height:'0%'},700);
            setTimeout(function (){
                $(".bigPictureWrapper").hide();
            },600);
        })
        }
        })();

        //댓글
    var boardNo = "${board.boardNo}";
    var replyUL = $(".chat");
    showList(1);

    function showList(page){
        console.log('1) showList', page)
        replyService.getList({boardNo:boardNo, page:page||1},
            (replyCnt,list)=>{
            console.log("replyCnt: "+replyCnt);
            console.log("list: "+list);
            if(page == -1){
                pageNum= Math.ceil(replyCnt/10.0);
                showList(pageNum);
                return;
            }
            var str="";

            if(list == null || list.length== 0){
                replyUL.html("");
                return;
            }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str+="<li class='left clearfix' data-commentid='"+list[i].commentId+"'>";
                    str+=" <div><h5 class='mtext-112 cl2 p-b-20'>"+list[i].comment+"</h5>" +
                        "<p class='stext-107 cl6 p-b-40'>" +list[i].userId+"</p>";
                    str+="  <small class='stext-107 cl6 p-b-40'>"+replyService.displayTime(list[i].regDate)
                        +"</small><p>----------------------------------------</p>";
                    str+="  </div></li>";
                }
                replyUL.html(str);
                showReplyPage(replyCnt);
            })
    }; //getList

        //모달
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='comment']");
    var modalInputReplyer = modal.find("input[name='userId']");
    var modalInputRegDate = modal.find("input[name='regDate']");

    var modalModifyBtn = $("#modalModify");
    var modalRemoveBtn = $("#modalRemove");
    var modalRegisterBtn = $("#modalRegister");

    $("#addReplyBtn").on("click",function (e){
        //로그인 되어있지 않을때 댓글작성 불가
        if(${userVO.userId == null}){
            alert("로그인 후 이용가능합니다.")
            var loginPage = "/styldle/login"
            location.href = loginPage;
        } else {
            modalInputRegDate.closest("div").hide();
            modal.find("button[id != 'modalClose']").hide();
            modalRegisterBtn.show();
            $(".modal").modal("show");
            $(".wrap-menu-desktop how-shadow1").hide();
        }
    })

    modalRegisterBtn.on("click",function (e){
        var reply = {
            comment: modalInputReply.val(),
            userId: modalInputReplyer.val(),
            boardNo: boardNo
        }
        console.log(reply)

        replyService.add(reply,function (result){
            alert(result.isFail);
            console.log(result)
            modal.find("input").val("");
            modal.modal("hide");
            $("input[name=userId]").val(result.userId)
            showList(-1);
        })
    })
    $(".chat").on("click","li",function (e){
        var commentId = $(this).data("commentid");
        console.log("chat 들어오나?"+commentId);
        replyService.get(commentId, function (reply){
            console.log("reply: "+reply)
            modalInputReply.val(reply.comment);
            modalInputReplyer.val(reply.userId);
            modalInputRegDate.val(replyService.displayTime(reply.regDate))
            .attr("readonly","readonly");
            modal.data("commentId",reply.commentId);

            modal.find("button[id !='modalClose']").hide();
            modalModifyBtn.show();
            modalRemoveBtn.show();

            $(".modal").modal("show");
        })
    })
        modalModifyBtn.on("click",function (e){
            var comment = {
                commentId: modal.data("commentId"),
                comment: modalInputReply.val()
            };
            replyService.update(comment, function (result){
                alert(result)
                modal.modal("hide")
                showList(1);
            })
        })
        modalRemoveBtn.on("click", function (e){
            var commentId = modal.data("commentId")
            replyService.remove(commentId, function (result){
                alert(result)
                modal.modal("hide")
                showList(1)
            })
        })

        // 페이징 처리
        var pageNum = 1;
        var replyPageFooter = $(".panel-footer");
        function showReplyPage(replyCnt){
            var endNum = Math.ceil(pageNum/10.0)*10;
            var startNum = endNum -9;

            var prev = startNum != 1;
            var next = false;

            if(endNum * 10 >= replyCnt){
                endNum = Math.ceil(replyCnt/10.0)
            }
            if(endNum * 10 <replyCnt) {
                next = true;
            }
            var str = "<ul class='pagination'>";
            if (prev) {
                str += "<li class='page-item'><a class='flex-c-m how-pagination1 trans-04 m-all-7' href ='" + (startNum - 1) + "'>이전</a></li>";
            }
            for (var i = startNum; i <= endNum; i++) {
                var active = pageNum === i ? "active" : "";
                str += "<li class='page-item " + active + " '><a class='flex-c-m how-pagination1 trans-04 m-all-7' href='" + i + "'>" + i + "</a></li>";
            }
            if (next) {
                str += "<li class='page-item'><a class='flex-c-m how-pagination1 trans-04 m-all-7' href ='" + (endNum + 1) + "'>다음</a></li>";
            }
            str += "</ul>";
            replyPageFooter.html(str);
        }
        replyPageFooter.on("click","li a",function (e){
            e.preventDefault();
            pageNum = $(this).attr("href");
            showList(pageNum)
        })
    })
    $("h2").on("click",function (e){
        location.href="/qna/list";
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