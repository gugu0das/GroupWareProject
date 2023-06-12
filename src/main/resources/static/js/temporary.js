$('#date1').change(function(){
	console.log($(this).val());
	let now = new Date();	// 현재 날짜 및 시간
	console.log("현재 : ", now);
	let tomorrow = new Date(now.setDate(now.getDate() + 1));	// 내일
	console.log("내일 : ", tomorrow);
	tomorrow = dateAdd(tomorrow, 1);
	console.log(tomorrow);
		
})

function dateAdd(date, addDays) {

     var datetmp = date.replace(/-/g,'');			// - 는 모두 제거
     
     var y = parseInt(datetmp.substr(0, 4));
     var m = parseInt(datetmp.substr(4, 2));
     var d = parseInt(datetmp.substr(6,2));
  
     d = new Date(yy, mm - 1, dd + addDays);
  
     y = d.getFullYear();
     m = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
     d = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
  
     return '' + y + '-' +  m  + '-' + d;		
	 }