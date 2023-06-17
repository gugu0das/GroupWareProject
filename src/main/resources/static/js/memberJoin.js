$('#startTime').timepicker({
    timeFormat: 'hh:mm p',
    interval: 30,
    minTime: '7',
    maxTime: '1:00pm',
    defaultTime: '9',
    startTime: '7:00',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});


$('#finishTime').timepicker({
    timeFormat: 'hh:mm p',
    interval: 30,
    defaultTime: '18',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});

$("#idCheck").on("click", async function () {
    let id = $("#accountId").val()
    

    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/member/idDuplicateCheck",
        data: {
            employeeId: id,
            accountId: id

        },
        success: function (response) {
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