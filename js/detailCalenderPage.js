function addScheduleEvent() {
    var year = document.getElementById("year").value
    var month = document.getElementById("month").value
    var date = document.getElementById("date").value
    var hour = document.getElementById("hour").value
    var minute = document.getElementById("minute").value
    var content = document.getElementById("content").value
    var dateTime = year + "-" + month + "-" + date + " " + hour + ":" + minute
    
    if (!content) {
        alert("일정 내용을 입력해주세요")
    } else {
        location.href = "../action/addScheduleAction.jsp?dateTime=" + dateTime + "&content=" + content
    }
}