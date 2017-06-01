$(document).on("turbolinks:load",function(){
	return success_ajax()
})
function success_ajax(){
	$(".role").on("click",function(e){
		e.preventDefault();
		$("#role-user").hide();
		$("#role-area").show();
	});
	$("#role-area").mouseleave(function(e){
		e.preventDefault();
		var value=$("#role-area textarea").val();
		var id=$(this).attr("data-id");
		$("#role-user").show();
		$(this).hide();
		$.ajax({
			url:"/admin/user/update",
			data:{
				role:value,
				id:id
			},
			dataType:"script",
			type:"post",
			success:function(){
					success_ajax()
			}
		});
	});
}
