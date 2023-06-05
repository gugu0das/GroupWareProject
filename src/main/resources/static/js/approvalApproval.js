$(".btn").click(function(){
    console.log($(this).val())
    let a = $(this).val()
    if($(this).val() ==1){
        $("input").each(function(idx,index){
            if($(index).attr("type") =="hidden"){
                console.log($(index).parent());
                $(index).parent().html('<img alt="" src="/file/approval/승인.JPG">');
                $("#approval").val(a);
                return false;
            }
            
        })
    }else{
        $("input").each(function(idx,index){
        if($(index).attr("type") =="hidden"){
            console.log($(index).parent());
            $(index).parent().html('<img alt="" src="/file/approval/거절.JFIF">');
            $("#approval").val(a);
            return false;
        }
    })
    }
    $("#ddd").val($("#dd").html());
    console.log( "능력",$("#dd").html());
    console.log($("#ddd").val());
    console.log($("#approval").val());
    $("#fm").submit();
})
