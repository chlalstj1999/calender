<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" type="text/css" href="css/indexStyle.css">
</head>

<body>
    <div>
        <input id="idValue" type="text" placeholder="아이디">
        <input id="pwValue" type="password" placeholder="비밀번호">
        <input id="loginBtn" type="button" value="로그인" onclick="loginEvent()">
        <a href="page/findIdPage.jsp">아이디를 잊으셨나요?</a>
        <a href="page/findPwPage.jsp">비밀번호를 잊으셨나요?</a>
        <hr>
        <input id="signupBtn" type="button" value="새 계정 만들기" onclick="moveToSignupPageEvent()">
    </div>

    <script src="js/index.js"></script>
</body>