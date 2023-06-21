let click=false;
let accountId = $("#accountId").val();
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
    $(document).on('click', '#updatebtn', function () {
    let nullCheck = false;


    $(".essential").each(function (index, essential) {
        $(essential).removeClass("form-red")
        $(essential).attr("placeholder", '필수로 입력해야 합니다.')

        if ($(essential).val().length == 0) {
            $(essential).addClass("form-red")
            if ($(essential).prop('type') == "text") {
                swal.fire('공란이있습니다', '입력란을 다시 확인해주세요', 'error');
                nullCheck = true;
            }
            else if ($(essential).prop('type') == "file") {
                swal.fire('파일업로드 오류', '추가한 파일을 다시 확인해주세요', 'error');
                nullCheck = true;
            }
            else {
                swal.fire('등록오류', '다시 확인해주세요', 'error');
                nullCheck = true;
            }

            if (nullCheck == true) {
                return false;
            }
        }
        if(!$("#accountId").hasClass("success")){
            swal.fire('중복검사 오류', '아이디 중복검사를 확인해주세요', 'error');
            nullCheck = true;
        }
    })
    if (nullCheck != true) {
        $("#updateForm").submit();

    }

})
    }
    
})


$("#test1").on("click",function(){
    $.ajax({
        type:"GET",
        url:"/member/testData",
        success:function(response){
            console.log("확인")
        },
        error: function () {
            console.log("error")

        }
    })
})
$("#idCheck").on("click", async function () {
    let id = $("#accountId").val()
    

    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/member/idDuplicateCheckAccount",
        data: {
            
            accountId: id

        },
        success: function (response) {
            if(accountId==id){
                response=false;
            }
            Swal.fire({
                title: 'ID 검증',
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
                            title: '중복된 사원번호입니다.',
                            text: '다시 확인해주세요',

                        }).then(result => {
                            $("#accountId").removeClass("success")
                            $("#accountId").addClass("fail")
                        });
                    }
                    else {
                        Swal.fire({
                            icon: 'success',
                            title: '사용 가능한 아이디입니다.',
                            text: '아이디를 사용하시겠습니까?',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: '예',
                            cancelButtonText: '아니오'
                        }).then(result => {
                            if (result.isConfirmed) {
                                $("#accountId").removeClass("fail")
                                $("#accountId").addClass("success")
                                $("#idCheck").removeClass("btn-outline-primary")
                                
                                $("#idCheck").addClass("btn-primary")
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
$("#accountId").on("change", function () {
    $("#accountId").removeClass("success");
    $("#idCheck").addClass("btn-outline-primary")
    $("#idCheck").removeClass("btn-primary")
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