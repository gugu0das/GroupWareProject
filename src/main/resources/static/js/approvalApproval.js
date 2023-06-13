

$(document).on("click",".btn1",function(){
    console.log($(this).val())
    let a = $(this).val()
    if($(this).val() ==1){
        $("input").each(function(idx,index){
            if($(index).attr("type") =="hidden"){
                console.log($(index).parent());
                $(index).parent().html('<img alt="" src="/file/approval/승인.JPG" style="width:100px; height:100px;">');
                $("#approval").val(a);
                return false;
            }
            
        })
    }else{
        $("input").each(function(idx,index){
        if($(index).attr("type") =="hidden"){
            console.log($(index).parent());
            $(index).parent().html('<img alt="" src="/file/approval/거절.JFIF" style="width:100px; height:100px;">');
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
    
    let a = $("body").html($("dd").html());//length> 
    console.log(document.body); // <body></body>
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

$(document).on("click","#del",function(){
	Swal.fire({
   title: '정말로 결재를 취소하시겠습니까?',
   text: '한번 삭제되면 다시 되돌릴 수 없습니다.',
   icon: 'warning',
   
   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
   
   reverseButtons: true, // 버튼 순서 거꾸로
   
}).then(result => {
   // 만약 Promise리턴을 받으면,
   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
   $("#fm").attr("action","./delete")
	$("#fm").submit();
   }
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