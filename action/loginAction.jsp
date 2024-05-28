<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 액션</title>
    <link rel="stylesheet" type="text/css" href="../css/calenderStyle.css">
</head>

<body>
   
    <script>
        var date = new Date()
        var year = date.getFullYear()
        var month = date.getMonth()

        location.href = "../page/calenderPage.jsp?year=" + year + "&month=" + (month + 1)
    </script>
</body>