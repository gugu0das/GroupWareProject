
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
        // document.getElementById('tree-container').innerHTML = treeHtml;
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
  
    for (const item of data) {
      html += '<li>';
  
      // Display the name or key of the current node
      html += '<span><a href="/department/detail?id='+item.id+'">'+ item.name + '</a></span>';
  
      // Check if the current node has children
      if (item.departmentVOs && item.departmentVOs.length > 0) {//child item이 있으면 재귀함수로 한번 더 실행.
        html += generateTreeHTML(item.departmentVOs);
      }
  
      html += '</li>';
    }
  
    html += '</ul>';
    return html;
  }


 