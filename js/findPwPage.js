function findPwEvent() {
    var idValue = document.getElementById("idValue").value
    var phonenumber = document.getElementById("phonenumber").value

    if (!idValue) {
        alert("아이디를 입력해주세요")
    } else if (!phonenumber) {
        alert("핸드폰 번호를 입력해주세요")
    } else {
        location.href="../action/findIdAction.jsp?idValue=" + idValue + "&phonenumber=" + phonenumber
    }
}