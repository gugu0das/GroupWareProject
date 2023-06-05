
// DepartmentList
const nameKey = "name";
const childrenKey = "departmentVOs";
let treeHtml;
$.ajax({
    type: "GET",
    dataType: "json",
    url: "/department/tree",
    success: function (response) {
        treeHtml=generateTreeHTML(response);
        
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
      
      html += '<span><a href="/department/detail?id='+item.id+'">'+ item.name + '</a></span>';
  
      
      if (item.departmentVOs && item.departmentVOs.length > 0) {//child item이 있으면 재귀함수로 한번 더 실행.
        html += generateTreeHTML(item.departmentVOs);
      }
  
      html += '</li>';
    }
  
    html += '</ul>';
    return html;
  }


 