<%@ page contentType="text/html;charset=utf-8" %>

<html>
<head><title>작업 영역</title>
<meta charset='utf-8'>
</head>
<body>
    <h1>작업 영역</h1>
<%
    String uid = (String) session.getAttribute("uid");
    String name = (String) session.getAttribute("name");
    if(uid == null) {
        response.sendRedirect("login.html");
    }
%>
<script>location.href="MFBB.jsp"</script>
</body>
</html>