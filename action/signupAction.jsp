<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.regex.Pattern"%>

<%
    request.setCharacterEncoding("utf-8");
    String errorMessage = null;

    try {
        String name = request.getParameter("name");
        String idValue = request.getParameter("idValue");
        String pwValue = request.getParameter("pwValue");
        String phonenumber = request.getParameter("phonenumber");
        String department = request.getParameter("department");
        String rank = request.getParameter("rank");

        if (name.isEmpty()) {
            throw new Exception("이름을 입력해주세요");
        } else if (idValue.isEmpty()) {
            throw new Exception("아이디를 입력해주세요");
        } else if (!Pattern.matches("^[a-zA-Z0-9]*{1,20}$", idValue)) {
            throw new Exception("아이디는 영문자 또는 숫자만 가능합니다");
        } else if (pwValue.isEmpty()) {
            throw new Exception("비밀번호를 입력해주세요");
        } else if (!Pattern.matches("^(?=.*[a-zA-Z])(?=.*\\d).{1,20}$", pwValue)) {
            throw new Exception("비밀번호는 영문자와 숫자를 하나 이상 포함해야합니다");
        } else if (phonenumber.isEmpty()) {
            throw new Exception("핸드폰번호를 입력해주세요");
        } else if (!Pattern.matches("^\\d{11}$", phonenumber)) {
            throw new Exception("핸드폰 번호 양식을 다시 확인해주세요");
        } else if (!department.equals("기획팀") && !department.equals("개발팀")) {
            throw new Exception("부서 선택을 다시 확인해주세요");
        } else if (!rank.equals("팀장") && !rank.equals("팀원")) {
            throw new Exception("직급 선택을 다시 확인해주세요");
        }

        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");
        
        String sql = "SELECT id FROM account WHERE id=?;";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1, idValue); 

        ResultSet result = query.executeQuery();

        if (result.next()) {
            throw new Exception("존재하는 아이디입니다");
        }

        sql = "SELECT phonenumber FROM account WHERE phonenumber=?;";
        query = connect.prepareStatement(sql);
        query.setString(1, phonenumber); 

        result = query.executeQuery();

        if (result.next()) {
            throw new Exception("존재하는 전화번호입니다");
        }

        sql = "INSERT INTO account (name, id, password, phonenumber, department, rank) VALUES (?, ?, ?, ?, ?, ?);";
        query = connect.prepareStatement(sql);
        query.setString(1, name);
        query.setString(2, idValue);
        query.setString(3, pwValue);
        query.setString(4, phonenumber);
        query.setString(5, department);
        query.setString(6, rank);

        query.executeUpdate();
    } catch (Exception e) {
        errorMessage = e.getMessage();
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <% if (errorMessage == null) { %>
        <script>
            alert("회원가입에 성공하였습니다!")
            location.href = "../index.jsp"
        </script>
    <% } else { %>
        <script>
            alert("<%=errorMessage%>")
        </script>
    <% } %>
</body>