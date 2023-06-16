//기본셋팅
//dataTables
$("#employeeTable").DataTable({
	// 표시 건수기능 숨기기
	lengthChange: true,
	// 검색 기능 숨기기
	searching: false,
	// 정렬 기능 숨기기
	ordering: true,
	// 정보 표시 숨기기
	info: false,
	// 페이징 기능 숨기기
	paging: true,
	//스크롤바
	scrollX: false
})

//timepicker
$('#startTime').timepicker({
    timeFormat: 'hh:mm p',
    interval: 30,
    minTime: '7',
    maxTime: '1:00pm',
    // defaultTime: '9',
    startTime: '7:00',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});


$('#finishTime').timepicker({
    timeFormat: 'hh:mm p',
    interval: 30,
    // defaultTime: '18',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});
///------------------------------------------------


$(document).on("click", ".box", function () {
    let category = $(this).attr("data-c") * 1;

    $(".updateBlock").each(function(i,data){
        $(data).removeClass("show");
    })
    

    if (category == 1) {
        $("#memberInfo").addClass("show");
    }
    else if (category == 2) {
        $("#securityInfo").addClass("show");
    }
    else if (category == 3) {
        $("#employeeStatusInfo").addClass("show");
    }
    else if (category == 4) {
        $("#annualInfo").addClass("show");
    }
})
//category1번 사원정보 수정
let depFlag = false;
let jobFlag = false;
$(document).on("click", ".depTables", function () {
    let depId = $(this).find("#depId").attr("data-depId");
    let depName = $(this).find("#depId").attr("data-name");
    $("#departmentInputId").val(depId);
    $("#depName").val(depName)
    depFlag = !depFlag;
})
$(document).on("click", ".jobTables", function () {

    let jobId = $(this).find("#jobId").attr("data-jobId");
    let jobname = $(this).find("#jobId").attr("data-name");
    $("#jobInputId").val(jobId);
    $("#jobName").val(jobname)
    jobFlag = !jobFlag;
})
$(document).on("click", "#depName", function () {
    depFlag = !depFlag;
    console.log("ASdfasdf");
    if (jobFlag == true) {
        depFlag = false;
        $(document).find("#jobName").click();
        depFlag = true;
    }
})

$(document).on("click", "#jobName", function () {
    jobFlag = !jobFlag;
    console.log("ASdfasdf");
    if (depFlag == true) {
        jobFlag = false;
        $(document).find("#depName").click();
        jobFlag = true;
    }

})
//2 보안관련
$(".securityBox").on("click",function(){
    let memberName = $(this).attr("data-name");
    (async () => {
        const { value: initPw } = await Swal.fire({
            title: '비밀번호 초기화',
            text: '초기 비밀번호를 입력 해주세요.',
            input: 'text',
            inputPlaceholder: '0000'
        })
        // 이후 처리되는 내용.
        if (initPw) {
            
            console.log(initPw)
            Swal.fire({
                title: '정말 초기화 하시겠습니까?',
                text: "이름 : "+memberName+" 비밀번호 : '"+initPw+"'",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '확인',
                cancelButtonText: '취소'
              }).then((result) => {
                if (result.isConfirmed) {
                    $(".securityBox").find("#initPw").val(initPw);
                    $("#pwForm").submit();
                }
              })


            

        }
    })()
})


//3 employeeStatus관련
$(".employeeStatusData").on("click",function(){
    $("#employeeStatusDetail").find("#employeeStatusId").val($(this).attr("data-empId"))

    $(this).children(".td").each(function(i,data){
        if(i==0){
            $("#employeeStatusDetail").find("#title").html($(data).html())
        }
        $("#employeeStatusDetail").find("#"+i).val($(data).html());
    })
})
//4. annual관련
$(".leaveData").on("click",function(){
    $("#leaveDetail").find("#leaveId").val($(this).attr("data-leaveId"))
    $(this).children(".td").each(function(i,data){
        console.log($(data).html());
        $("#leaveDetail").find("#"+i).val($(data).html());
    })
})
$(".leaveDetail").on("click","#0",function(){
    $(this).val("");
    console.log($(this).val())
})
//뒤로가기
$(document).on("click", "#back", function () {
    $(".updateBlock").each(function(i,data){
        $(data).removeClass("show");
    })
    $("#mainInfo").addClass("show")
})

