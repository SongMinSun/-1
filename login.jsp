<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>사용자 로그인</title>
<meta charset='utf-8'>
</head>
<body>
<h1>사용자 로그인</h1>
<%
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");
String URL = "jdbc:mysql://localhost:3306/mytest";
String USER = "root";
String PASSWORD= "light1223!";
PreparedStatement stmt;
Connection conn ;
String name = null;
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(URL, USER, PASSWORD);
String sql = "select uname from user2 where uid=? and passwd=?";
stmt = conn.prepareStatement(sql);
stmt.setString(1, email);
stmt.setString(2, passwd);
ResultSet rs = stmt.executeQuery();
while(rs.next()) {
name = rs.getString(1);
break;
}
if(name != null) {
session.setAttribute("uid", email);
session.setAttribute("name", name);
session.setAttribute("upwd", passwd);
out.println(name + "님 로그인에 성공하였습니다.");
%>
<script>location.href="MFBB.jsp"</script>
<%
}
} catch(Exception e) {
out.println("<h2>DB 연결 실패</h2>");
out.println(e.getMessage());
}
%>
</body>
</html>

