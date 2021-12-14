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
            <a href="famous3.jsp" class="pointer_box__pointer">
              <i class="far fa-hand-point-left fa-10x"></i>
            </a>
          </ul>
        </nav></div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">춤추는 바다분수</div>
          <div class="post-info">
            <div class="post-info__date"></div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
              물과 음악과 그리고 빛의 예술 춤추는 바다분수
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/famous4.png" alt="목포항구축제" style="width:700px; height:800px;"/>
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">
                세계최초 초대형 부유식 음악분수로서 물과 빛, 음악의 하모니를 통한 아름다운 장관 연출한다.
수반길이 150m, 높이 13.5m, 최대 분사높이 70m인 춤추는 바다분수는 잔잔한 바다 위, 워터스크린에 펼쳐진 아름다운 사연이 감미로운 선율과 화려한 빛, 거대한 물줄기 춤에 맞춰 스토리가 있는 레이저쇼와 함께 매일 밤 웅장하고 환상적인 공연이 펼쳐지고 관람객과 함께 하는 사연소개, 프로포즈등 다양한 프로그램으로 관광객들에게 소중한 추억을 선사한다.


<br>
<br>
<h2><분수공연시간 안내></h2>
- 기간 : 4월~11월
<br>
- 공연시간
<br>
봄, 가을 (4~5월, 9~11월) : 일,화,수,목 - 20:00, 20:30 금, 토 - 20:00, 20:30, 21:00
<br>
여름(6월 ~ 8월) : 일,화,수,목 - 20:30, 21:00, 21:30 금,토 - 20:30, 21:00, 21:30
</div>
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/famous3_2.png" alt="목포항구축제" style="width:700px; height:800px;"/>
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
                  34.794802259565174, 126.43398361295034
                ),
                level: 3,
              };

              var map = new kakao.maps.Map(container, options);
            </script>
            <div class="post__main-info__column">
              <ul class="info-list">
                <li>주소 : 전라남도 목포시 평화로 64 </li>
                <li>전화 : 061-270-8580</li>
                <li>이용시간 : 내용페이지 표기</li>
                <li>휴무일 : 내용페이지 표기</li>
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
            <a href="famous5.jsp" class="pointer_box__pointer">
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
