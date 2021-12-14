<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
		
	<%! 
		int sum = 9;
		Calendar cal;
	%>
	<% 
		cal = Calendar.getInstance();
		String[] yoil = {"일", "월","화","수","목","금","토"};
	%>
	
<body>

<table>
		<tr>
			<td>
				번호
			</td>
            <td>
                제목
            </td>
            <td>
                작성자
            </td>
            <td>
                작성일
            </td>
		</tr>
	<%
		String URL = "jdbc:mysql://localhost:3306/mytest2";
    	String USER = "root";
    	String PASSWORD= "asdf!";
    	PreparedStatement stmt;
    	Connection conn ;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			String sql = "select * from bbs";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				String title = rs.getString(1);
				String author = rs.getString(2);
				String date = rs.getString(3);
	%>
	<tr>
				<td>
					<%= sum%>
				</td>
				<td>
					<%= title%>
				</td>
				<td>
					<%= author%>
				</td>
		</tr>
	<%
			}
		} catch(Exception e) {
			out.println(e.getMessage());
		}
	%>
	</table>
	<% 
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		int day = cal.get(Calendar.DAY_OF_WEEK);
	%>
	<%= year + " 년" + month + "월" + date + "일" + hour +"시" + minute + "분" + second + "초 입니다.(오늘은 \"" + yoil[day-1] + "\"일입니다)" %>



</body>
</html>