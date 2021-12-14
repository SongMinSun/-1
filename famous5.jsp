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
        <a href="mypage.html" style="float: right"><%=uid%> 님 환영합니다.</a>
      </div>
    </nav>

    <%
    }
    
    %>
    <div class="row">
      <div class="column side">
      <nav class="pointer_box">
          <ul class="pointer_box__btn">
            <a href="famous4.jsp" class="pointer_box__pointer">
              <i class="far fa-hand-point-left fa-10x"></i>
            </a>
          </ul>
        </nav>
        </div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">노적봉</div>
          <div class="post-info">
            <div class="post-info__date"></div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
             <작지만 정복되지 않는 유달산 노적봉>
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/famous5.png" alt="목포항구축제" style="width:700px; height:800px;"/>
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">
                노적봉(露積峯)은 해발 60m의 바위산에 불과하지만 왜적을 물리친 이순신 장군의 호국혼이 담겨있다.

정유재란 때 12척의 배로 불가능해 보였던 명량대첩을 승리로 이끌고 전열을 재정비 하는 동안 조선의 군사와 군량미는 턱없이 부족하여 바로 왜적이 쳐들어온다면 함락 될 수밖에 없는 위기에 놓여 있었다. 이때의 노적봉은 아주 큰 역할을 하였다. 유달산 앞바다에 왜적의 배가 진을 치고 조선군의 정세를 살피고 있을 때 이순신 장군은 노적봉을 이용하여 위장전술을 펼쳤다. 노적봉 바위를 이엉(볏짚)으로 덮어 마치 군량미가 산처럼 많이 보이게 하고 새벽에 바닷물에 백토를 풀어 밥 짓는 쌀뜨물처럼 보이게 하여 왜군들이 군사가 많은 줄 알고 스스로 물러나게 하였다. 이러한 일이 있는 후로 이 봉우리를 노적봉이라 부르게 되었다.
</div>
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/famous5_2.png" alt="목포항구축제" style="width:700px; height:800px;"/>
              </div>
            </div>
          </div>

          <div class="post__main-info">
            <div id="map" style="width: 500px; height: 400px"></div>
            <script
              type="text/javascript"
              src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2e0c016f4fdc6f3475eedf7c9ce83a"
            ></script>
            <script>
              var container = document.getElementById("map");
              var options = {
                center: new kakao.maps.LatLng(
                  34.7892197975285, 126.38100689403373
                ),
                level: 3,
              };

              var map = new kakao.maps.Map(container, options);
            </script>
            <div class="post__main-info__column">
              <ul class="info-list">
                <li>주소 : 노적봉길 45 (측후동) </li>
                <li>전화 : 정보없음</li>
                <li>이용시간 : 0시~0시</li>
                <li>휴무일 : 연중무휴</li>
                <li>이용요금 : 무료</li>
                <li>주차시설 : 없음</li>
                <li>장애인시설 : 없음</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="column side">
        <nav class="pointer_box">
          <ul class="pointer_box__btn">
            <a href="famous6.jsp" class="pointer_box__pointer">
              <i class="far fa-hand-point-right fa-10x"></i>
            </a>
          </ul>
        </nav>
      </div>
    </div>

    <div class="footer">
      <p>F팀 송민선, 허동윤</p>
    </div>
  </body>
</html>
