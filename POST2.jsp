<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>전남국제수묵비엔날레</title>
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
      .pay_btn{
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
              <a href="POST.html" class="pointer_box__pointer">
                  <i class="far fa-hand-point-left fa-10x"></i>
              </a>
            </ul>
          </nav>
      </div>

    <div class="column middle">
      <div class="post">
        <div class="post-title">전남국제수묵비엔날레</div>
        <div class="post-info">
          <div class="post-info__date">2021-09.01 ~ 2021.10.31</div>
        </div>
        <div class="post-content">
          <div class="post-content__title">
            "「오채찬란 모노크롬」생동하는 수묵의 새로운 출발 "
          </div>
          <div class="post-content__column">
            <div class="post-content__imgBox">
              <img src="img/slide2.jpg" alt="전남국제수묵비엔날레" style="width:700px; height:800px;"/>
            </div>
          </div>
        </div>
        <br>
        <h2> 주 전시</h2>
        <br>
        <div class="post__main-info">
          <div id="map" style="width: 500px; height: 400px">
              <a href="https://map.naver.com/v5/search/%EB%AA%A9%ED%8F%AC%EB%AC%B8%ED%99%94%EC%98%88%EC%88%A0%ED%9A%8C%EA%B4%80/place/11639915?c=14072351.6158254,4135616.6901015,16,0,0,0,dh&placePath=%3Fentry%253Dbmp">
              <img src="img/post2-1.jpg"></a></div>
          <div class="post__main-info__column">
            <ul class="info-list">
              <h3>주제 : 수묵없는 수묵(無墨水墨), 수묵은 도처에 있다</h3>
              <li>큐레이터 : 고충환</li>
              <li>연출방향 : 현대수목</li>
              <li>참여작가 : 73명</li>
              <li>전시방향 - 수묵의 재료적 한계를 초월한 국내·외 현대작품 전시</li>
              <li> 코로나19로 인하여 비엔날레 1관(목포문화예술회관)은 사전예약제로 운영됩니다.
              </li>
              <li>위치 : 목포시 남농로 102(사진을 누르면 해당 위치의 네이버지도로 이동)</li>
              <li>규모 : 3층, 8개 전시실</li>
            </ul>
          </div>
        </div>
        <div class="post__main-info">
          <div id="map" style="width: 500px; height: 400px">
              <a href="https://map.naver.com/v5/search/%EB%85%B8%EC%A0%81%EB%B4%89%EC%98%88%EC%88%A0%EA%B3%B5%EC%9B%90%EB%AF%B8%EC%88%A0%EA%B4%80/place/1780265763?c=14068642.0496420,4135073.6822949,17,0,0,0,dh&placePath=%3Fentry%253Dbmp">
              <img src="img/post2-2.jpg"></a></div>
          <div class="post__main-info__column">
            <ul class="info-list">
              <h3>주제 : 시대의 수묵- 경계의 확장</h3>
              <li>큐레이터 : 이지호</li>
              <li>연출방향 : 남도의 맥</li>
              <li>참여작가 : 25명</li>
              <li>전시방향 - 지역 현대수묵 작가 작품 중심으로 남도 미술의 정체성 확보</li>
              <li>위치 : 목포시 유달로 116(사진을 누르면 해당 위치의 네이버지도로 이동)</li>
              <li>규모 : 1층, 2개 전시실</li>
            </ul>
          </div>
        </div>
        <div class="post__main-info">
          <div id="map" style="width: 500px; height: 400px">
              <a href="https://map.naver.com/v5/search/%EC%9C%A0%EB%8B%AC%EC%B4%88%EB%93%B1%ED%95%99%EA%B5%90/place/12176912?c=14068430.7318526,4134819.2259304,19,0,0,0,dh&placePath=%3Fentry%253Dbmp">
              <img src="img/post2-3.jpg"></a></div>
          <div class="post__main-info__column">
            <ul class="info-list">
              <h3>주제 :  일즉다 다즉일(一卽多 多卽一) / 이율배반적 수묵의 최신버전</h3>
              <li>큐레이터 : 윤진섭, 윤동희</li>
              <li>연출방향 : 수묵정신, 신세대의 도원경</li>
              <li>참여작가 : 40명</li>
              <li>전시방향 - 수묵의 정신을 계승한 국내외 작품 및 신세대 동양화가의 실험적 수묵 작품 전시</li>
              <li>위치 : 목포시 영산로 10번길 10(사진을 누르면 해당 위치의 네이버지도로 이동)</li>
              <li>규모 : 2층, 5개 전시실</li>
            </ul>
          </div>
        </div>
        <div class="pay_btn" OnClick="window.location='pay.html'"> 입장권 확인 </div>
      </div>
    </div>

    <div class="column side">
      <nav class="pointer_box">
        <ul class="pointer_box__btn">
          <a href="POST3.jsp" class="pointer_box__pointer">
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
<table>
                 