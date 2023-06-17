$('.essbox').on('click', '#submitbtn', function () {
    let nullCheck = false;


    $(".essential").each(function (index, essential) {
        $(essential).removeClass("form-control-red")
        $(essential).attr("placeholder", '필수로 입력해야 합니다.')

        if ($(essential).val().length == 0) {
            $(essential).addClass("form-control-red")
            if ($(essential).prop('type') == "text") {
                swal('공란이있습니다', '입력란을 다시 확인해주세요', 'error');
                nullCheck = true;
            }
            else if ($(essential).prop('type') == "file") {
                swal('파일업로드 오류', '추가한 파일을 다시 확인해주세요', 'error');
                nullCheck = true;
            }
            else {
                swal('등록오류', '다시 확인해주세요', 'error');
                nullCheck = true;
            }

            if (nullCheck == true) {
                return false;
            }
        }
    })
    if (nullCheck != true) {
        $("#frm").submit();

    }

})