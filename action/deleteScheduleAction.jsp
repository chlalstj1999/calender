<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<% 
    String scheduleIdx = request.getParameter("scheduleIdx");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");

    String sql = "DELETE FROM schedule WHERE idx=?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, scheduleIdx);

    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("게시글이 삭제되었습니다")
        location.href = "../page/detailCalenderPage.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>"
    </script>
</body>