<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>목포 항구 버스킹</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"
    />
    <script
      src="https://kit.fontawesome.com/70cf0af2bf.js"
      crossorigin="anonymous"
      type="text/javascript"
      src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=535ut85h88"
    ></script>

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
        width: 12%;
        display: flex;
        height: 900px;
      }

      /* Middle column */
      .column.middle {
        width: 75%;
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

      .Content_Line {
        background-color: hsl(207, 86%, 85%);
        height: 5px;
      }

      .column.middle div {
        margin-bottom: 4px;
      }

      .pointer_box {
        box-sizing: border-box;
        bottom: 0;
      }

      .pointer_box__btn {
        justify-content: center;
        align-items: center;
      }

      .info-list li {
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
        <a href="mypage.jsp" style="float: right"><%=uid%> 님 환영합니다.</a>
      </div>
    </nav>

    <%
    }
    
    %>
    <div class="row">
        <div class="column side">
            <nav class="pointer_box">
                <ul class="pointer_box__btn">
                  <a href="POST5.jsp" class="pointer_box__pointer">
                    <i class="far fa-hand-point-left fa-10x"></i>
                  </a>
                </ul>
            </nav></div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">목포 항구 버스킹</div>
          <div class="post-info">
            <div class="post-info__date"> 2021.11.05 ~ 2021.11.14 </div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
                버스킹
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/slide6.png" alt="목포세계한마당페스티벌" style="width:700px; height:800px;"/>
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">
                버스킹(거리공연 – street performance) – 길거리에서 행해지는 공연, 개인 혹은 그룹이 공공장소에서 돈을 벌기 위해 노래, 춤, 마술, 연주, 예술의 모든 행위 등의 공연을 하는 것을 뜻한다.
이 단어의 근원은 스페인의 어원인 '버스커'이며 '헤매다', '추구하다'의 의미를 지니고 있다.
이것은 버스커들이 일반적으로 버스킹을 통해 명성과 자신의(음악적 혹은 예술적) 운명을 찾아 헤매는 것에 닿아 있다.
              </div>
            </div>
          </div>

          <div class="post__main-info">
            <div id="map" style="width: 500px; height: 400px"><img src="img/map6.png" alt="지도" style="width: 500px; height: 400px"></div>
            <div class="post__main-info__column">
              <ul class="info-list">
                <li>장소 :근대역사관1관입구 1897개항문화거리광장 : 목포시 영산로29전길 3(2시), 
                    <br> 삼학도 목포항구포차 : 목포시 산정동 1454-26(5시) </li>
                <li>전화 :061-270-8991</li>
                <li>출연 : 12회, 60개 버스킹팀 (1회 공연 5팀 참여)</li>
                <li>내용 : 7080, 재즈, 가요, 팝 등이 어우러진 다양한 장르 공연</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="column side">
      </div>
    </div>

    <div class="footer">
      <p>F팀 송민선, 허동윤</p>
    </div>
  </body>
</html>