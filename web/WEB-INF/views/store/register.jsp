<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.styldle.vo.UserVO" %>
<html>
<head>
    <title>Styldle - admin</title>
    <style>
        .uploadResult ul li {
            list-style: none;
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
        }
        .bigPicture {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .bigPicture img {
            width: 600px;
        }
        .container {
            max-width: 250px;
            margin: 100px auto;
            padding: 20px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon_modify.png"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
</head>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">
<c:if test="${userVO.role != 'admin'}">
    <script>
        alert("관리자 권한입니다.");
        history.back();
    </script>
</c:if>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">STYLDLE 관리자</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse show" id="navbarColor01" style="">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/store/register">상품 등록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/store/adminList">상품 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/store/adminOrderList">주문 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/store/list">메인 화면</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<form action="/store/register" method="post">
    <fieldset class="container">
        <legend>상품 등록</legend>
        <div class="form-group">
            <label class="col-form-label mt-4" for="productName">상품명</label>
            <input type="text" class="form-control" name="productName" id="productName">
        </div>
        <div class="form-group">
            <label for="type" class="form-label mt-4">상품분류</label>
            <select class="form-select" id="type" name="type" required>
                <option value="outer">outer</option>
                <option value="top">top</option>
                <option value="bottom">bottom</option>
                <option value="dress">dress</option>
                <option value="acc">acc</option>
                <option value="shoes/bag">shoes/bag</option>
            </select>
        </div>
        <div class="form-group">
            <label for="detail" class="form-label mt-4">상품 상세설명</label>
            <textarea class="form-control" name="detail" id="detail" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label class="col-form-label mt-4" for="price">판매가</label>
            <input type="number" class="form-control" name="price" id="price">
        </div>
        <div class="form-group">
            <label class="col-form-label mt-4" for="stock">재고</label>
            <input type="number" class="form-control" name="stock" id="stock">
        </div>
        <div class="form-group">
            <label for="uploadFile" class="form-label mt-4">이미지</label>
            <div class="uploadDiv">
                <input class="form-control" type="file" id="uploadFile" name="uploadFile" accept="image/gif, image/jpeg, image/png" multiple>
            </div>
            <div class="uploadResult">
                <ul>

                </ul>
            </div>
        </div>
        <button type="submit" class="btn btn-dark">등록</button>
        <button type="reset" class="btn btn-outline-secondary">초기화</button>
    </fieldset>
</form>

<script type="text/javascript">
    $(document).ready(function(e) {
        //전송버튼 클릭 시
        var formObj = $('form')
        $("button[type='submit']").click(function(e) {
            e.preventDefault()

            let productName = $("input[name='productName']").val()
            let type = $("select[name='type']").val()
            let detail = $("textarea[name='detail']").val()
            let price = $("input[name='price']").val()
            let stock = $("input[name='stock']").val()
            let uploadFile = $("input[name='uploadFile']").val()
            let allOk = true

            //공란 체크
            if(!productName) {
                alert('상품명을 입력하세요.')
                allOk = false
            } else if (!type) {
                alert('상품분류를 선택하세요.')
                allOk = false
            } else if (!detail) {
                alert('상세설명을 입력하세요.')
                allOk = false
            } else if (!price) {
                alert('가격을 입력하세요.')
                allOk = false
            } else if (!stock) {
                alert('재고를 입력하세요.')
                allOk = false
            } else if (!uploadFile) {
                alert('이미지를 선택하세요.')
                allOk = false
            }

            var str = ''
            $('.uploadResult ul li').each(function(i, obj) {
                var jobj = $(obj)
                console.dir(jobj)
                str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>"
                str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>"
                str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>"
            })
            if(allOk) formObj.append(str).submit()
        })

        //파일 종류 및 크기 확인
        var maxSize = 5242880 //5MB
        const checkExtension = (fileName, fileSize) => {
            var pathPoint = fileName.lastIndexOf('.')
            var filePoint = fileName.substring(pathPoint+1, fileName.length)
            var fileType = filePoint.toLowerCase()
            if(fileType!='jpg' && fileType!='gif' && fileType!='png' && fileType!='jpeg' && fileType!='bmp'){
                alert('업로드 하신 파일을 이미지 파일이 아닙니다. \n확인 후 다시 올려주시기 바랍니다.')
                return false
            }
            if(fileSize >= maxSize){
                alert('파일 사이즈를 초과하였습니다.')
                return false
            }
            return true
        }

        //파일 업로드
        $("input[type='file']").change(function(e) {
            var formData = new FormData()
            var inputFile = $("input[name='uploadFile']")
            var files = inputFile[0].files

            for(var i=0;i<files.length;i++){
                if(!checkExtension(files[i].name, files[i].size)){
                    return false
                }
                formData.append('uploadFile', files[i])
            }

            $.ajax({
                url: '/uploadAjaxProduct',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    console.log(result)
                    showUploadedFile(result)
                }
            })
        })

        //파일 썸네일 보기
        const showUploadedFile = (uploadResultArr) => {
            if(!uploadResultArr || uploadResultArr.length == 0){
                return;
            }
            var uploadResult = $('.uploadResult ul')
            var str = ''

            $(uploadResultArr).each(function(i, obj) {
                var fileCallPath = encodeURIComponent(obj.uploadPath+'/s_'+obj.uuid+'_'+obj.fileName)
                str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'><div>"
                str += "<span>"+obj.fileName+"</span>"
                str += "<button type='button' data-file=\'"+fileCallPath+"\'>x</button><br>"
                str += "<img src='/display?fileName="+fileCallPath+"'>"
                str += "</div></li>"
            })
            uploadResult.append(str)
        }

        //파일 삭제
        $('.uploadResult').on('click', 'button', function(e) {
            console.log('삭제 버튼 눌린다')
            var targetFile = $(this).data('file')
            var targetLi = $(this).closest('li')

            $.ajax({
                url: '/deleteImage',
                data: {fileName: targetFile},
                dataType: 'text',
                type: 'POST',
                success: function(result) {
                    targetLi.remove()
                }
            })
        })
    })
</script>
</body>
</html>
