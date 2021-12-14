<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
			
<%
	
	String url = "jdbc:mysql://localhost:3306/mytest";
    String user = "root";
    String pass = "light1223!";
	String password = (String) session.getAttribute("upwd");
    Connection conn ;
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passw = request.getParameter("password");

	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT PASSWORD FROM board3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				password = rs.getString(1);
		 }
		 
		 if(password.equals(passw)) {
			   			
			sql = "DELETE FROM board3 WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="MFBB_CC.jsp";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>


