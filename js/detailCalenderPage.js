function addScheduleEvent() {
    var date = document.getElementById("date").value
    var hour = document.getElementById("hourSelect").value
    var minute = document.getElementById("minuteSelect").value
    var content = document.getElementById("contentInput").value
    var dateTime = date + " " + hour + ":" + minute
    
    if (!content) {
        alert("일정 내용을 입력해주세요")
    } else {
        location.href = "../action/addScheduleAction.jsp?dateTime=" + dateTime + "&content=" + content
    }
}

function updateScheduleEvent(content, hour, minute, idx) {
    var date = document.getElementById("date").value
    var scheduleDiv = document.getElementById(idx)
    var contentTag = document.getElementById("content_" + idx)
    var timeTag = document.getElementById("time_" + idx)
    var updateBtn = document.getElementById("updateBtn_" + idx)
    var deleteBtn = document.getElementById("deleteBtn_" + idx)
    
    contentTag.style.display = "none"
    timeTag.style.display = "none"
    updateBtn.style.display = "none"
    deleteBtn.style.display = "none"
    scheduleDiv.style.backgroundColor = "white"
    scheduleDiv.style.display = "flex"

    const hourSelect = document.createElement('select')
    hourSelect.id = 'hourSelect'
    for (let i = 0; i < 24; i++) {
        const option = document.createElement('option')
        option.value = i.toString().padStart(2, '0')
        option.textContent = `${i.toString().padStart(2, '0')}시`
        if (i == hour) option.selected = true
        hourSelect.appendChild(option)
    }
    scheduleDiv.appendChild(hourSelect)

    const minuteSelect = document.createElement('select')
    minuteSelect.id = 'minuteSelect'
    for (let i = 0; i < 60; i++) {
        const option = document.createElement('option')
        option.value = i.toString().padStart(2, '0')
        option.textContent = `${i.toString().padStart(2, '0')}분`
        if (i == minute) option.selected = true
        minuteSelect.appendChild(option)
    }
    scheduleDiv.appendChild(minuteSelect)

    const contentInput = document.createElement('input')
    contentInput.type = 'text'
    contentInput.value = content
    contentInput.id = 'contentInput'
    contentInput.placeholder = "일정 내용"
    scheduleDiv.appendChild(contentInput)

    const confirmBtn = document.createElement('input')
    confirmBtn.type = 'button'
    confirmBtn.value = "확인"
    confirmBtn.id = "confirmBtn"
    scheduleDiv.appendChild(confirmBtn)
    confirmBtn.onclick = function() {
        if (!contentInput.value) {
            alert("일정 내용을 입력해주세요")
        } else {
            var dateTime = date + " " + hourSelect.value + ":" + minuteSelect.value

            location.href = "../action/updateScheduleAction.jsp?dateTime=" + dateTime + "&content=" + contentInput.value + "&scheduleIdx=" + idx
        }
    }
}

function deleteScheduleEvent(idx) {
    var year = document.getElementById("year").value
    var month = document.getElementById("month").value
    var day = document.getElementById("day").value

    if (confirm("정말 삭제하시겠습니까?")) {
        location.href="../action/deleteScheduleAction.jsp?scheduleIdx=" + idx + "&year=" + year + "&month=" + month + "&day=" + day
    }
}