
// DepartmentList
const nameKey = "name";
const childrenKey = "departmentVOs";
let treeHtml;
$.ajax({
  type: "GET",
  dataType: "json",
  url: "/department/tree",
  success: function (response) {
    treeHtml = generateTreeHTML(response);

    $("#tree-container").html(treeHtml);
  }
  ,
  error: function () {
    console.log("error")
  }

})

//재귀함수
function generateTreeHTML(data) {
  let html = '<ul class="tree">';
  //<ul><li></li><ul> li 태그안에 반복
  for (const item of data) {
    html += '<li>';

    html += '<span><a href="/department/detail?id=' + item.id + '">' + item.name + '</a></span>';


    if (item.departmentVOs && item.departmentVOs.length > 0) {//child item이 있으면 재귀함수로 한번 더 실행.
      html += generateTreeHTML(item.departmentVOs);
    }

    html += '</li>';
  }

  html += '</ul>';
  return html;
}


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