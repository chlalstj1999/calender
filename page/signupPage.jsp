<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>

<%
    
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/signupStyle.css">
</head>

<body>
    <div>
        <p>새 계정 만들기</p>
        <hr>
        <form id="signupForm" action="../action/signupAction.jsp">
            <table>
                <tr>
                    <td>
                        <input id="name" name="name" type="text" placeholder="이름">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="idValue" name="idValue" type="text" placeholder="아이디">
                    </td>
                    <td>
                        <input id="idCheckBtn" type="button" value="중복체크" onclick="idCheckEvent()">
                        <input type="hidden" id="isIdCheck" value="idUncheck">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pwValue" name="pwValue" type="password" placeholder="비밀번호">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pwConfirm" type="password" placeholder="비밀번호 확인">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="phonenumber" name="phonenumber" type="text" placeholder="핸드폰 번호">
                    </td>
                    <td>
                        <input id="phonenumberBtn" type="button" value="중복체크" onclick="phonenumberCheckEvent()">
                        <input type="hidden" id="isPhonenumberCheck" value="phonenumberUncheck">
                    </td>
                </tr>
                <tr>
                    <td>
                        <%-- createElement 처리하기 --%>
                        부서
                        <input name=department type="radio" value="기획팀"> 기획팀
                        <input name=department type="radio" value="개발팀"> 개발팀
                    </td>
                </tr>
                <tr>
                    <td>
                        직급
                        <%-- createElement 처리하기 --%>
                        <input name=rank type="radio" value="팀장"> 팀장
                        <input name=rank type="radio" value="팀원"> 팀원
                    </td>
                </tr>
            </table>
            <input id="signupBtn" type="button" value="새 계정 만들기" onclick="signupEvent()">
        </form>
    </div>

    <script src="../js/signupPage.js">
        
    </script>
</body>