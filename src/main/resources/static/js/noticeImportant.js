$(".submitButton").on("click", function(){

    if($("#important").prop("checked")) {
        $("#important").val(1);
    } else {
        $("#important").val(0);
    }
})

// $(document).ready(function() {
//     $(".check-item").each(function() {
//         if($(this).attr('data-num-important') == '1') {
//             let $row = $(this).closest('tr').addClass("trfirst");
//             $row.insertBefore($row.parent().find('tr:first').addClass("trfirst"));
//             $row.find('.title').addClass("checkcolor");
//             $(this).css("background-color", "yellow");
//          }
//      });
//  });


$(document).ready(function(){

    $.ajax({
        url: "/notice/importantList",
        type: "GET",
        data : {
            important : 1
        },
        success: function(result) {
            $(".importantList").prepend(result);
        }
    })

})

