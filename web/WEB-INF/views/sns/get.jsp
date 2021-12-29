<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>Styldle</title>
    <style>
        <%-- 페이지 번호 리스트 가로 설정(임시) --%>
        .panel-footer ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        .panel-footer ul li {
            margin: 0 0 0 0;
            padding: 0 0 0 0;
            border: 0;
            float: left;
        }
    </style>
</head>
<body>
<div>
    <div>
        <div class="uploadResult"></div>
        <div>
            <p>${post.userId}</p>
            <p>${post.date}</p>
            <p>${post.content}</p>
        </div>
        <div>
            <%-- 로그인 상태가 아닐 때 - 비활성화(나중에) --%>
            <span id="heart"></span><small id="heartCnt"></small>
            <form>
                <input type="hidden" name="postId" value="${post.postId}" />
                <button type="button" data-oper="update" id="update">수정</button> |
                <button type="button" data-oper="delete" id="delete">삭제</button>
            </form>
        </div>
    </div>
    <hr>
    <div>
        <p>댓글</p>
        <input type="text" id="replyInput" placeholder="댓글을 입력해주세요."/>
        <button type="button" id="registerBtn">등록</button>
        <div class="panel-body">
            <ul class="chat"></ul>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript" src="/resources/js/heart.js"></script>
<script>

    // 현재 페이지 공유
    var thisUrl = document.URL;
    console.log(thisUrl);

    function reconfirm(str) {
        return confirm('정말 ' + str + '하시겠습니까?');
    }

    $(document).ready(function (e) {
        var postId = "<c:out value='${post.postId}'/>";
        var formObj = $("form");
        var heart = { postId: postId, userId: 'jihye' } // 로그인 구현 후 userId 수정할 것
        var heartYN = false;
        var jHeart = $("#heart");

        (function () {
            // 스타일 이미지 불러오기
            $.getJSON("/style/getStyleImg", {postId: parseInt(postId)}, function (img) {
                var fileCallPath = encodeURIComponent(img.uploadPath + "/s_" + img.uuid + "_" + img.fileName);
                var str = `<div data-path="${'${img.uploadPath}'}" data-filename="${'${img.fileName}'}" data-type="image" data-uuid="${'${img.uuid}'}">
                    <div>
                        <img src="/display?fileName=${'${fileCallPath}'}">
                    </div>
                    </div>`
                $(".uploadResult").append(str);
            })
            // 좋아요 조회
            getHeart(heart);
        })()

        function getHeart(heart) {
            heartService.get(heart, function (isClicked) {
                heartToggle(isClicked);
                getHeartCount(heart.postId);
            })
        }

        function heartToggle(isClicked) {
            if (isClicked) {
                heartYN = true;
                // 하트 채우고 빨간색으로 칠하기
                jHeart.css("color", "red")
                    .html("<i class='fas fa-heart'></i>");
            } else {
                heartYN = false;
                // 빈 하트 출력
                jHeart.css("color", "black")
                    .html("<i class='far fa-heart'></i>");
            }
        }

        // 좋아요수를 가져오는 함수
        function getHeartCount(postId) {
            heartService.getCount(postId, function (result) {
                $("#heartCnt").text(result);
            })
        }

        // 좋아요 저장/좋아요 취소
        jHeart.click(function (e) {
            if (heartYN) {
                heartService.remove(heart, function (result) {
                    if (result === "success") getHeart(heart);
                })
            } else {
                heartService.save(heart, function (result) {
                    if (result === "success") getHeart(heart);
                })
            }
        })

        // 게시글 수정, 삭제 버튼
        $("button").click(function (e) {
            e.preventDefault();
            var operation = $(this).data('oper')
            if (operation === 'update') {
                formObj.attr('action', '/style/update').submit();
            } else if (operation === 'delete' && reconfirm("삭제")) {
                formObj.attr('action', '/style/delete').submit();
            }
        })

        // 댓글 목록 가져오기
        var replyUL = $(".chat");
        var pageNum = 1;

        showCommentList(1);

        function showCommentList(page) {
            replyService.getList({postId: postId, page: page || 1}, function (replyCnt, list) {

                if (page === -1) {
                    pageNum = Math.ceil(replyCnt / 10.0);
                    showCommentList(pageNum);
                    return;
                }

                if (list == null || list.length === 0) {
                    replyUL.html("");
                    return;
                }

                var str = "";
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += `<li class="comment" data-commentid="${'${list[i].commentId}'}">
                        <div>
                            <strong>${'${list[i].userId}'}</strong>
                            <small>${'${replyService.displayTime(list[i].date)}'}</small>
                            <button type="button" data-commentid="${'${list[i].commentId}'}">
                                삭제
                            </button>
                        </div>
                        <div>
                            <p>${'${list[i].comment}'}</p>
                        </div>
                    </li>`
                }
                replyUL.html(str);
                // 댓글 페이지 번호 출력
                showReplyPage(replyCnt);
            })
        }

        // 댓글 등록
        $("#registerBtn").click(function (e) {
            var comment = $("#replyInput").val();
            if (comment === "") {
                alert("댓글 내용을 입력해주세요.");
                return;
            }
            var reply = {
                comment: comment,
                userId: 'jihye', // 로그인 구현 후 수정
                postId: postId
            }
            replyService.add(reply, function (result) {
                showCommentList(-1);
                $("#replyInput").val("");
            })
        })

        // 댓글 삭제
        replyUL.on("click", "button", function (e) {
            if (!reconfirm("삭제")) return;
            var commentId = $(this).data("commentid");
            replyService.remove(commentId, function (count) {
                showCommentList(pageNum);
            }, function (err) {
                alert("삭제 중 에러");
            })
        })

        /*
        // 댓글 수정 테스트
        replyService.update({
            commentId: 4,
            postId: 2,
            comment: "자바스크립트에서 수정"
        }, function (result) {
            alert("수정 완료");
        })
        */

        // 댓글 페이지 번호 출력
        var replyPageFooter = $(".panel-footer");

        function showReplyPage(replyCnt) {
            var endNum = Math.ceil(pageNum / 10.0) * 10;
            var startNum = endNum - 9;
            var prev = startNum !== 1;
            var next = false;

            if (endNum * 10 >= replyCnt) {
                endNum = Math.ceil(replyCnt / 10.0);
            }
            if (endNum * 10 < replyCnt) {
                next = true;
            }

            var str = "<ul class='pagination pull-right'>";
            if (prev) {
                str += "<li class='page-item'><a class='page-link' href ='" + (startNum - 1) + "'>이전</a></li>";
            }
            for (var i = startNum; i <= endNum; i++) {
                var active = pageNum === i ? "active" : "";
                str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }
            if (next) {
                str += "<li class='page-item'><a class='page-link' href ='" + (endNum + 1) + "'>다음</a></li>";
            }
            str += "</ul>";
            replyPageFooter.html(str);
        }

        replyPageFooter.on("click", "li a", function (e) {
            e.preventDefault();
            pageNum = $(this).attr("href");
            showCommentList(pageNum);
        });

    })
</script>
</body>
</html>
