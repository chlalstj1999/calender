function idCheckEvent() {
    var pattern = /^[a-zA-Z0-9]*.{,20}$/
    var idValue = document.getElementsByName("idValue")[0].value

    if (!idValue) {
        alert("아이디를 입력해주세요")
    } else if (!pattern.test(idValue)) {
        alert("아이디는 영문자 또는 숫자만 가능합니다")
    } else {
        window.open("../action/checkIdAction.jsp?id=" + idValue, "idCheckWin", "width=500 height=200")
    }
}

function idDuplicate(isDuplicate) {
    var idDuplication = document.getElementsByName("idDuplication")[0]
    var idValue = document.getElementsByName("id")[0]

    if (isDuplicate) {
        idValue.value=""
        idDuplication.value="idUncheck"
    } else {
        idDuplication.value="idCheck"
    }
}

function phonenumberCheckEvent() {
    var phonenumberValue = document.getElementsByName("phonenumber")[0].value

    if (!phonenumberValue) {
        alert("핸드폰 번호를 입력해주세요")
    } else {
        window.open("../action/checkPhonenumberAction.jsp?phonenumber=" + phonenumberValue, "phonenumberCheckWin", "width=500 height=200")
    }
}

function phonenumberDuplicate(isDuplicate) {
    var phonenumberDuplication = document.getElementsByName("phonenumberDuplication")[0]
    var phonenumberValue = document.getElementsByName("phonenumber")[0]

    if (isDuplicate) {
        phonenumberValue.value=""
        phonenumberDuplication.value="phonenumberUncheck"
    } else {
        phonenumberDuplication.value="phonenumberCheck"
    }
} 


function signupEvent() {
    var pwPattern = /^(?=.*[a-zA-Z])(?=.*\d).{,20}$/

    if (!signupForm.name.value) {
        alert("이름을 입력해주세요!")
    } else if (!signupForm.id.value) {
        alert("아이디를 입력해주세요!")
    } else if (signupForm.idDuplication.value != "idCheck") {
        alert("아이디 중복체크를 해주세요!")
    } else if (!signupForm.pw.value) {
        alert("비밀번호를 입력해주세요!")
    } else if (!pwPattern.test(signupForm.pw.value)) {
        alert("비밀번호는 영문자와 숫자를 하나 이상 포함해야합니다")
    } else if (!signupForm.pwCheck.value) {
        alert("비밀번호 확인을 해주세요!")
    } else if (signupForm.pw.value != signupForm.pwCheck.value) {
        alert("비밀번호를 동일하게 입력해주세요!")
    } else if (!signupForm.phonenumber.value) {
        alert("전화번호를 입력해주세요!")
    } else if (signupForm.phonenumberDuplication.value != "phonenumberCheck") {
        alert("전화번호 중복체크를 해주세요!")
    } else {
        document.getElementById("signupForm").submit()
    }
}