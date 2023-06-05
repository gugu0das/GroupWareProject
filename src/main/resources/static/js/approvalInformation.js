/*$(document).on("click",".dropbtn",function(){
    let catId=$(this).attr("data-catId")
        $.ajax({
        type : "get",
        url : "./information",
        data :{
            categoryId : catId
        },
        success :function(result){
            $("#allList").html(result)
        },
        error:function(){
            console.log('error')
        }
    })
})*/