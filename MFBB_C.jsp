<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MFBB, 목포 축제 게시판</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
        color: #81c3f8;
      }
      b{
        text-decoration: none; /* 기본 밑줄을 제거합니다 */
        color: white;
      }
      td, th {
        padding :8px;
        text-align:left;
        border-bottom : 1px solid #ddd;
      }

      table{
        width:100%;
        border-collapse: collapse;
        margin-left: 10px;
        font-style:normal;
        color:#adabab;
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
      .column_side {
        float: left;
        width: 15%;
        background-color: hsl(207, 86%, 85%);
      }

      /* Middle column */
      .column_middle {
        float: left;
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
        width: 400px;
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
        text-align: center;
      }

      li {
        margin-bottom: 20px;
      }
      .category {
        border-style: none;
        border-width: 1px;
        border-color: black;

        display: flex;
        height: 100vh;
        flex-direction: column;
      }

      .box1 {
        margin-left: 10px;
        margin-top: 10px;
        border-style: solid;
        border-width: 2px;
        padding: 16px 20px;
        border-color: hsl(207, 86%, 85%);
        height: 100;
        font-size: 30px;
        color: hsl(207, 86%, 85%);
      }

      .category_btn1 {
        background-color: white;
        border: none;
        color: #81c3f8;
        padding: 16px 66px;
        text-align: center;
        font-size: 16px;
        margin: 4px 2px;
        opacity: 0.6;
        transition: 0.3s;
        display: inline-block;
        text-decoration: none;
        cursor: pointer;
      }
      .category_btn2 {
        background-color: white;
        border: none;
        color: #81c3f8;
        padding: 16px 74px;
        text-align: center;
        font-size: 16px;
        margin: 4px 2px;
        opacity: 0.6;
        transition: 0.3s;
        display: inline-block;
        text-decoration: none;
        cursor: pointer;
      }
      .write_btn{
        background-color:#81c3f8;
        border:none;
        color:white;
        padding:16px 74px;
        text-align:center;
        font-size:15px;
        margin:4px 2px;
        display:inline-block;
        text-decoration:none;
        cursor:pointer;
        float: right;
      }
      .category_btn1:hover {
        opacity: 1;
      }

      .content_box {
        margin-left: 10px;
        margin-top: 10px;
        border-style: solid;
        border-width: 2px;
        padding: 16px 20px;
        border-color: hsl(207, 86%, 85%);
        height: 100;
      }

      .reply{
        height:15px;
        width:25px;
      }
    </style>
  </head>
  <body>
    <div class="header">
      <a href="MFBB_C.html"><img src="logo3.png" class="img_logo" /></a>
    </div>
    <%

    String uid = (String) session.getAttribute("uid");
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
        <a href="logout.html" style="float: right">로그아웃</a>
        <a href="mypage.html" style="float: right"><%=uid%> 님 환영합니다.</a>
      </div>
    </nav>

    <%
    }
    
    %>
    <div class="row">
      <div class="column_side">
        <h1 style="color: white">카테고리</h1>
        <div class="category">
          <a href="MFBB_C.jsp">
            <div class="category_btn1">지역축제 리뷰</div>
          </a>
          <a href="MFBB_CC.jsp">
            <div class="category_btn2">자유게시판</div>
          </a>
        </div>
      </div>

      <div class="column_middle">
        <div class="container">
          <div class="row">
            <table class="table" style="text-align: center; border: 1px solid #dddddd;">
              <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
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
			              String sql = "select num, username, title, time, hit, indent from board2 order by ref desc, step asc";
			              stmt = conn.prepareStatement(sql);
			              ResultSet rs = stmt.executeQuery();


                    while(rs.next()) {
                      int idx = rs.getInt(1);
                      String name = rs.getString(2);
                      String title = rs.getString(3);
                      String time = rs.getString(4);
                      int hit = rs.getInt(5);
                      int indent = rs.getInt(6);
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
                
                <a href="C_view.jsp?idx=<%=idx%>"> <%=title %></a></td>
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
<%
    if(session.getAttribute("uid")== null){

    %>
      
    <%
    } else {
    %>
    <div class="write_btn" OnClick="window.location='C_write.jsp'">
          <b >글쓰기</a>
          
          </div>

    <%
    }
    
    %>


          
         
          </div>
        </div>
      </div>
       

      <div class="column side"></div>
    </div>

<%
    
%>
      </div>
      
    </div>

    
    <div class="footer">
      <p>footer</p>
    </div>
  </body>
</html>