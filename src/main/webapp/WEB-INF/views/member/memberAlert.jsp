<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
 <c:import url="../temp/style.jsp"></c:import>
</head>
<body>
<c:import url="../temp/common_js.jsp"></c:import>
<script type="text/javascript">
if(${result} > 0){
	 Swal.fire({
	      icon: 'success',
	      title: '${commonVO.msg}',
	      text: '${commonVO.textMsg}',
	      showClass: {
	    	    popup: 'animate__animated animate__fadeInDown'
	    	  },
	    	  hideClass: {
	    	    popup: 'animate__animated animate__fadeOutUp'
	    	  }
	    }).then(result => {
	    	 if (result.isConfirmed) {
	    		 location.href="${commonVO.url}";
	    	 }
	    });
}else{
	 Swal.fire({
	      icon: 'error',
	      title: '${commonVO.msg}',
	      text: '${commonVO.textMsg}',
	      showClass: {
	    	    popup: 'animate__animated animate__fadeInDown'
	    	  },
	    	  hideClass: {
	    	    popup: 'animate__animated animate__fadeOutUp'
	    	  }
	    }).then(result => {
	    	 if (result.isConfirmed) {
	    		 location.href="${commonVO.url}";
	    	 }
	    });
}

	
</script>




</body>
</html>