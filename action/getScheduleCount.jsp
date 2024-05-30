<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%  
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String date = request.getParameter("date");
    Integer accountIdx = (Integer)session.getAttribute("accountIdx");
    String department = (String)session.getAttribute("department");
    String isMemberInclude = request.getParameter("isMemberInclude");
    String scheduleCount = null;
    String scheduleDate = year + "-" + month + "-" + date;

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");

    if (isMemberInclude.equals("memberInclude")) {
        String sql = "SELECT COUNT(*) FROM schedule JOIN account ON schedule.account_idx = account.idx WHERE account.department = ? AND DATE(schedule.time) = ?;";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1, department);
        query.setString(2, scheduleDate);

        ResultSet result = query.executeQuery();

        if (result.next()) {
            scheduleCount = result.getString(1);
        }
    } else {
        String sql = "SELECT COUNT(*) FROM schedule JOIN account ON schedule.account_idx = account.idx WHERE account.idx = ? AND DATE(schedule.time) = ?;";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setInt(1, accountIdx);
        query.setString(2, scheduleDate);

        ResultSet result = query.executeQuery();

        if (result.next()) {
            scheduleCount = result.getString(1);
            query.setString(2, scheduleDate);
        }
    }
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 페이지</title>
</head>

<body>
    <input id="scheduleCount" type="hidden" value="<%=scheduleCount%>">
</body>