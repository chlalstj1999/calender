var date = new Date()
var year = date.getFullYear()
var month = date.getMonth()

location.href = "../page/calenderPage.jsp?year=" + year + "&month=" + (month + 1)