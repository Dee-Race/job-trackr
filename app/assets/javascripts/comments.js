$(document).ready(() => {
    loadComments();
});

function loadComments() {
    $("a.load_comments").on("click", function(event) {
       // Requesting HTML
       $.get(this.href).success(function(response) {
           $("div.comments").html(response)
       });

        event.preventDefault();
    });
};