
const pl = document.getElementsByClassName("page-link");
const searchForm=document.getElementById("searchForm");
const page=document.getElementById("page");

//for
//for of -- for(꺼내타입명 변수명 : 배열명 Collection)

//js 향상된 for문
for(let p of pl){
    p.addEventListener("click",function(e){
        console.log("클릭");
        let v=p.getAttribute("data-board-page");
        page.value=v;
        console.log(v);
        searchForm.submit();
        
    });
}

$(document).on("click",".s",function(){
	console.log($(this).parents(".d-flex").next().children("#ct").val());
	console.log($(this).attr("data-board-page"));
	let a = $(this).parents(".d-flex").next().children("#ct").val()
 $.ajax({
    type : "post",
    url : "./information",
    data :{
        categoryId : $(this).parents(".d-flex").next().children("#ct").val(),
        page : $(this).attr("data-board-page")
    },
    success :function(result){
       $("#id_"+a).html(result)
    },
    error:function(){
       console.log('error')
   }
 })
 
 
 
})