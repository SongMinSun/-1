<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>마이페이지</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script
      src="https://kit.fontawesome.com/70cf0af2bf.js"
      crossorigin="anonymous"
    ></script>

    <style>
      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        font-family: HSGaeulSenggak20;
      }
      @font-face {
        font-family: HSGaeulSenggak20;
        src: url(https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSGaeulSenggak20.woff);
      }
      a {
        text-decoration: none; /* 기본 밑줄을 제거합니다 */
        color: #888;
      }

      /* Style the header */
      .header {
        background-color: #ffffff;
        padding: 20px;
        text-align: center;
        margin: auto;
        position: relative;
        height: 215px;
      }

      /* Style the top navigation bar */
      .topnav {
        overflow: hidden;
        background-color: #81c3f8;
      }

      /* Style the topnav links */
      .topnav a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
      }

      /* Change color on hover */
      .topnav a:hover {
        background-color: #ddd;
        color: #81c3f8;
      }

      /* Create three unequal columns that floats next to each other */
      .column {
        float: left;
        padding: 10px;
      }

      /* Left and right column */
      .column.side {
        background-color: hsl(208, 52%, 84%);
        justify-content: center;
        align-items: center;
        width: 15%;
        display: flex;
        height: 900px;
      }

      /* Middle column */
      .column.middle {
        padding: 25px;
        width: 70%;
      }

      /* Clear floats after the columns */
      .row:after {
        content: "";
        display: table;
        clear: both;
      }

      /* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
      @media screen and (max-width: 600px) {
        .column.side,
        .column.middle {
          width: 100%;
        }
      }
      fieldset {
        border: none; /* 기본 border 없애기(이 코드를 지우고 기본 border를 확인해보세요) */
      }
      .visually-hidden {
        /* legend 안보이게 설정. 이렇게하면 접근성을 준수하면서 디자인을 해치지 않습니다. */
        position: absolute !important;
        height: 1px;
        width: 1px;
        overflow: hidden;
        clip: rect(1px 1px 1px 1px);
        clip: rect(1px, 1px, 1px, 1px);
        white-space: nowrap;
      }

      .img_logo {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }
      img {
        width: 500px;
      }
      .reply{
        height:15px;
        width:25px;
      }

      header > nav {
        width: 100%;
        height: 10%;
        position: absolute;
        bottom: 0px;
      }

      .footer {
        background-color: hsl(207, 86%, 85%);
        padding: 10px;
        text-align: left;
      }

      .container{
        margin-top : 20px;
        width: 100%;
      }

      .row{
        width: 100%;
      }

      .table{
        width:100%;
      }

      .table tr td {
        text-align: left;
      }

      .mypage-user__status {
  display: flex;
  margin-left: 10px;
}

    </style>
    <link rel="stylesheet" href="css/styles.css" />
  </head>
  <body>
    <div class="header">
      <a href="http://localhost:8080/MFBB.html"
        ><img src="logo3.png" class="img_logo"
      /></a>
    </div>
    <%

    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("name");
    if(session.getAttribute("uid")== null){

    %>
      <nav>
      <div class="topnav">
        <a href="MFBB.jsp">지역축제</a>
        <a href="MFBB_C.jsp">커뮤니티</a>
        <a href="FAQ_board.jsp">고객센터</a>
        <a href="login.html" style="float: right">로그인</a>
      </div>
    </nav>
    <%
    } else {
    %>
    <nav>
      <div class="topnav">
        <a href="MFBB.jsp">지역축제</a>
        <a href="MFBB_C.jsp">커뮤니티</a>
        <a href="mypage.jsp">마이페이지</a>
        <a href="FAQ_board.jsp">고객센터</a>
        <a href="login.html" style="float: right">로그아웃</a>
        <a href="mypage.jsp" style="float: right"><%=uid%> 님 환영합니다.</a>
      </div>
    </nav>

    <%
    }
    
    %>
    <div class="row">
      <div class="column side"></div>

      <div class="column middle">
        <div class="mypage-info">
          <h2>기본정보</h2>
          <form action="">
          </form>
        </div>
        <div class="mypage-user">
          <img src="#" alt="" />
          <div class="mypage-user__status">
            <div>Name : <%=uname%></div>
            <div>Email : <%=uid%></div>
          </div>
        </div>

        <div class="divider"></div>

        <div class="container">
        <h3>자유게시판</h3>
          <div class="row">
            <table class="table" style="text-align: center; border: 1px solid #dddddd;">
              <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center; width: 50%;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                <th style="background-color: #eeeeee; text-align: center;">조회수</th>
              </tr>

              <%
		            String URL = "jdbc:mysql://localhost:3306/mytest";
    	          String USER = "root";
    	          String PASSWORD= "light1223!";
    	          PreparedStatement stmt;
    	          Connection conn ;
		            try{
			              Class.forName("com.mysql.jdbc.Driver");
			              conn = DriverManager.getConnection(URL, USER, PASSWORD);
			              String sql = "select * from board3 where username='"+uid+"'" ;
			              stmt = conn.prepareStatement(sql);
			              ResultSet rs = stmt.executeQuery();


                    while(rs.next()) {
                      int idx = rs.getInt(1);
                      String name = uid;
                      String title = rs.getString(4);
                      String time = rs.getString(6);
                      int hit = rs.getInt(7);
                      int indent = rs.getInt(9);
              %>
              <tr>
                <td><%=idx %></td>
                <td align="left">
                <% 
		
	for(int j=0;j<indent;j++){
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(indent!=0){
%>		<img class="reply" src='img/reply_icon.gif' />
<%
	}
%> 

                
                <a href="CC_view.jsp?idx=<%=idx%>"> <%=title %></a></td>
                <td><%=name %></td>
                <td><%=time %></td>
                <td><%=hit %></td>
              </tr>
              <%
              }
                } catch(Exception e){
                }
              %>
                    
          </table>



          
         
          </div>
        </div>

        <div class="container">
        <h3>리뷰게시판</h3>
          <div class="row">
            <table class="table" style="text-align: center; border: 1px solid #dddddd;">
              <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center; width: 50%;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                <th style="background-color: #eeeeee; text-align: center;">조회수</th>
              </tr>

              <%
    	          PreparedStatement stmt2;
		            try{
			              Class.forName("com.mysql.jdbc.Driver");
			              conn = DriverManager.getConnection(URL, USER, PASSWORD);
			              String sql = "select * from board2 where username='"+uid+"'" ;
			              stmt2 = conn.prepareStatement(sql);
			              ResultSet rs = stmt2.executeQuery();


                    while(rs.next()) {
                      int idx2 = rs.getInt(1);
                      String name2 = uid;
                      String title2 = rs.getString(4);
                      String time2 = rs.getString(6);
                      int hit2 = rs.getInt(7);
                      int indent2 = rs.getInt(9);
              %>
              <tr>
                <td><%=idx2 %></td>
                <td align="left">
                <% 
		
	for(int j=0;j<indent2;j++){
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(indent2!=0){
%>		<img class="reply" src='img/reply_icon.gif' />
<%
	}
%> 

                
                <a href="C_view.jsp?idx2=<%=idx2%>"> <%=title2 %></a></td>
                <td><%=name2 %></td>
                <td><%=time2 %></td>
                <td><%=hit2 %></td>
              </tr>
              <%
              }
                } catch(Exception e){
                }
              %>
                    
          </table>



          
         
          </div>
        </div>

        <div class="container">
        <h3>고객센터</h3>
          <div class="row">
            <table class="table" style="text-align: center; border: 1px solid #dddddd;">
              <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center; width: 50%;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                <th style="background-color: #eeeeee; text-align: center;">조회수</th>
              </tr>

              <%
    	          PreparedStatement stmt3;
		            try{
			              Class.forName("com.mysql.jdbc.Driver");
			              conn = DriverManager.getConnection(URL, USER, PASSWORD);
			              String sql = "select * from board where username='"+uid+"'" ;
			              stmt3 = conn.prepareStatement(sql);
			              ResultSet rs = stmt3.executeQuery();


                    while(rs.next()) {
                      int idx3 = rs.getInt(1);
                      String name3 = uid;
                      String title3 = rs.getString(4);
                      String time3 = rs.getString(6);
                      int hit3 = rs.getInt(7);
                      int indent3 = rs.getInt(9);
              %>
              <tr>
                <td><%=idx3 %></td>
                <td align="left">
                <% 
		
	for(int j=0;j<indent3;j++){
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(indent3!=0){
%>		<img class="reply" src='img/reply_icon.gif' />
<%
	}
%> 

                
                <a href="C_view.jsp?idx3=<%=idx3%>"> <%=title3 %></a></td>
                <td><%=name3 %></td>
                <td><%=time3 %></td>
                <td><%=hit3 %></td>
              </tr>
              <%
              }
                } catch(Exception e){
                }
              %>
                    
          </table>



          
         
          </div>
        </div>




        <div class="mypage-visit"></div>
      </div>

      <div class="column side"></div>
    </div>

    <div class="footer">
      <p>F팀 송민선, 허동윤</p>
    </div>
  </body>
</html>
