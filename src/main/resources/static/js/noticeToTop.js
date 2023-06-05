

let xhttp = new XMLHttpRequest();

xhttp.open('POST', '/notice/moveToTop');

xhttp.send();
    
xhttp.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        console.log(this.responseText);
        document.getElementById("noticeList").innerHTML=this.responseText.trim();
    }

});