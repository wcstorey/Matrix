$(document).ready(function() {

    $(".upvote").on("click", function(event) {
        event.preventDefault();
        // $target = $(event.target)
        // console.log($target)
        // var post_id = $target.parent().attr('id')
        // console.log(post_id)

        // $.ajax({
        //     type: "POST",
        //     url: '/votes',
        //     data: {post: post_id},
        //     // dataType: 'json'
        // }).done(function(response) {
        //     $('.votecount').text()
        // });
    });
});