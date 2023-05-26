/**
 * 
 */
const replyAdd = document.getElementById("replyAdd");
const replyContents = document.getElementById("replyContents");
const commentListResult = document.getElementById("commentListResult")


replyAdd.addEventListener("click", function(){


	console.log(replyAdd.getAttribute('data-qna-qnaId'));
	
    let xhttp = new XMLHttpRequest();

    xhttp.open("POST", "../qnaComment/add");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send("contents="+replyContents.value+"&qnaId="+replyAdd.getAttribute('data-qna-qnaId'));

    xhttp.addEventListener('readystatechange', function(){
        if(this.readyState==4&&this.status==200){
            if(this.responseText.trim()==1){
            	alert('댓글이 등록 되었습니다')
            	replyContents.value="";
                 getList();
        	}else {
            	alert('댓글 등록에 실패 했습니다')
       		}
        }
    })

})



getList();

function getList(){
    let xhttp = new XMLHttpRequest();

    xhttp.open("GET", "/qnaComment/list?qnaId="+replyAdd.getAttribute('data-qna-qnaId'));

    xhttp.send();

    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState==4&&this.status==200){
           commentListResult.innerHTML=this.responseText.trim();
        }
    })
}

/*$("#commentListResult").on("click", ".del", () => {
    let id = $(".del").attr("data-qna-qna");

    $.ajax({
        url: "/qnaComment/delete",
        type: "POST",
         data: {
             id: id
         },
         success: function() {
             alert('댓글이 삭제 되었습니다');
             getList();
        },
        error: function() {
           alert('삭제가 실패했습니다');
         }
     });
 });*/

//  $("#replyAdd").on("click", function(){
//     let contents = $("#replyContents").val();
//     let commentNum = $("#replyAdd").attr("data-qna-num");

//     $.ajax({
//         url: "/qnaComment/qnaCommentAdd",
//         type: "POST",
//         data: {
//             contents: contents,
//             commentNum: commentNum
//         },
//         success: function(res) {
//             if(res.trim() > 0) {
//                 alert('댓글이 등록 되었습니다');
//                 $("#replyContents").val('');
//                 getList(1);
//             } else {
//                 alert('댓글 등록이 실패했습니다');
//             }
//         },
//         error: function() {
//             alert('댓글 등록이 실패했습니 s다');
//         }
//     });
// });

/* getList(1);

 function getList(page){
     $.ajax({
         url: "/qnaComment/list",
         type: "GET",
         data: {
             qnaId:replyAdd.getAttribute('data-qna-qnaId'),
             page: page
         },
         success: function(res) {
             console.log("리스트 성공");
             $("#commentListResult").html(res.trim());
        },
         error: function() {
             alert('댓글 목록을 가져오는데 실패했습니다');
        }
     });
 }*/

// $("#commentListResult").on("click", ".page-link", function() {
//     let page = $(this).attr("data-board-page");
//     getList(page);
// });

// $("#commentListResult").on("click", ".del", () => {
//     let commentNum = $(".del").attr("data-comment-num");

//     $.ajax({
//         url: "/qnaComment/qnaCommentDelete",
//         type: "POST",
//         data: {
//             commentNum: commentNum
//         },
//         success: function() {
//             alert('댓글이 삭제 되었습니다');
//             getList(1);
//         },
//         error: function() {
//             alert('삭제가 실패했습니다');
//         }
//     });
// });

// $("#commentListResult").on("click", ".update", function(e){
//     let commentNum = $(this).attr("data-comment-num");

//     $("#contents").val($("#contents"+commentNum).text());

//     $("#contentsConfirm").attr("data-comment-num", commentNum);

//     e.preventDefault();
// });

// $("#contentsConfirm").click(function(){
//     let commentNum = $(this).attr("data-comment-num");
//     let contents = $("#contents").val();

//     $.ajax({
//         url: "/qnaComment/qnaCommentUpdate",
//         type: "POST",
//         data: {
//             commentNum: commentNum,
//             contents: contents
//         },
//         success: function() {
//             alert('댓글이 수정 되었습니다');
//             $("#closeModal").click();
//             getList(1);
//         },
//         error: function() {
//             alert('댓글 수정을 실패했습니다');
//         }
//     });
// });