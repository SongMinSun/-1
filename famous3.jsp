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
            <a href="famous2.jsp" class="pointer_box__pointer">
              <i class="far fa-hand-point-left fa-10x"></i>
            </a>
          </ul>
        </nav></div>

      <div class="column middle">
        <div class="post">
          <div class="post-title">갓바위</div>
          <div class="post-info">
            <div class="post-info__date"></div>
          </div>
          <div class="post-content">
            <div class="post-content__title">
              반사되는 노을 빛이 아름다운 목포의 관광 보물, 갓바위
            </div>
            <div class="post-content__column">
              <div class="post-content__imgBox">
                <img src="img/famous3_1.png" alt="목포항구축제" style="width:700px; height:800px;"/>
              </div>
            </div>
            <div class="post-content_cloumn">
              <div class="post-content__text">
                천연기념물 제500호로 지정된 갓바위는 두 사람이 나란히 삿갓을 쓰고 서 있는 모습의 바위로 약 8천만년전 화산재가 굳어진 용결응회암이다.
예전에는 배를 타고 나가야만 볼 수 있었던 갓바위를 해상에서 직접 조망할 수 있는 보행교를 바다위에 설치하여 더욱 가까이에서 볼 수 있다.

큰 갓의 형태를 하고 있는 입암산 바위에 석양의 마지막 빛을 바위에 쏟는 정경으로 슬픈 전설의 중바위와 그 뒤를 포근히 감싸고 있는 입암산 그리고 영산강의 풍경이 한데 어우러져 아름다운 노을빛을 연출한다.
독특한 형태가 형성된 이유는 해수와 담수가 만나는 곳에 위치하여 암석 표면에 파도가 치거나 안개가 끼면 염분을 함유한 물에 젖었다가 마르기를 수없이 되풀이 하고 수분에 녹아있던 실리카성분이 침전 되면서 용해된 부분은 조직이 이완되고 강도가 낮아져 모자모양의 경질부와 아래쪽이 움푹 패인 벌집 모양의 풍화혈이 형성되었다. 또한 삿갓이 동남쪽을 향한 것은 햇볕의 영향을 받기 때문이라고 한다.

갓바위는 인위적인 요인이 배제된 자연이 만들어낸 조각품으로 다른 지역 풍화혈에서는 찾아보기 힘든 희귀성을 가지고 있어 흥미롭고 아름다운 자연학습장이다.

한 쌍의 바위에는 몇 가지 전설이 전해 내려온다. 아주 먼 옛날에 병든 아버지를 모시고 소금을 팔아 살아가는 젊은이가 있었는데 살림살이는 궁핍하였지만, 아버지를 위해서는 어떠한 일도 마다하지 않는 착한 청년이었다.
아버지의 병환을 치료하기 위해 부잣집에 머슴살이로 들어가 열심히 일했으나 주인이 품삯을 주지 않아 한 달 만에 집에 돌아와 보니 아버지의 손과 발은 이미 식어 있었다. 젊은이는 한 달 동안이나 병간호를 못한 어리석음을 한탄하며, 저승에서나마 편히 쉴 수 있도록 양지바른 곳에 모시려다 그만 실수로 관을 바다 속으로 빠뜨리고 말았다.
불효를 통회하며 하늘을 바라 볼 수 없다며 갓을 쓰고 자리를 지키다가 죽었는데, 훗날 이곳에 두개의 바위가 솟아올라 사람들은 큰 바위를 아버지바위라 하고 작은 바위를 아들바위라고 불렀다고 한다. 또 한가지는 부처님과 아라한(번뇌를 끊고 세상의 이치를 깨달은 성자) 이 영산강을 건너 이 곳을 지날 때 잠시 쉬던 자리에 쓰고 있던 삿갓을 놓고 간 것이 바위가 되어 이를 중바위(스님바위)라 부른다는 이야기가 전해온다.</div>
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
                  34.78678152596995, 126.35523432829363
                ),
                level: 3,
              };

              var map = new kakao.maps.Map(container, options);
            </script>
            <div class="post__main-info__column">
              <ul class="info-list">
                <li>주소 : 고하대로597번길 73 (죽교동) </li>
                <li>전화 : 정보없음</li>
                <li>이용시간 : 0시~0시</li>
                <li>휴무일 : </li>
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
            <a href="famous4.jsp" class="pointer_box__pointer">
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
