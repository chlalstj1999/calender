function loginEvent() {
    var idValue = document.getElementById("idValue").value
    var pwValue = document.getElementById("pwValue").value

    if (!idValue || !pwValue) {
        alert("아이디 또는 비밀번호를 입력해주세요!")
    } else {
        // location.href = "action/loginAction.jsp?idValue=" + idValue + "&pwValue=" + pwValue
        location.href = "page/calenderPage.jsp"
    }
}

function moveToSignupPageEvent() {
    location.href = "page/signupPage.jsp"
}