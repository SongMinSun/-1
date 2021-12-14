<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>사용자 등록</title>
<meta charset='utf-8'>
</head>
<body>
    <h1>사용자 등록</h1>
    <script>location.href="FAQ_board.jsp"</script>
<%
    String name = (String) session.getAttribute("uid");
    String password = (String) session.getAttribute("upwd");
    String title = request.getParameter("title");
    String memo = request.getParameter("memo");
    int max = 0;

    String URL = "jdbc:mysql://localhost:3306/mytest";
    String USER = "root";
    String PASSWORD= "light1223!";
    

    Connection conn ;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
        Statement stmt = conn.createStatement();

        String sql = "select max(num) from board";
        ResultSet rs = stmt.executeQuery(sql);

        if(rs.next()){
            max=rs.getInt(1);
        }

		int indent = 0;
		int step = 0;

        sql = "insert into board(username, password, title, memo, ref, indent, step) values(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, password);
        pstmt.setString(3, title);
        pstmt.setString(4, memo);
        pstmt.setInt(5, max+1);
        pstmt.setInt(6, indent);
        pstmt.setInt(7, step);
        pstmt.execute();
        pstmt.close();
        stmt.close();
        conn.close();
    } catch(Exception e) {
        out.println("<h2>DB 연결 실패</h2>");
        out.println(e.getMessage());
    }
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="FAQ_board.jsp"; 

</script>

</body>
</html>