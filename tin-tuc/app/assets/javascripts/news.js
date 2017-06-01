$(document).on("turbolinks:load",function(){
	$("#search_key").keydown(function(){
		var value=$(this).val();
		$.ajax({
			url:"/admin/news/search",
			type:"post",
			dataType:"script",
			data:{
				key:value
			},
			success:function(){

			}
		})
	});
});
$(document).on("turbolinks:load",function(){
	$("#search_news").click(function(){
		var value=$("#search_key").val();
		$.ajax({
			url:"/admin/news/search",
			type:"post",
			dataType:"script",
			data:{
				key:value
			},
			success:function(){

			}
		})
	});
});