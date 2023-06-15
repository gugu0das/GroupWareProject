// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
	  lengthChange: false,
		  ordering: false,
		  info: false,
		  paging: false,
		  scrollX: false
	  
  });
});
