<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%  
    Integer accountIdx = null;
    String isMemberInclude = null;
    String year = null;
    String month = null;
    String day = null;
    String department = null;
    String rank = null;
    ResultSet result = null;
    String date = null;
    String errorMessage = null;

    try {
        accountIdx = (Integer)session.getAttribute("accountIdx");
        isMemberInclude = (String)session.getAttribute("isMemberInclude");
        year = request.getParameter("year");
        month = request.getParameter("month");
        day = request.getParameter("day");
        department = (String)session.getAttribute("department");
        rank = (String)session.getAttribute("rank");
        date = year + "-" + month + "-" + day;

        if (accountIdx == null) {
            throw new Exception("로그인 후 이용해주세요");
        } else if (isMemberInclude == null) {
            throw new Exception("다시 접속해주세요");
        }

        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/calender", "stageus", "1234");

        if (isMemberInclude.equals("memberInclude")) {
            String sql = "SELECT content, HOUR(time), MINUTE(time), account_idx, account.name, schedule.idx FROM schedule JOIN account ON schedule.account_idx = account.idx WHERE account.department = ? AND DATE(schedule.time)=? ORDER BY time;";
            PreparedStatement query = connect.prepareStatement(sql);
            query.setString(1, department);
            query.setString(2, date);

            result = query.executeQuery();
        } else {
            String sql = "SELECT content, HOUR(time), MINUTE(time), account_idx, account.name, schedule.idx FROM schedule JOIN account ON schedule.account_idx = account.idx WHERE account.idx = ? AND DATE(schedule.time)=? ORDER BY time;";
            PreparedStatement query = connect.prepareStatement(sql);
            query.setInt(1, accountIdx);
            query.setString(2, date);

            result = query.executeQuery();
        }
    } catch (Exception e) {
        errorMessage = e.getMessage();
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 상세보기 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/detailCalenderStyle.css">
</head>

<body>
    <% if (errorMessage == null) { %>
        <input id="year" type="hidden" value=<%=year%>>
        <input id="month" type="hidden" value=<%=month%>>
        <input id="day" type="hidden" value=<%=day%>>
        <input id="date" type="hidden" value=<%=date%>>
        <header>
            <div id="infoBox">
                <p><%=month%>월 <%=day%>일</p>
                <a href="calenderPage.jsp?year=<%=year%>&month=<%=month%>&isMemberInclude=<%=isMemberInclude%>">[달력 보기]</a>
            </div>
            <div>
                <select id="hour">
                <option value="00">00시</option>
                <option value="01">01시</option>
                <option value="02">02시</option>
                <option value="03">03시</option>
                <option value="04">04시</option>
                <option value="05">05시</option>
                <option value="06">06시</option>
                <option value="07">07시</option>
                <option value="08">08시</option>
                <option value="09">09시</option>
                <option value="10">10시</option>
                <option value="11">11시</option>
                <option value="12">12시</option>
                <option value="13">13시</option>
                <option value="14">14시</option>
                <option value="15">15시</option>
                <option value="16">16시</option>
                <option value="17">17시</option>
                <option value="18">18시</option>
                <option value="19">19시</option>
                <option value="20">20시</option>
                <option value="21">21시</option>
                <option value="22">22시</option>
                <option value="23">23시</option>
                </select>
                <select id="minute">
                    <option value="00">00분</option>
                    <option value="01">01분</option>
                    <option value="02">02분</option>
                    <option value="03">03분</option>
                    <option value="04">04분</option>
                    <option value="05">05분</option>
                    <option value="06">06분</option>
                    <option value="07">07분</option>
                    <option value="08">08분</option>
                    <option value="09">09분</option>
                    <option value="10">10분</option>
                    <option value="11">11분</option>
                    <option value="12">12분</option>
                    <option value="13">13분</option>
                    <option value="14">14분</option>
                    <option value="15">15분</option>
                    <option value="16">16분</option>
                    <option value="17">17분</option>
                    <option value="18">18분</option>
                    <option value="19">19분</option>
                    <option value="20">20분</option>
                    <option value="21">21분</option>
                    <option value="22">22분</option>
                    <option value="23">23분</option>
                    <option value="24">24분</option>
                    <option value="25">25분</option>
                    <option value="26">26분</option>
                    <option value="27">27분</option>
                    <option value="28">28분</option>
                    <option value="29">29분</option>
                    <option value="30">30분</option>
                    <option value="31">31분</option>
                    <option value="32">32분</option>
                    <option value="33">33분</option>
                    <option value="34">34분</option>
                    <option value="35">35분</option>
                    <option value="36">36분</option>
                    <option value="37">37분</option>
                    <option value="38">38분</option>
                    <option value="39">39분</option>
                    <option value="40">40분</option>
                    <option value="41">41분</option>
                    <option value="42">42분</option>
                    <option value="43">43분</option>
                    <option value="44">44분</option>
                    <option value="45">45분</option>
                    <option value="46">46분</option>
                    <option value="47">47분</option>
                    <option value="48">48분</option>
                    <option value="49">49분</option>
                    <option value="50">50분</option>
                    <option value="51">51분</option>
                    <option value="52">52분</option>
                    <option value="53">53분</option>
                    <option value="54">54분</option>
                    <option value="55">55분</option>
                    <option value="56">56분</option>
                    <option value="57">57분</option>
                    <option value="58">58분</option>
                    <option value="59">59분</option>
                </select>
                <input id="content" type="text" placeholder="일정 내용">
                <input id="scheduleAddBtn" type="button" value="일정 추가" onclick="addScheduleEvent()">
            </div>
        </header>
        <main>
            <% while(result.next()) { %>
                <% if (result.getInt(4) == accountIdx) { %>
                    <div id="schedule">
                    <p><%=result.getString(1)%></p>
                    <p id="time"><%=result.getString(2)%>시 <%=result.getString(3)%>분</p>
                    </div>
                    <input type="button" value="수정" onclick="updateScheduleEvent()">
                    <input type="button" value="삭제" onclick="deleteScheduleEvent()">
                <% } else { %>
                    <div id="schedule">
                        <p><%=result.getString(5)%>님</p>
                        <p><%=result.getString(1)%></p>
                        <p><%=result.getString(2)%>시 <%=result.getString(3)%>분</p>
                    </div>
                <% } %>
                <input id="scheduleIdx" type="hidden" value=<%=result.getString(6)%>>
            <% } %>
        </main>
        <script src="../js/detailCalenderPage.js"></script>
    <% } else { %>
        <script>
            alert("<%=errorMessage%>")
        </script>
    <% } %>
</body>