<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/calenderStyle.css">
</head>

<body>
    <header>
        <p>ㅇㅇㅇ님의 일정표입니다</p>
        <input id="logoutBtn" type="button" value="로그아웃" onclick="logoutEvent()">
    </header>
    <hr>
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