

// 부서 Level Select
$("#level").on("change", function () {
    $("#defaultSelect").prop("selected", true)

    $("#defaultSelect").attr("disabled", true)
    $(".level").each(function (index, data) {

        $(data).attr("hidden", true);
        $(data).attr("disabled", true);

    })
    if ($("#level").val() * 1 > 0) {
        let uppderLevel = $("#level").val() * 1 - 1;

        $(".level" + uppderLevel).each(function (index, v) {

            $(v).removeAttr("hidden")
            $(v).removeAttr("disabled")

        })
    }
})
