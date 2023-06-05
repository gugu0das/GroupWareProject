$(document).on("click",".tabar",function(){
    let catId=$(this).attr("id")
    console.log("들어는 왔다");
        $.ajax({
        type : "post",
        url : "./information",
        data :{
            categoryId : catId
        },
        success :function(result){
            $("#id_"+catId).html(result)
        },
        error:function(){
            console.log('error')
        }
    })
})

/*$(document).click(function(){
	console.log("왜?");
	console.log($("#dropdownMenuButton1").next().hasClass("show"));
	if(!$("#dropdownMenuButton1").next().hasClass("show")){
		$("#dropdownMenuButton1").next().removeClass("show");
	}
	$("#dropdownMenuButton1").click(function(){
	
	$(this).next().addClass("show");
	
})
})*/



