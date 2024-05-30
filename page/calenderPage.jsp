<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%  
    Integer accountIdx = (Integer)session.getAttribute("accountIdx");
    String department = (String)session.getAttribute("department");
    String rank = (String) session.getAttribute("rank");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String isMemberInclude = request.getParameter("isMemberInclude");
    String username = null;
    String scheduleCount = null;

    session.setAttribute("isMemberInclude", isMemberInclude);
    
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");

    String sql = "SELECT name FROM account WHERE idx=?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setInt(1, accountIdx);

    ResultSet result = query.executeQuery();

    if (result.next()) {
        username = result.getString(1);
    }

    if (isMemberInclude.equals("memberInclude")) {
        sql = sql = "SELECT DAY(time), COUNT(*) FROM schedule JOIN account ON schedule.account_idx = account.idx WHERE account.department = ? AND YEAR(time) = ? AND MONTH(time) = ? GROUP BY DATE(time);";
        query = connect.prepareStatement(sql);
        query.setString(1, department);
        query.setString(2, year);
        query.setString(3, month);
    } else {
        sql = "SELECT DAY(time), COUNT(*) FROM schedule WHERE account_idx = ? AND YEAR(time) = ? AND MONTH(time) = ? GROUP BY DATE(time);";
        query = connect.prepareStatement(sql);
        query.setInt(1, accountIdx);
        query.setString(2, year);
        query.setString(3, month);
    }

    result = query.executeQuery();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/calenderStyle.css">
</head>

<body>
    <input id="year" type="hidden" value="<%=year%>">
    <input id="month" type="hidden" value="<%=month%>">
    <input id="rank" type="hidden" value="<%=rank%>">
    <input id="isMemberInclude" type="hidden" value="<%=isMemberInclude%>">

    <% while(result.next()) { %>
        <input id="<%=result.getString(1)%>" type="hidden" value="<%=result.getString(2)%>">
    <% } %>
    <header>
        <p><%=username%>님의 일정표입니다</p>
        <input id="logoutBtn" type="button" value="로그아웃" onclick="logoutEvent()">
    </header>
    <hr>
    <% if (rank.equals("팀장")) { %>
            <input id="includeMemberBtn" type="button" value="팀원 일정 포함" onclick="includeMemberScheduleEvent()">
            <input id="excludeMemberBtn" type="button" value="팀원 일정 미포함" onclick="excludeMemberScheduleEvent()">
    <% } %>
    <main>
        <div id="calenderInfo">
            <div id="yearMonth">
                <p id="yearValue"></p>
                <p id="monthValue"></p>
            </div>
            <div id="control">
                <input id="lastYearBtn" type="button" value="<" onclick="lastYearEvent()">
                <input id="nextYearBtn" type="button" value=">" onclick="nextYearEvent()">
                <select id="selectMonth" onchange="moveToMonthEvent()">
                    <option value="1"> 1 </option>
                    <option value="2"> 2 </option>
                    <option value="3"> 3 </option>
                    <option value="4"> 4 </option>
                    <option value="5"> 5 </option>
                    <option value="6"> 6 </option>
                    <option value="7"> 7 </option>
                    <option value="8"> 8 </option>
                    <option value="9"> 9 </option>
                    <option value="10"> 10 </option>
                    <option value="11"> 11 </option>
                    <option value="12"> 12 </option>
                </select>월
            </div>
        </div>
    </main>
    <script src="../js/calenderPage.js"></script>
</body>