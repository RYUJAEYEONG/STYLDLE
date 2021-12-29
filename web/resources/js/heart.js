var heartService = (function () {
    function save(heart, callback, error){
        $.ajax({
            type: 'post',
            url: '/heart/save',
            data: JSON.stringify(heart),
            contentType:"application/json; charset=utf-8",
            success: function(result, status,xhr) {
                if(callback) callback(result)
            },
            error: function(xhr,status,er){
                if(error) error(er)
            }
        })
    }

    function get(heart, callback, error) {
        var postId = heart.postId;
        var userId = heart.userId;
        $.getJSON("/heart/isClicked/" + postId + "/" + userId + ".json",
            (result) => {
                if (callback) callback(result)
            }
        ).fail(function(xhr,status,err){
            if (error) error()
        })
    }

    function remove(heart, callback, error) {
        var postId = heart.postId;
        var userId = heart.userId
        $.ajax({
            type: 'delete',
            url: '/heart/' + postId + "/" + userId,
            success: (result, status, xhr) => {
                if(callback) callback(result)
            },
            error: (xhr,status,er) => {
                if(error) error(er);
            }
        })
    }

    function getCount(postId, callback, error) {
        $.getJSON("/heart/cnt", {postId: postId}, function (result) {
            if (callback) callback(result)
        }).fail(function(xhr,status,err){
            if (error) error()
        })
    }

    return { save, get, remove, getCount }
})()