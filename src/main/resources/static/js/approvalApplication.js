



$(document).on("click","#btn",function(){
    let a =true;
    if($('input:radio').lengh){
	
	if($('input[name=contents]')){
		if($('input[name=contents]'),val() ==""){
			alert("결재 상세 내용은 필수입니다.");
		}
	}
	
    if(!$('input:radio[name=annualType]').is(':checked')){
       
            alert("종류는 필수 사항입니다");
            a=false;
            return false;
        
        
    }
    $("input").each(function(idx,index){
        if($(index).attr("type") != "hidden" && $(index).attr("name") !="contents"){
            
            
        
         if($(index).attr("name")=="useDate" && $(index).val()==""){
            
            alert("날짜는 필수 사항입니다");
            a=false;
            return false;
            
        }
        else if( $(index).attr("name") =="count" && $(index).val()==""){
            console.log($(index).val().type);
            alert("일수는 필수 사항입니다");
        a=false;
        return false;
            
        
    }else if( $(index).attr("name") =="reason" && isNaN($(index).val()*1)){
        console.log(isNaN($(index).val()*1));
        alert("일수는 필수 사항입니다");
    a=false;
    return false;
        
    
}
}

    })
    }

if(a){
    $("input").each(function(idx,index){
        console.log("아 :",$(index).attr("name"))
        console.log($(index).val());
        console.log("index 위치",$(index).parent());
        if($(index).attr("type") != "hidden" && $(index).attr("name") !="contents"){

            if($(index).attr("type") == "radio"){
                
                $(index).attr('onclick', "return(false);");
                //radio check 여부
                if($(index).is(':checked')){
					$(this).attr("style","accent-color: black;");
                    console.log("radio 선택",$(index).val());
                    // $("#type").val($(index).val());
                    $(index).attr("checked","checked")
                   
                }
            }else{
                if($(index).attr("name") =="count"){
                    console.log("zz :",$(index).val());
                    console.log("아씨 :",$(index).parent().text())
                    
                     $("#vacation").val($(index).val());
                    
                    $(index).parent().text($(index).val()+$(index).parent().text());
                    return
                }else if($(index).attr("name")=="useDate"){
                    
                    $(index).parent().text($(index).val())
                     $("#useDate").val($(index).val());
                    console.log($("#useDate").val());
                    console.log("아씨 :",$(index).parent().text())
                    
                }else if($(index).attr("name")=="reason"){
                     $("#reason").val($(index).val());
                    console.log("콘솔",$("#reason").val());
                }
                $(index).parent().text($(index).val());
            }
        }
    })
    if ($('textarea').length) {
        $('textarea').each(function(idx,index){
            $(index).parent().text($(index).val());
        })
    }
    console.log("==============================================휴가 일수 :",$("#vacation").val());
    console.log($("#ttt").html());
    console.log($("#reason").val());
    console.log($("#useDate").val());
    console.log($("#type").val());
    $("#ddd").val($("#ttt").html());
    $("#fr").submit();
    console.log($("#type").val());
}else{
    return false;
}
    
})

