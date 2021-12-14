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
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 15%;
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
        background-color: hsl(207, 86%, 85%);
        padding: 10px;
        text-align: left;
      }

      .align {
        margin: 10px;
        margin-top: 20px;
      }

      .view div {
        display: flex;
        justify-content: space-between;
      }

      .view_com {
        width: 45%;
        height: 300px;
        margin: 5px 20px;
        border: none;
        border-radius: 10px;
        padding: 10px;
        border-color: rgb(0, 0, 0, 0.4);
        background-color: whitesmoke;
        box-shadow: 0px 2px 13px 0px #000000;
      }

      .view_com__Img {
        background-color: rgb(166, 194, 185);
        height: 80%;
        overflow: hidden;
        margin: 0 auto;
        border-bottom: 1px solid;
        border-color: rgb(0, 0, 0, 0.3);
      }

      .view_com__Img_img {
        width: 100%;
        height: 100%;
        object-fit: fill;
      }

      .view_com__Title {
        background-color: whitesmoke;
        align-items: center;
        margin-top: 10px;
        height: 10%;
      }

      .side_com {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
      }
      .side_com__content {
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 150px;
        height: 100px;

        border-radius: 50px;
        margin: 20px;
        font-size: 20px;
        color: white;
        padding: 25px;
        background-color: hsl(207, 45%, 72%);
      }

      li {
        margin-bottom: 20px;
      }
    </style>
  </head>
  <body>
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
      <div class="column side">
        <h1>카테고리</h1>
        <div class="side_com">
          <div class="side_com__content">
            <a href = "MFBB.jsp" style="color:white;">축제/행사</a>
          </div>
          <div class="side_com__content">
            <a href ="MFBB2.jsp" style="color: white;">관광명소</a>
          </div>
        </div>
      </div>

      <div class="column middle">
        <div class="view">
          <div class="align">
            <span class="view_com"
              ><a href="famous1.jsp"
                ><div class="view_com__Img">
                  <img src="img/famous1.png" alt="" class="view_com__Img_img" />
                </div>
                <div class="view_com__Title">유달산</div></a
              >
            </span>

            <span class="view_com">
              <a href="famous2.jsp">
                <div class="view_com__Img">
                  <img src="img/famous2.png" alt="" class="view_com__Img_img" />
                </div>
                <div class="view_com__Title">목포대교</div></a
              >
            </span>
          </div>

          <div class="align">
            <span class="view_com">
              <a href="famous3.jsp">
                <div class="view_com__Img">
                  <img src="img/famous3_1.png" alt="" class="view_com__Img_img" />
                </div>
                <div class="view_com__Title">갓바위</div>
              </a>
            </span>

            <span class="view_com">
              <div class="view_com__Img">
              <a href="famous4.jsp">
                <img src="img/famous4.png" alt="" class="view_com__Img_img" />
              </div>
              <div class="view_com__Title">춤추는 바다분수</div>
              </a>            
            </span>
          </div>

          <div class="align">
            <span class="view_com">
            <a href="famous5.jsp">
            <div class="view_com__Img">
                <img src="img/famous5.png" alt="" class="view_com__Img_img" />
              </div>
              <div class="view_com__Title">노적봉</div>
            </a>
              
            </span>

            <span class="view_com">
            <a href="famous6.jsp">
              <div class="view_com__Img">
                <img src="img/famous6.png" alt="" class="view_com__Img_img" />
              </div>
              <div class="view_com__Title">목포진</div>
              </a>
            </span>
          </div>
        </div>
      </div>

      
    </div>

    <div class="footer">
      <p>F팀 송민선, 허동윤</p>
    </div>
  </body>
</html>
