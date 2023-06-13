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
if(${result} == 1){
	 Swal.fire({
	      icon: 'success',
	      title: '${msg}',
	      text: '버튼을 누르면 돌아갑니다',
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
}else{
	 Swal.fire({
	      icon: 'error',
	      title: '${msg}',
	      text: '버튼을 누르면 돌아갑니다',
	      showClass: {
	    	    popup: 'animate__animated animate__fadeInDown'
	    	  },
	    	  hideClass: {
	    	    popup: 'animate__animated animate__fadeOutUp'
	    	  }
	    });
}

	
</script>




</body>
</html>