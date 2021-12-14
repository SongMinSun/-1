<%@ page contentType="text/html;charset=utf-8" %> <%@ page import="java.sql.*"
%>
<%

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/mytest";
	String id = "root";
	String pass = "light1223!";

	String name = (String) session.getAttribute("uid");
	String password = (String) session.getAttribute("upwd");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT REF, INDENT, STEP FROM board3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE board3 SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
		stmt.executeUpdate(sql);
		
		sql = "INSERT INTO board3(USERNAME, PASSWORD, TITLE, MEMO, REF, INDENT, STEP) "+
				"values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		
		pstmt.execute(); 
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e) {
		
	}
%>

  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="MFBB_CC.jsp";
  </script>

