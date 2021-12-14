<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>목포항구축제</title>
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
        <div class="column side"></div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">목포항구축제</div>
          <div class="post-info">
            <div class="post-info__date">2021-10.14 ~ 2021.10.17</div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
                "낭만항구 목포에서! 파시 한 판!"
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/slide1.jpg" alt="목포항구축제" style="width:700px; height:800px;">
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">
                목포는 1897년 개항하여 교역,물류 교통의 중심지로서 과거 전국
                3대항, 6대도시의 영광을 누렸으며 현재에 이르러서도 서남해안의
                배후 중심도시로서 근대역사가 살아 숨쉬고 전국 각지의 해양문화가
                집약되어 있는 곳이다. 목포항구축제는 이러한 해양문화역사를
                바탕으로 잊혀져 가는 우리 고유의 해양문화를 보존함은 물론 전국에
                널리 알리고 더 나아가 축제를 통해 모두가 함께 즐기고 흥의 정취를
                나누는 것이다. 또 풍부한 수산물과 함께하는 파시 장터, 만선의
                기원을 담은 목포항 풍어제, 온 시민들과 함게 화합하고 나아가는
                풍어 길놀이 오채퍼레이드 등 풍요로운 목포항의 낭만을 가득 담은
                행사가 마련되어 찾아오는 관광객들로 하여금 잊지못할 즐거움과
                추억을 선사하는 가을축제다.
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
                  34.792209299509636, 126.37261507599504
                ),
                level: 3,
              };

              var map = new kakao.maps.Map(container, options);
            </script>
            <div class="post__main-info__column">
              <ul class="info-list">
                <li>찾아오시는 길 : 온라인 개최</li>
                <li>번호 : 061-270-8441</li>
                <li>주최 : 목포시</li>
                <li>이용요금 : 무료</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="column side">
        <nav class="pointer_box">
          <ul class="pointer_box__btn">
            <a href="POST2.jsp" class="pointer_box__pointer">
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