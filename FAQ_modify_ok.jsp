<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>사용자 등록</title>
<meta charset='utf-8'>
</head>
<body>
    
<%

    String url = "jdbc:mysql://localhost:3306/mytest"; 
    String id = "root"; 
    String pass = "light1223!"; 
    String password = "";

    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        int idx = Integer.parseInt(request.getParameter("idx"));
        String title = request.getParameter("title"); 
        String memo = request.getParameter("memo"); 

        Connection conn = DriverManager.getConnection(url,id,pass); 
        Statement stmt = conn.createStatement();

        String sql = "SELECT PASSWORD FROM board WHERE NUM=" + idx; 
        ResultSet rs = stmt.executeQuery(sql);


        
        sql = "UPDATE board SET TITLE='" + title+ "' ,MEMO='"+ memo +"' WHERE NUM=" + idx;
        stmt.executeUpdate(sql);
%>
            <script language=javascript>
                self.window.alert("글이 수정되었습니다.");
                location.href="FAQ_view.jsp?idx=<%=idx%>";
            </script>
<%

            rs.close();
            stmt.close();
            conn.close();
        

%>
            
<%

        
        



    } catch(Exception e) {
        out.println("<h2>DB 연결 실패</h2>");
        out.println(e.getMessage());
    }
%>


</body>
</html>