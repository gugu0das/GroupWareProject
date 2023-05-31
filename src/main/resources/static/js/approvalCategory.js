// html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	$(".upperCategory>span").click(function(){
		console.log("??");
		let submenu = $(this).next(".hide");
		// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
		if(submenu.is(":visible") ){
			submenu.slideUp();
		}else{
			submenu.slideDown();
		}
	});
});

function deleteTag(){
   $(".upperCategory").each(function(i,v){
      if($(v).children('ul').children().length > 0){
         $(v).children('span').text($(v).children('span').children('a').text());
         $(v).children('span>a').remove();
      }
   })
}
deleteTag();