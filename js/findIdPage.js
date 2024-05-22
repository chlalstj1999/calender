function findIdEvent() {
    var phonenumber = document.getElementById("phonenumber").value

    if (!phonenumber) {
        alert("핸드폰 번호를 입력해주세요")
    } else {
        location.href="../action/findIdAction.jsp?phonenumber=" + phonenumber
    }
}