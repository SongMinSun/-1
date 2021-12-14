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
            <a href="famous5.jsp" class="pointer_box__pointer">
              <i class="far fa-hand-point-left fa-10x"></i>
            </a>
          </ul>
        </nav></div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">목포진</div>
          <div class="post-info">
            <div class="post-info__date"></div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
              목포 역사의 시작, 목포진
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/famous6.png" alt="목포항구축제" style="width:700px; height:800px;"/>
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">목포진은 조선시대 수군의 진영(鎭營)이며 목포영·목포대라고 불렀고 만호(萬戶)가 배치되었다고 해서 만호영·만호진·만호청이라 부르기도 했다. 지리상으로 볼 때 목포는 영산강 하구를 안고 있으며, 바다로 연결되는 지리적인 요충지에 위치하고 있으며, 호남과 경상남부지역으로 통하는 세곡 운반로로 사용되는 길목에 자리하고 있다. 그러한 이유로 목포는 조선초기부터 그 중요성이 부각되어 주목받게 되었다.

1439년 (세종21년) 처음 목포진의 설치가 재가 되었으며, 성의 모습이 갖추어 진것은 1502 (연산군 8년)으로 전해진다. 문헌비고에 의하면 당초 진성의 규모는 석축둘레 1,306척, 높이 7척 34촌이었으며, 우물과 못이 각 1개소씩 있었다고 한다. 그 후, 목포진은 한반도 서남해의 방어지역으로써 그 역할을 다 했으나 1895년 (고종 32년) 7월 15일 고종 칙령 제141호에 의해 폐진 되었다.

만호진이 설치된 정확한 연대는 세종 21년(1439년 4월 15일) 의정부가 무안 현의 목포는 왜적침입의 요해처이므로 만호를 파견하고 병선을 주둔토록 건의하여 세종의 재가를 받아 냈다. 이것이 목포만호진의 역사적인 출발점이다. 현재의 목포진 자리에 목포진성(城)이 처음으로 구축된 것은 연산군 8년 어간임이 밝혀지며 당시 중지 건의가 있었음에도 불구하고 지속되었음을 알 수 있다.

폐진 직후인 개항당시만 해도 청사의 일부가 남아있어 무안감리서, 일본영사관 또는 역국사관 기지로 사용 되다 훼손되어 목포진 유적비만이 남아있던 곳을 2014년 현재의 모습으로 일부 복원하였다. 일제 강점기에 사라졌던 군사기지가 120여년만에 역사공원으로 복원돼 역사 문화 관광자원으로 활용되고 있다.

목포는 수군진과 관련하여 5백여년이 넘는 긴 역사를 간직하고 있다. 목포진은 한반도 서남해 방어지로서 역사적 가치를 들 수 있고, 또한 이곳이 목포의 역사를 실증하는 최초의 장소라는 점에서 그 의의가 크다고 할 수 있다. 목포라는 지명이 옛 문헌상 등장하는 내용 중 지금의 목포와 지리적으로 일치하기 시작한때가 바로 목포진이 설치되는 시기이기 때문이다. 그런면에서 목포 역사의 출발을 알리는 중요한 의미를 가지고 있고, 또한 이곳에 수군진이 설치됨으로써 이후 개항 전까지 목포역사의 제1기라고 할 수 있는 약 5백여 년동안 적에게는 불리하고 아군에게는 유리한 군사 요해처로서의 기능을 수행하게 되는 성격을 목포에 부여시켜 주는 계기가 된 곳이기도 하다. 따라서 목포의 역사를 이해하기 위한 문화유적 답사를 한다면, 바로 이곳 목포진 역사공원 목포진터가 목포답사의 일번지가 되어아하는 것은 그런 의미 떄문이라고 할 수 있다.

목포진역사공원에서 바라보는 풍경은 목포 앞바다가 굽이지며 흐르는 영산강물이 목포 앞바다로 흐르고, 삼학도가 흘러가다 우뚝 멈춘 듯 바로 목포진 앞에 서있고 유달산 아래 작은 섬사이로 수없이 왕래하는 배들을 지켜보는 형세이다.
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
                  34.78528676528798, 126.38490229945766
                ),
                level: 3,
              };

              var map = new kakao.maps.Map(container, options);
            </script>
            <div class="post__main-info__column">
              <ul class="info-list">
                <li>주소 : 
목포진길11번길 1-5 (만호동) </li>
                <li>전화 : 
061-270-8291</li>
                <li>이용시간 : 0시~0시</li>
                <li>휴무일 :</li>
                <li>이용요금 : 무료</li>
                <li>주차시설 : 없음</li>
                <li>장애인시설 : 없음</li>
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
