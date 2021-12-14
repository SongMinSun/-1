<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MFBB, 목포 축제 게시판</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"
    />
    

    <link rel="stylesheet" href="css/styles.css" />
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
        justify-content: center;
        align-items: center;
        width: 15%;
        display: flex;
        height: 900px;
      }

      /* Middle column */
      .column.middle {
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

      header > nav {
        width: 100%;
        height: 10%;
        position: absolute;
        bottom: 0px;
      }

      .footer {
        padding: 10px;
        text-align: center;
      }

      .view-container {
        display: flex;
        flex-direction: column;
        padding: 20px;
        width: 100%;
      }

      .view-info {
        width: 100%;
      }
      .first {
        display: flex;
        width: 100%;
        justify-content: center;
      }

      .second {
        display: flex;
        width: 100%;
        justify-content: space-between;
        border-bottom: 3px solid #d3b5b5;
      }

      .view-id,
      .view-title {
        display: flex;
        border-bottom: 3px solid #d3b5b5;
      }

      .view-id {
        display: flex;
        flex: 1;
        margin-right: 10px;
      }

      .view-title {
        display: flex;
        flex: 8;
      }

      .view-title__TEXT {
        flex: 1;
      }
      .view-title__TITLE {
        flex: 9;
      }

      .view-id__TEXT {
        margin-right: 10px;
      }

      .view-content {
        margin-top: 50px;
        width: 100%;
        border-bottom: 3px solid #d3b5b5;
        border-top: 3px solid #d3b5b5;
        height: 70vh;
        padding-top: 25px;
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
    </style>
  </head>
  <body>
<%
    String url = "jdbc:mysql://localhost:3306/mytest";
    String user = "root";
    String password= "light1223!";
    Connection conn ;
    int idx = Integer.parseInt(request.getParameter("idx"));
    String name = null;
    try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, password);
      Statement stmt = conn.createStatement();

      String sql = "select username, title, memo, time, hit from board3 where num=" + idx;
      ResultSet rs = stmt.executeQuery(sql);
      if(rs.next()) {
        name = rs.getString(1);
        String title = rs.getString(2);
        String memo = rs.getString(3);
        String time = rs.getString(4);
        int hit = rs.getInt(5);
        hit++;
%>










    <div class="header">
      <a href="http://localhost:8080/MFBB.html"
        ><img src="logo3.png" class="img_logo"
      /></a>
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
      <div class="column side"></div>

      <div class="column middle">
        <div class="view-container">
          <div class="view-info">
            <div class="first">
              <div class="view-id">
                <div class="view-id__TEXT">글 번호</div>
                <div class="view-id__NUMBER"><%=idx%></div>
              </div>
              <div class="view-title">
                <div class="view-title__TEXT">글 제목</div>
                <div class="view-title__TITLE"><%=title%></div>
              </div>
            </div>
            <div class="second">
              <div class="view-date"><%=time%></div>
              <div class="view-author"><%=name%></div>
              <div class="view-hit"><%=hit%></div>
            </div>
          </div>
          <div class="view-content"><%=memo%></div>
        </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
<%

    if(uid.equals(name)){

    %>
      <input class="write_btn" type=button value="삭제" OnClick="window.location='CC_delete.jsp?idx=<%=idx%>'">
      <input class="write_btn" type=button value="수정" OnClick="window.location='CC_modify.jsp?idx=<%=idx%>'">
    <%
    } else {
    %>
    

    <%
    }
    
    %>
        

<input class="write_btn" type=button value="답글" OnClick="window.location='CC_reply.jsp?idx=<%=idx%>'">
          
        </div>
      </div>



<%
sql = "update board3 set hit=" + hit + " where NUM=" +idx;
stmt.executeUpdate(sql);
      }

   
    } catch(Exception e) {

    }

%>
      <div class="column side">
    </div>

    <div class="footer">
      <p>Footer</p>
    </div>
  </body>
</html>
