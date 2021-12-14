<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>사용자 등록</title>
<meta charset='utf-8'>
</head>
<body>
    <h1>사용자 등록</h1>
    <script>location.href="login.html"</script>
<%
    String title = request.getParameter("bbsTitle");
    String content = request.getParameter("bbsContent");

    String URL = "jdbc:mysql://localhost:3306/mytest";
    String USER = "root";
    String PASSWORD= "light1223!";
    PreparedStatement stmt;
    Connection conn ;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
        String sql = "insert into board(uid, passwd, uname) values(?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, passwd);
        stmt.setString(3, name);
        stmt.executeUpdate();
        out.println(name + "님 등록이 성공적으로 완료되었습니다.");
        out.println("<br><a href='login.html'>로그인창으로 돌아가기</a>");
    } catch(Exception e) {
        out.println("<h2>DB 연결 실패</h2>");
        out.println(e.getMessage());
    }
%>
</body>
</html>