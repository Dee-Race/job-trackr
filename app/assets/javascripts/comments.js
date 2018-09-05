// Submitting Comments via AJAX

$(function() {
    $("#new_comment").on("submit", function(event) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: function(response) {
                $("#comment_content").val("");
                let $ol = $("div.comments ol")
                $ol.append(response);
            }
        })
    })
})
