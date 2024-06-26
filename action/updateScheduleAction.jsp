<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
    request.setCharacterEncoding("utf-8");
    String errorMessage = null;
    String year = null;
    String month = null;
    String day = null;

    try {
        Integer accountIdx = (Integer) session.getAttribute("accountIdx");
        String dateTime = request.getParameter("dateTime");
        String content = request.getParameter("content");
        String scheduleIdx = request.getParameter("scheduleIdx");
        String[] dateParts = dateTime.substring(0, 10).split("-");

        year = dateParts[0];
        month = dateParts[1];
        day = dateParts[2];

        if (accountIdx == null) {
            throw new Exception("로그인 후 이용해주세요");
        } else if (dateTime == null) {
            throw new Exception("일정 시간을 선택해주세요");
        } else if (content == null) {
            throw new Exception("일정 내용을 입력해주세요");
        }

        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");
        
        String sql = "UPDATE schedule SET time=?, content=? WHERE idx=?;";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1, dateTime);
        query.setString(2, content);
        query.setString(3, scheduleIdx);

        query.executeUpdate();
    } catch(Exception e) {
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
            location.href = "../page/detailCalenderPage.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>"
        </script>
    <% } else { %>
        <script>
            alert("<%=errorMessage%>")
        </script>
    <% } %>
</body>