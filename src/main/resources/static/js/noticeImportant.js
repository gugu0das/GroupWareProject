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
$(document).on("click","#dele", function() {
    console.log("클릭");
    
    let id = $(this).attr("data-list-dele");
    Swal.fire({
        title: '정말로 삭제하시겠습니까?',
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
           location.href="./delete?id="+id; 
                       
        }
     });
    
    });




