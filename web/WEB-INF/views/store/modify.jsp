<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <a class="nav-link" href="/store/register">상품 등록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/store/adminList">상품 목록</a>
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

    <form action="/store/modify" method="post">
        <fieldset class="container">
            <legend>상품 수정</legend>
            <div class="form-group">
                <label class="col-form-label mt-4" for="productName">상품명</label>
                <input type="text" class="form-control" name="productName" id="productName" value="${product.productName}">
            </div>
            <div class="form-group">
                <label for="type" class="form-label mt-4">상품분류</label>
                <select class="form-select" id="type" name="type" value="${product.type}" required>
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
                <textarea class="form-control" name="detail" id="detail" rows="3">${product.detail}</textarea>
            </div>
            <div class="form-group">
                <label class="col-form-label mt-4" for="price">판매가</label>
                <input type="number" class="form-control" name="price" id="price" value="${product.price}">
            </div>
            <div class="form-group">
                <label class="col-form-label mt-4" for="stock">재고</label>
                <input type="number" class="form-control" name="stock" id="stock" value="${product.stock}">
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
            <button type="submit" data-oper="modify" class="btn btn-dark">저장</button>
            <button type="reset" data-oper="remove" class="btn btn-outline-danger">삭제</button>
            <button type="submit" data-oper="list" class="btn btn-outline-secondary">목록</button>
        </fieldset>

        <input type="hidden" name="page" value="${cri.page}">
        <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
        <input type="hidden" name="keyword" value="${cri.keyword}">
        <input type="hidden" name="productId" value="${product.productId}">
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            (function() {
                var productId = ${product.productId}
                $.getJSON("/store/getAttachList", {productId: productId}, function (arr) {
                    var str = ''
                    $(arr).each(function(i, attach) {
                        var fileCallPath = encodeURIComponent(attach.uploadPath+'/s_'+attach.uuid+'_'+attach.fileName)
                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'><div>"
                        str += "<span>"+attach.fileName+"</span>"
                        str += "<button type='button' data-file=\'"+fileCallPath+"\'>x</button><br>"
                        str += "<img src='/display?fileName="+fileCallPath+"'>"
                        str += "</div></li>"
                    })
                    $('.uploadResult ul').html(str)
                })
            })()

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
                        // $('.uploadDiv').html(cloneObj.html())
                    }
                })
            })

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

            $('.uploadResult').on('click', 'button', function(e) {
                if(confirm('해당 이미지를 삭제하시겠습니까?')){
                    var targetFile = $(this).data('file')
                    var targetLi = $(this).closest('li')

                    $.ajax({
                        url: '/deleteImage',
                        data: {fileName: targetFile},
                        dataType: 'text',
                        type: 'POST',
                        success: function(result) {
                            alert('해당 이미지가 삭제되었습니다.')
                            targetLi.remove()
                        }
                    })
                }
            })

            var formObj = $('form')
            $('button').click(function(e) {
                e.preventDefault()
                var operation = $(this).data('oper')
                console.log(operation)
                if(operation === 'remove'){
                    formObj.attr('action', '/store/remove')
                    formObj.submit()
                } else if(operation === 'list'){
                    formObj.attr('action', '/store/adminList').attr('method', 'get')
                    var pageTag = $("input[name='page']").clone()
                    var perPageNumTag = $("input[name='perPageNum']").clone()
                    var keywordTag = $("input[name='keyword']").clone()
                    formObj.empty()
                    formObj.append(pageTag)
                    formObj.append(perPageNumTag)
                    formObj.append(keywordTag)
                    formObj.submit()
                } else if(operation === 'modify'){
                    let productName = $("input[name='productName']").val()
                    let type = $("select[name='type']").val()
                    let detail = $("textarea[name='detail']").val()
                    let price = $("input[name='price']").val()
                    let stock = $("input[name='stock']").val()
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
                }
            })
        })
    </script>
</body>
</html>
