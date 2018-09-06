// Submitting Comments via AJAX

$(function() {
    $("#new_comment").on("submit", function(event) {
        
        const data = $(this).serialize();
        $.ajax({
            type: "POST",
            url: this.action,
            data: data,
            dataType: "json",
            success: function(response) {
                $("#comment_content").val("");
                let $ol = $("div.commentsList ol")
                $ol.append(response);
            }
        })
        event.preventDefault();
    })
})
