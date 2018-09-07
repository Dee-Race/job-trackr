// Submitting Comments via AJAX

// Retrieve content from a server and display it without having to refresh the page

// If this is referenced directly inside a method, it equals the object that received the method call
// Otherwise, this is global

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

