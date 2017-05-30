//= require rails-ujs
//= require jquery
//= require ckeditor/init
$(document).ready(function(){
	$("#per_page_news").change(function(e){
		e.preventDefault();
		var value=$("#per_page_news option:selected").val();
		$.ajax({
			type:"post",
			url:"/admin/news",
			dataType:"script",
			data:{
				news:value
			},
			success:function(data){

			}
		})
	});
});
