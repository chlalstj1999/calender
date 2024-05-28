function findPwEvent() {
    var idValue = document.getElementById("idValue").value
    var phonenumber = document.getElementById("phonenumber").value
    var pattern = /^\d{11}$/

    if (!idValue) {
        alert("아이디를 입력해주세요")
    } else if (!phonenumber) {
        alert("핸드폰 번호를 입력해주세요")
    } else if(!pattern.test(phonenumber)) {
        alert("핸드폰 번호 양식을 다시 확인해주세요")
    } else {
        location.href="../action/findPwAction.jsp?idValue=" + idValue + "&phonenumber=" + phonenumber
    }
}