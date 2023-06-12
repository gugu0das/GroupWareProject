$(".submitButton").on("click", function(){

    if($("#important").prop("checked")) {
        $("#important").val(1);
    } else {
        $("#important").val(0);
    }
})

// $(document).ready(function() {
//     $(".check-item").each(function() {
//         if($(this).attr('data-num-important') == '1') {
//             let $row = $(this).closest('tr').addClass("trfirst");
//             $row.insertBefore($row.parent().find('tr:first').addClass("trfirst"));
//             $row.find('.title').addClass("checkcolor");
//             $(this).css("background-color", "yellow");
//          }
//      });
//  });


$(document).ready(function(){

    $.ajax({
        url: "/notice/importantList",
        type: "GET",
        data : {
            important : 1
        },
        success: function(result) {
            $(".importantList").prepend(result);
        }
    })

})

// $("#delete").click(function() {
//     Swal.fire(
//         '삭제할께요?',
//         '진짜로',
//         '네?'
//       )
// })
/*if(!confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
     	
 }else{*/
$("#delete").click(function() {
	
    Swal.fire({
      title: '삭제할께요?',
      text: '진짜로',
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: '네',
      cancelButtonText: '아니오',
      timer: 50000, // 3초 후에 자동으로 닫힘
      timerProgressBar: true, // 타이머 진행 바 표시
      allowOutsideClick: false // 경고창 외부 클릭으로 닫히지 않도록 설정
      
    }).then((result) => {
      // 확인 버튼을 누른 경우에 대한 처리 코드
      if (result.isConfirmed) {
        // 삭제 동작을 수행하는 코드
      }
    });
  
  });
  




  $("#update").click(function() {
    Swal.fire({
        title: '수정하러 갈께요',
        showClass: {
          popup: 'animate__animated animate__fadeInDown'
        },
        hideClass: {
          popup: 'animate__animated animate__fadeOutUp'
        }
      })
})