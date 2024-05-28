function idCheckEvent() {
    var pattern = /^[a-zA-Z0-9]{1,20}$/
    var idValue = document.getElementById("idValue").value

    if (!idValue) {
        alert("아이디를 입력해주세요")
    } else if (!pattern.test(idValue)) {
        alert("아이디는 영문자 또는 숫자만 가능합니다")
        console.log(idValue)
        console.log(pattern.test(idValue))
    } else {
        window.open("../action/checkIdAction.jsp?id=" + idValue, "idCheckWin", "width=500 height=200")
    }
}

function idDuplicate(isDuplicate) {
    if (isDuplicate) {
        document.getElementById("idValue").value = ""
        document.getElementById("isIdCheck").value = "idUncheck"
    } else {
        document.getElementById("isIdCheck").value = "idCheck"
        document.getElementById("idValue").disabled = true
    }
}

function phonenumberCheckEvent() {
    var phonenumber = document.getElementById("phonenumber").value
    var pattern = /^\d{11}$/

    if (!phonenumber) {
        alert("핸드폰 번호를 입력해주세요")
    } else if (!pattern.test(phonenumber)) {
        alert("핸드폰 번호 양식을 다시 확인해주세요")
    } else {
        window.open("../action/checkPhonenumberAction.jsp?phonenumber=" + phonenumber, "phonenumberCheckWin", "width=500 height=200")
    }
}

function phonenumberDuplicate(isDuplicate) {
    if (isDuplicate) {
        document.getElementById("phonenumber").value=""
        document.getElementById("isPhonenumberCheck").value = "phonenumberUncheck"
    } else {
        document.getElementById("isPhonenumberCheck").value = "phonenumberCheck"
        document.getElementById("phonenumber").disabled = true
    }
} 


function signupEvent() {
    var pwPattern = /^(?=.*[a-zA-Z])(?=.*\d).{1,20}$/
    var name = document.getElementById("name").value
    var idValue = document.getElementById("idValue").value
    var isIdCheck = document.getElementById("isIdCheck").value
    var pwValue = document.getElementById("pwValue").value
    var pwConfirm = document.getElementById("pwConfirm").value
    var phonenumber = document.getElementById("phonenumber").value
    var isPhonenumberCheck = document.getElementById("isPhonenumberCheck").value

    if (!name) {
        alert("이름을 입력해주세요!")
    } else if (!idValue) {
        alert("아이디를 입력해주세요!")
    } else if (isIdCheck != "idCheck") {
        alert("아이디 중복체크를 해주세요!")
    } else if (!pwValue) {
        alert("비밀번호를 입력해주세요!")
    } else if (!pwPattern.test(pwValue)) {
        alert("비밀번호는 영문자와 숫자를 하나 이상 포함해야합니다")
    } else if (!pwConfirm) {
        alert("비밀번호 확인을 해주세요!")
    } else if (pwValue != pwConfirm) {
        alert("비밀번호를 동일하게 입력해주세요!")
    } else if (!phonenumber) {
        alert("전화번호를 입력해주세요!")
    } else if (isPhonenumberCheck != "phonenumberCheck") {
        alert("전화번호 중복체크를 해주세요!")
    } else {
        document.getElementById("idValue").disabled = false
        document.getElementById("phonenumber").disabled = false
        document.getElementById("signupForm").submit()
    }
}