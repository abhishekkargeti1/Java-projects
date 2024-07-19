function doLike(postId, userId) {
//    console.log(postId, "", userId);
    const data = {
        user_id: userId,
        post_id: postId,
        operation: "like"
    };
    $.ajax({
        url:"LikeandDislike",
        data:data,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            const newArr = data.split("/");

            if(data.trim()==="true"){
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);  
        }
    });
}
