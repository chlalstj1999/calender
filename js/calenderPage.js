function logoutEvent() {
    if (confirm("로그아웃 하시겠습니까?")) {
        location.href = "../action/logoutAction.jsp"
    }
}

var currentYear = document.getElementById("year").value
var currentMonth = document.getElementById("month").value
var rank = document.getElementById("rank").value
var isMemberInclude = document.getElementById("isMemberInclude").value
console.log(isMemberInclude)

function lastYearEvent() {
    currentYear--
    location.href="calenderPage.jsp?year=" + currentYear + "&month=" + currentMonth + "&isMemberInclude=" + isMemberInclude
}

function nextYearEvent() {
    currentYear++
    location.href="calenderPage.jsp?year=" + currentYear + "&month=" + currentMonth + "&isMemberInclude=" + isMemberInclude
}

function moveToMonthEvent() {
    var selectMonth = document.getElementById("selectMonth").value

    currentMonth = selectMonth
    location.href="calenderPage.jsp?year=" + currentYear + "&month=" + currentMonth + "&isMemberInclude=" + isMemberInclude
}

function generateCalender(year, month) {
    var yearValue = document.getElementById("yearValue")
    var monthValue = document.getElementById("monthValue")

    yearValue.textContent = year + "년"
    monthValue.textContent = month + "월"

    var daysInMonth
    if (['1', '3', '5', '7', '8', '10', '12'].includes(month)) {
        daysInMonth = 31;
    } else if (month === '2') {
        daysInMonth = (year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0)) ? 29 : 28
    } else {
        daysInMonth = 30;
    }

    var calenderTable = document.createElement("table")
    var day = 1

    for (var i = 0; i < 5; i++) {
        var row = calenderTable.insertRow()
        for (var j = 0; j < 7; j++) {
            var cell = row.insertCell()
            var link = document.createElement("a")
            var schedule = document.createElement("p")
            var dayField = document.getElementById(day)
            if (dayField) {
                var count = dayField.value
                month = month.toString().padStart(2, "0")
                day = day.toString().padStart(2, "0")
                link.href = "detailCalenderPage.jsp?year=" + year + "&month=" + month + "&day=" + day + "&isMemberInclude=" + isMemberInclude
                link.textContent = day
                schedule.textContent = "일정 개수: " + count
                schedule.style.backgroundColor = "blue"
                schedule.style.color = "white"
                cell.appendChild(link)
                cell.appendChild(schedule)
            } else {
                month = month.toString().padStart(2, "0")
                day = day.toString().padStart(2, "0")
                link.href = "detailCalenderPage.jsp?year=" + year + "&month=" + month + "&day=" + day + "&isMemberInclude=" + isMemberInclude
                link.textContent = day
                cell.appendChild(link)
            }
            day++
        }

    document.querySelector("main").appendChild(calenderTable)
    }
}

generateCalender(currentYear, currentMonth)

function includeMemberScheduleEvent() {
    isMemberInclude = "memberInclude"
    location.href="calenderPage.jsp?year=" + currentYear + "&month=" + currentMonth + "&isMemberInclude=" + isMemberInclude
}

function excludeMemberScheduleEvent() {
    isMemberInclude = "memberExclude"
    location.href="calenderPage.jsp?year=" + currentYear + "&month=" + currentMonth + "&isMemberInclude=" + isMemberInclude
}