function logoutEvent() {
    if (confirm("로그아웃 하시겠습니까?")) {
        location.href = "../action/logoutAction.jsp"
    }
}

var currentYear = document.getElementById("year").value
var currentMonth = document.getElementById("month").value

generateCalender(currentYear, currentMonth)

function lastYearEvent() {
    currentYear--
    generateCalender(currentYear, currentMonth)
}

function nextYearEvent() {
    currentYear++
    generateCalender(currentYear, currentMonth)
}

function moveToMonthEvent() {
    var selectMonth = document.getElementById("selectMonth").value

    currentMonth = selectMonth
    generateCalender(currentYear, currentMonth)
}

function generateCalender(year, month) {
    var yearValue = document.getElementById("yearValue")
    var monthValue = document.getElementById("monthValue")

    yearValue.textContent = year + "년"
    monthValue.textContent = month + "월"

    var daysInMonth
    if ([1, 3, 5, 7, 8, 10, 12].includes(month + 1)) {
        daysInMonth = 31;
    } else if (month + 1 === 2) {
        daysInMonth = 29;
    } else {
        daysInMonth = 30;
    }

    if (document.querySelector("table")) {
        document.querySelector("table").remove()
    }

    var calenderTable = document.createElement("table")
    var date = 1
    for (var i = 0; i < 5; i++) {
        var row = calenderTable.insertRow()
        for (var j = 0; j < 7; j++) {
            var cell = row.insertCell()
            if (date <= daysInMonth) {
                var link = document.createElement("a")
                link.href = "detailCalenderPage.jsp?year=" + year +"&month=" + month + "&date=" + date
                link.textContent = date
                cell.appendChild(link)
                date++
            }
        }
    }

    document.querySelector("main").appendChild(calenderTable)
}