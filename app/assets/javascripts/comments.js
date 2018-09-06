// Submitting Comments via AJAX

$(function() {
    $("#new_comment").on("submit", function(event) {
        
        const data = $(this).serialize();  // serialize method creates a text string in standard URL encoded notation
        $.ajax({
            type: "POST",
            url: this.action,
            data: data,
            dataType: "json",
            success: function(response) {
                $("#comment_content").val("");
                let newComment = new Comment(response.id, response.application_id, response.content);
                let $ol = $("div.comments ol")
                $ol.append(newComment);
            }
        })
        event.preventDefault();
    })
})

function Comment(id, applicationId, content) {
    this.id = id;
    this.application_id = applicationId;
    this.content = content;
}
