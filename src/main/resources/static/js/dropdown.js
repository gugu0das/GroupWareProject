/**
 * 
 */

 $(document).ready(function(){

  $(".nav .dropdown").focusin( function (){
     $(this).find(".dropdown-menu").each(function(){
       $(this).css({"display":'block','opacity':'1','top':'60px'}); 
     });
  });
  
    $(".nav .dropdown").focusout( function (){
     $(this).find(".dropdown-menu").each(function(){
       $(this).css({"display":'block','opacity':'0','top':'0px'}); 
     });
  });
  
  
//   $(".navbar-brand").click( function (){ 
//    alert("js working"); 
//   });
  
});