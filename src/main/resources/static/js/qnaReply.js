/**
 * 
 */
const replyAdd = document.getElementById("replyAdd");
const replyContents = document.getElementById("replyContents");
const commentListResult = document.getElementById("commentListResult")
const contentsConfirm = document.getElementById("contentsConfirm")


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

$("#commentListResult").on("click", ".del", function(e) {
    let id = $(this).attr("data-qna-qna");

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
});
$(document).on("click", ".clear",function() {
    // 수정 완료 버튼 클릭 시 동작
    let id = $(this).attr("data-comment-num");
    let contents = $(this).prev().prev().prev().children("span").children("textarea").val();
    console.log(contents)
   
    console.log($(this).prev().prev().prev().children("span").children("textarea").val());
    console.log("수정 완료 동작");
    $.ajax({
        url: "/qnaComment/update",
        type: "POST",
        data: {
            id: id,
            contents: contents
        },
        success: function(data) {
           
            if(data == 1){
            alert('댓글이 수정되었습니다.');
            $("#closeModal").click();
            getList();
        }else{
            alert('댓글 수정을 실패했습니다.');
        }
        },
        error: function() {
            alert('관리자 문의 필요.');
        }
    });
});


$(document).on("click", ".edit", function(e) {
    
    $(this).addClass("clear");

$(this).removeClass("edit");

    // 수정 가능한 상태로 변경
   console.log($(this).prev().prev().prev().children("span").text());
    
    $(this).prev().prev().prev().children("span").html('<textarea>'+$(this).prev().prev().prev().children("span").text()+'</textarea>');
    // 버튼 텍스트 변경

    console.log($(this).prev().prev().prev().children("span").children("textarea").text());
    

    $(this).text("수정 완료");
    
    // 수정 완료 버튼 클릭 이벤트 핸들러 등록
   
});

// $(document).on("click", ".edit", function() {
//     let commentId = $(this).attr("data-comment-num");
//     let textarea = $("#contentsConfirm" + commentId);
    
//     // 수정 가능한 상태로 변경
//     textarea.prop("readonly", false);
    
//     // 버튼 텍스트 변경
//     $(this).text("수정 완료");
    
//     // 수정 완료 버튼 클릭 이벤트 핸들러 등록
//     $(this).off("click").on("click", function() {
//         let commentId = $(this).attr("data-comment-num");
//         let textarea = $("#contentsConfirm" + commentId);
//         let commentContent = textarea.val();
        
//         // 수정 완료 버튼 클릭 시 동작
//         $.ajax({
//             url: "/qnaComment/update",
//             type: "POST",
//             data: {
//                 id: id,
//                 contents: contents
//             },
//             success: function(response) {
//                 // 댓글 수정 성공 시 처리
//                 textarea.prop("readonly", true);
//                 $(".edit[data-comment-num='" + commentId + "']").text("수정");
//             },
//             error: function() {
//                 // 댓글 수정 실패 시 처리
//                 alert("댓글 수정을 실패했습니다.");
//             }
//         });
//     });
// });

// $("#contentsConfirm").click(function(){
//     let id = $(this).attr("data-comment-num");
//     let contents = $("#contents").val();

//     $.ajax({
//         url: "/qnaComment/update",
//         type: "POST",
//         data: {
//             id: id,
//             contents: contents
//         },
//         success: function() {
//             alert('댓글이 수정 되었습니다');
//             $("#closeModal").click();
//             getList();
//         },
//         error: function() {
//             alert('댓글 수정을 실패했습니다');
//         }
//     });
// });
// 수정 버튼 클릭 시 이벤트 처리

//  $("#contentsConfirm").click(function(){
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

$("#updatebtn").click(function(){
    $(".change").each(function(index,data){

        $(data).prop("readonly",false)
        $(data).removeClass("change")
    })
    $("#updatebtn").text("수정완료")
    if(!click){
        click=true;
    }
    else{
        $("#updateForm").submit();
    }
    
})

