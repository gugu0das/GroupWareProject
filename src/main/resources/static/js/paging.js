
const pl = document.getElementsByClassName("page-link");
const searchForm=document.getElementById("searchForm");
const page=document.getElementById("page");

//for
//for of -- for(꺼내타입명 변수명 : 배열명 Collection)

//js 향상된 for문
for(let p of pl){
    p.addEventListener("click",function(e){
        
        let v=p.getAttribute("data-board-page");
        page.value=v;
        console.log(v);
        searchForm.submit();
        
    });
}