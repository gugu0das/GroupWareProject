$(".jobVO").on("click", function () {
    let jobId = $(this).attr("data-job-id");
    let jobName = $(this).attr("data-job-name");
  
    Swal.fire({
      icon: 'warning',
      title: jobName + '을 삭제하시겠습니까?',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '예',
      cancelButtonText: '아니오'
    }).then(result => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "/member/jobDelete",
          data: {
            id: jobId
          },
          success: function (response) {
            if(response>0){
  
              Swal.fire({
                icon: 'success',
                title: '삭제되었습니다.',
    
    
              }).then(result => {
                location.reload();
              });
            }
            else{
              Swal.fire({
                icon: 'Error',
                title: '오류가 발생하였습니다.',
                Text:' 다시 시도해주세요.'
    
              }).then(result => {
              });
            }
          }
          ,
          error: function () {
            console.log("error")
          }
  
        })
      }
    });
  })