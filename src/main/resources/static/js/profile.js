let click=false;
$("#updatebtn").click(function(){
    $(".change").each(function(index,data){

        $(data).prop("readonly",false)
        $(data).removeClass("change")
    })
    $("#updatebtn").text("수정완료")
    if(!click){
        click=true;
    }
    else{
        $("#updateForm").submit();
    }
    
})




$("#pwChange").on("click",function(){
    let password =$("#password").val();
    let passwordCheck = $("#passwordCheck").val();
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/member/beforePwCheck",
        data: {
            password: password,
            passwordCheck: passwordCheck

        },
        success: function (response) {
            Swal.fire({
                title: 'PW 검증',
                html: '중복 검사중입니다.',
                timer: 800,
                timerProgressBar: false,
                didOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                    if (response) {
                        Swal.fire({
                            icon: 'error',
                            title: '비밀번호가 맞지않습니다.',
                            text: '다시 확인해주세요',

                        }).then(result => {
                            $("#passwordCheck").removeClass("success")
                            $("#passwordCheck").addClass("fail")
                        });
                    }
                    else {
                        Swal.fire({
                            icon: 'success',
                            title: '정말 비밀번호를 바꾸시겠습니까?',
                            text: '로그아웃 됩니다.',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: '예',
                            cancelButtonText: '아니오'
                        }).then(result => {
                            $("#passwordCheck").removeClass("fail")
                            $("#passwordCheck").addClass("success")
                            if (result.isConfirmed) {
                                $("#frm").submit();    
                               
                            }
                        });
                    }

                },


            }).then((result) => {
            })
        },
        error: function () {
            console.log("error")

        }

    })
})