<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <c:import url="../temp/style.jsp"></c:import>


</head>
<body>
<c:import url="../temp/common_js.jsp"></c:import>
<script type="text/javascript">
/* let userId = ${name} */



</script>
<script type="text/javascript">
console.log(${result})
if(${result} >0){
	 Swal.fire({
	      icon: 'success',
	      title: '${msg}',
	      text: '버튼을 누르면 다음 페이지로 이동합니다.',
	      showClass: {
	    	    popup: 'animate__animated animate__fadeInDown'
	    	  },
	    	  hideClass: {
	    	    popup: 'animate__animated animate__fadeOutUp'
	    	  }
	    }).then(result => {
	    	 if (result.isConfirmed) {
	    		 if(${name} !=null){
	    		 let userId = ${name}
	    		 $.ajax({
	    		 	type:"GET",
	    		 	url:"/trigger-event",
	    		 	data:{
	    		 		userId : userId,
	    		 		
	    		 	},
	    		 	success : function(data){	
	    		 		console.log(data);
	    		 		location.href="${url}";
	    		 	},error : function(data){	
	    		 		location.href="${url}";
	    		 	}
	    		 })
	    		 }else{
	    			 location.href="${url}";
	    		 }
	    		 
	    		 
	    		 /* let userId = 1; */
	    		
	    	 }
	    });
}else{
	 Swal.fire({
	      icon: 'error',
	      title: '${msg}',
	      text: '버튼을 누르면 돌아갑니다.',
	      showClass: {
	    	    popup: 'animate__animated animate__fadeInDown'
	    	  },
	    	  hideClass: {
	    	    popup: 'animate__animated animate__fadeOutUp'
	    	  }
	    }).then(result => {
	    	 if (result.isConfirmed) {
	    		 location.href="${url}";
	    	 }
	    });
}


	
</script>




</body>
</html>