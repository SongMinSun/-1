<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>목포 해상 w쇼</title>
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
                  <a href="POST3.jsp" class="pointer_box__pointer">
                    <i class="far fa-hand-point-left fa-10x"></i>
                  </a>
                </ul>
            </nav></div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">목포 해상 w쇼</div>
          <div class="post-info">
            <div class="post-info__date">2021-11.26 ~ 2021.11.28</div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
                WONDERFUL 목포
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/slide5.png" alt="목포세계한마당페스티벌" style="width:700px; height:800px;"/>
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">
                지난 2020년 대한민국 4대 관광 거점도시로 선정된 목포시는 근대 역사문화와 예술적 자원이 풍부한 레트로 퓨처, 로맨틱 관광도시로써 최근 가장 핫한 관광도시로 부각되고 있다.
                <br>
                목포시는 관광거점도시라는 가치자산을 활용하고 2024년 관광객 1,500만명을 목표로 더 새롭고, 더 흥미로운 관광콘텐츠를 지속적으로 발굴해나가고 있다.
                <br>
                목포의 대표적인 야간관광콘텐츠인 ‘목포 춤추는 바다분수’와 불꽃, 해상무대 퍼포먼스를 하나의 공연작품으로 선보일 ‘목포해상W쇼’는
                춤추는 바다분수와 불꽃이 연출되는 W 형태의 모양을 담아 목포의 노래, 사랑, 낭만, 감성 등 목포를 상징하는 다양한 키워드를 ‘원더풀 목포’라는 컨셉에 담아 펴쳐낼 ‘목포해상W쇼’는 세계최대 부유식 바다분수인 관광기네스 ‘목포 춤추는 바다분수’가 자리하고 있는 평황광장 앞 바다에 새롭게 조성된 해상무대를 중심으로 펼쳐진다.
                <br>
                멋과 맛의 도시 목포로의 여행길을 더욱 설레고 즐겁게 할 ‘목포해상W쇼’는 보는 이의 가슴에 감동으로 기억될, 목포와 사랑에 빠지게 만들 준비를 마치고 여러분을 기다리고 있다.
              </div>
            </div>
          </div>

          <div class="post__main-info">
            <div id="map" style="width: 500px; height: 400px">
              <div id="daumRoughmapContainer1638756869026" class="root_daum_roughmap root_daum_roughmap_landing"></div>
              <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
              <script charset="UTF-8">
                new daum.roughmap.Lander({
                  "timestamp" : "1638756869026",
                  "key" : "28bos",
                  "mapWidth" : "500",
                  "mapHeight" : "360"
                }).render();
              </script></div>
            


            <div class="post__main-info__column">
              <ul class="info-list">
                <li>주소 :목포시 미항로(상동) 115 목포 춤추는 바다분수 </li>
                <li>전화 : 061)284 - 8580</li>
                <li>FAX :  061)270-8584</li>
                <li>스마트폰을 통해서도 목포춤추는바다분수를 만날 수 있습니다.</li>
                <li>에너지절약과 교통난 해소를 위해 대중교통을 이용해 주시기 바랍니다.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="column side">
        <nav class="pointer_box">
          <ul class="pointer_box__btn">
            <a href="POST5.jsp".jsp" class="pointer_box__pointer">
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
