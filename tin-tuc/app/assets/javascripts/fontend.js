//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery-ui
$(document).ready(function(){
    $("div#load-more").click(function(e){
    	e.preventDefault();
    	$(this).hide();
    	$(".loading-gif").show();
    	var last_id = $('.record').last().attr('data-id');
    	alert(last_id);
    	  $.ajax({
            // make a get request to the server
            type: "get",
            // get the url from the href attribute of our link
            url: "/loadnew",
            // send the last id to our rails app
            data: {
                id:5
            },
            // the response will be a script
            dataType: "html",
            // upon success 
            success: function (data) {
                // hide the loading gif
                $('.loading-gif').hide();
                // show our load more link
                $('#load-more').show();
                console.log(data);
                $("#news").append(data);
            }
        });
    });
    
});