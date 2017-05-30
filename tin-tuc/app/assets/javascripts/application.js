// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require ckeditor/init
//= require jquery
// $(document).ready(function(){
//     $("div#load-more").click(function(e){
//     	e.preventDefault();
//     	$(this).hide();
//     	$(".loading-gif").show();
//     	var last_id = $('.record').first().attr('data-id');
//     	// alert(last_id)
//     });
//       $.ajax({

//             // make a get request to the server
//             type: "GET",
//             // get the url from the href attribute of our link
//             url: $(this).attr('href'),
//             // send the last id to our rails app
//             data: {
//                 id: last_id
//             },
//             // the response will be a script
//             dataType: "script",
//             // upon success 
//             success: function () {
//                 // hide the loading gif
//                 $('.loading-gif').hide();
//                 // show our load more link
//                 $('.load-more').show();
//             }
//         });
// });