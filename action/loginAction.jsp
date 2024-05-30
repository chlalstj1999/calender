<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%  
    request.setCharacterEncoding("utf-8");

    String errorMessage = null;
    boolean isLoginSuccess = false;

    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    ResultSet result = null;

    try {
        if (idValue == "") {
            throw new Exception("아이디를 입력해주세요");
        } else if (pwValue == "") {
            throw new Exception("비밀번호를 입력해주세요");
        }

        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");

        String sql = "SELECT idx, department, rank FROM account WHERE id=? AND password=?";
        PreparedStatement query = connect.prepareStatement(sql);

        query.setString(1, idValue);
        query.setString(2, pwValue);

        result = query.executeQuery();

        if (result.next()) {
            isLoginSuccess = true;
            session.setAttribute("accountIdx", result.getInt(1));
            session.setAttribute("department", result.getString(2));
            session.setAttribute("rank", result.getString(3));
        } else {
            errorMessage = "아이디 또는 비밀번호가 틀렸습니다";
        }
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
    <script>
        if(!<%=isLoginSuccess%>) {
            alert("<%=errorMessage%>")
            location.href = "../index.jsp"
        } else {
            var date = new Date()
            var year = date.getFullYear()
            var month = date.getMonth()

            location.href = "../page/calenderPage.jsp?year=" + year + "&month=" + (month + 1) + "&isMemberInclude=memberExclude"
        }
    </script>
</body>