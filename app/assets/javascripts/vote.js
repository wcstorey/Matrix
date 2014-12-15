$(document).ready(function() {

    $(".upvote").on("click", function(event) {
        event.preventDefault();
        // $target = $(event.target)
        // console.log($target)
        // var post_id = $target.parent().attr('id')
        // console.log(post_id)

        // $.ajax({
        //     type: $target.attr("method"),
        //     url: $target.attr("action"),
        //     data: {post: post_id},
        //     dataType: 'json'
        // }).done(function(response) {
        //     console.log(response)
        //     console.log("HI")
        //     $('.votecount').html("TEST")
        // });
    });

    $(".downvote").on("click", function(event) {
        event.preventDefault();
    });

});