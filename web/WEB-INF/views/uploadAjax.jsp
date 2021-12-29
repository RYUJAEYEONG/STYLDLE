<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    </style>
</head>
<body>
    <div class="bigPictureWrapper">
        <div class="bigPicture">

        </div>
    </div>
    <h1>upload with ajax</h1>
    <div class="uploadDiv">
        <input type="file" name="uploadFile" accept="image/gif, image/jpeg, image/png" multiple>
    </div>
    <div class="uploadResult">
        <ul>

        </ul>
    </div>
    <button id="uploadBtn">upload</button>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        const showImage = (fileCallPath) => {
            $('.bigPictureWrapper').css('display', 'flex').show()
            $('.bigPicture')
            .html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
            .animate({width: '100%', height: '100%'}, 1000)
        }

        $(document).ready(function() {
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

            var cloneObj = $('.uploadDiv').clone()
            $('#uploadBtn').click(function(e) {
                var formData = new FormData()
                var inputFile = $("input[name='uploadFile']")
                var files = inputFile[0].files
                console.log(files)

                for(var i=0;i<files.length;i++){
                    if(!checkExtension(files[i].name, files[i].size)){
                        return false
                    }
                    formData.append('uploadFile', files[i])
                }

                $.ajax({
                    url: '/uploadAjaxAction',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    dataType: 'json',
                    success: function(result) {
                        console.log(result)
                        showUploadedFile(result)
                        $('.uploadDiv').html(cloneObj.html())
                    }
                })
            })

            var uploadResult = $('.uploadResult ul')
            const showUploadedFile = (uploadResultArr) => {
                var str = ''
                $(uploadResultArr).each(function(i, obj) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath+'/s_'+obj.uuid+'_'+obj.fileName)
                    var originPath = obj.uploadPath+'\\'+obj.uuid+'_'+obj.fileName
                    originPath = originPath.replace(new RegExp(/\\/g), '/')
                    str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">" +
                        "<img src='/display?fileName="+fileCallPath+"'></a>" +
                        "<span data-file=\'"+fileCallPath+"\'> x </span></li>"
                })
                uploadResult.append(str)
            }

            $('.bigPictureWrapper').click(function(e) {
                $('.bigPicture').animate({width: '0%', height: '0%'}, 1000)
                setTimeout(() => {
                    $(this).hide()
                }, 1000)
            })

            $('.uploadResult').on('click', 'span', function(e) {
                var targetFile = $(this).data('file')
                console.log(targetFile)

                $.ajax({
                    url: '/deleteFile',
                    data: {fileName: targetFile},
                    dataType: 'text',
                    type: 'POST',
                    success: function(result) {
                        alert(result)
                    }
                })
            })
        })
    </script>
</body>
</html>
