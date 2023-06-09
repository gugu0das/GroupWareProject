//timeStemp
//출근시간
let onTime = $("#timeStatus").attr("data-onTime");
const onTimeDate = new Date(onTime);
onTimeDate.getTime()

const now2 = new Date();
function getClock() {
    const now = new Date();

    now.getTime


 
    const year = now.getFullYear();
    const month = now.getMonth();
    const date = now.getDate();
    const hours = String(now.getHours()).padStart(2,"0");
    const minutes = String(now.getMinutes()).padStart(2,"0");
    const seconds = String(now.getSeconds()).padStart(2,"0");

    
    $("#timeStemp").find("#month").text(year+"년 "+month+"월 "+date+"일")
    $("#timeStemp").find("#date").text(hours+":"+minutes+":"+seconds)
    
    
    
    // statusUpdate(status);
} 
let status = $("#statusBtns").attr("data-status");

getClock()
setInterval(getClock,1000)



$("#testStatusUp").on("click",function(){
    $.ajax({
        type:"POST",
        url:"member/testStatusUp",
        success : function(data){
            alert("Test생성되었습니다.")
        },
        error : function(){
            alert("Test생성되었습니다")
        }
    })
})

$("#statusBtns").on("click",".btn",function(){
    
    $("#statusVal").attr("value",$(this).html())
    
    $("#timeHistory").submit();
})

// $(".monthItem").each(function(index,data){
//     let employeeStatusVOsData =$(data).find("#employeeStatusBodys").html();
//     if(employeeStatusVOsData==null|| employeeStatusVOsData.trim()==''){
//         $(data).remove();
//     }
// })