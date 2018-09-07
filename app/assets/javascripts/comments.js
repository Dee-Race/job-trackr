// Submitting Comments via AJAX

$(function() {
    $("#new_comment").on("submit", function(event) {
        const data = $(this).serialize();  // serialize method creates a text string in standard URL encoded notation
        $.ajax({
            type: "POST",
            url: this.action,
            data: data,                         // form data
            success: function(response) {
                $("#comment_content").val("");  // empty out text area 
                let $ol = $("div.comments ol")
                $ol.append(response);
            }
        })
        event.preventDefault();
    })
})

