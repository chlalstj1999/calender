<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/findIdStyle.css">
</head>

<body>
    <div>
        <p>아이디 찾기</p>
        <input id=phonenumber type="text" placeholder="핸드폰 번호">
        <hr>
        <input type="button" value="확인" onclick="findIdEvent()">
    </div>

    <script src="../js/findIdPage.js"></script>
</body>