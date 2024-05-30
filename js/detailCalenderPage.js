function addScheduleEvent() {
    var date = document.getElementById("date").value
    var hour = document.getElementById("hour").value
    var minute = document.getElementById("minute").value
    var content = document.getElementById("content").value
    var dateTime = date + " " + hour + ":" + minute
    
    if (!content) {
        alert("일정 내용을 입력해주세요")
    } else {
        location.href = "../action/addScheduleAction.jsp?dateTime=" + dateTime + "&content=" + content
    }
}

function updateScheduleEvent() {
    
}

function deleteScheduleEvent() {
    var year = document.getElementById("year").value
    var month = document.getElementById("month").value
    var day = document.getElementById("day").value

    if (confirm("정말 삭제하시겠습니까?")) {
        var scheduleIdx = document.getElementById("scheduleIdx").value
        location.href="../action/deleteScheduleAction.jsp?scheduleIdx=" + scheduleIdx + "&year=" + year + "&month=" + month + "&day=" + day
    }
}