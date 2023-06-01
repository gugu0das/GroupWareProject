

$(document).on("click","btn1",function(){
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

const pdf =document.getElementById("dd");

$(document).on('click','#pdf',function(){
    
    let a = $("body").html($("dd").html());
    //console.log(document.body.remove());
    console.log(a);
    html2canvas(pdf).then(function(canvas) {

        let imgData = canvas.toDataURL('image/png');
        let imgWidth = 210;
        let pageHeight = 290;
        let imgHeight = canvas.height * imgWidth / canvas.width;
  
        let doc = new jsPDF({
            'orientation': 'p',
            'unit': 'mm',
            'format': 'a4'
        });
  
        doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
        doc.save('result.pdf');
    });

    
})



// $(document).on('click','#pdf',function(){
//     let a = $("body").html();
    
//     console.log("클릭");
//     console.log($("#dd").html());
//     $("body").html($("#dd").html());
//     console.log($(document));


//     let doc = new jsPDF('p','pt','a4');
//     doc.addHTML(document.body,function() {
	    
//         doc.save('html1.pdf');
//         $("body").html(a);
// 	});
    
    

	
//     // $(location).attr('href', './check?id='+$(this).attr("data-id"));

//     // $.ajax({
//     //     type : "post",
//     //     url : "./pdf",
//     //     data :{
//     //         ddd : $('#dd').html()
//     //     },
//     //     success :function(result){
//     //         if(result){
//     //              console.log('사용가능')
//     //         }else{
//     //             console.log('사용불가')
//     //         }
//     //     },
//     //     error:function(){
//     //         console.log('error')
//     //     }
//     // })
// })