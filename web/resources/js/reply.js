var replyService = (function () {
    function add(reply, callback, error){
        $.ajax({
            type: 'post',
            url: '/replies/new',
            data: JSON.stringify(reply),
            contentType:"application/json; charset=utf-8",
            success:function(result, status,xhr){
                if(callback) callback(result)
            },
            error:function(xhr,status,er){
                if(error) error(er)
            }
        })
    }

    function getList(param, callback, error) {
        var postId = param.postId;
        var page = param.page || 1
        $.getJSON("/replies/pages/" + postId + "/" + page + ".json",
            (data) => {
                if (callback) {
                    callback(data.replyCnt, data.list)
                }
            }
        ).fail(function(xhr,status,err){
            if (error) error()
        })
    }

    function remove(commentId, callback, error) {
        $.ajax({
            type: 'delete',
            url: '/replies/' + commentId,
            success: (deleteResult, status, xhr) => {
                if(callback) callback(deleteResult)
            },
            error: (xhr,status,er) => {
                if(error) error(er);
            }
        })
    }

    function update(reply, callback, error) {
        $.ajax({
            type: 'put',
            url: '/replies/' + reply.commentId,
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: (result, status, xhr) => {
                if (callback) callback(result);
            },
            error: (xhr,status,er) => {
                if(error) error(er);
            }
        })
    }

    function displayTime (timeValue) {
        var today = new Date();
        var dateObj = new Date(timeValue);
        var gap = today.getTime() - dateObj.getTime();
        var str = "";
        if (gap < (1000 * 60 * 60 * 24)) {
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();
            return [(hh > 9 ? '' : '0') + hh,
                (mi > 9 ? '' : '0') + mi,
                (ss > 9 ? '' : '0') + ss
            ].join(":")
        } else {
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth() + 1;
            var dd = dateObj.getDate();
            return [yy, (mm > 9 ? '' : '0') + mm,
                (dd > 9 ? '' : '0') + dd
            ].join("/")
        }
    }

    return { add, getList, remove, update, displayTime }
})()