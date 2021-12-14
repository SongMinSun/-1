<%@ page contentType="text/html;charset=utf-8" %> <%@ page import="java.sql.*"
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>게시글 수정</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/board.css">
    <script language="javascript">
      

      function modifyCheck() {
        var form = document.modifyform;

   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }  
 		form.submit();
  } 




    </script>
    <style>
      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        font-family: HSGaeulSenggak20;
        background-color: #c8dff1;
      }
      @font-face {
        font-family: HSGaeulSenggak20;
        src: url(https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSGaeulSenggak20.woff);
      }
      a {
        text-decoration: none; /* 기본 밑줄을 제거합니다 */
        color: #81c3f8;
      }
      .header {
        background-color: #ffffff;
        padding: 20px;
        text-align: center;
        margin: auto;
        position: relative;
        height: 215px;
      }
      td {
            text-align: left !important;
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
      /* Middle column */
      .column_middle{
        float: left;
        margin-left: 150px;
        width: 100%;
        background-color: #c8dff1;
      }

      /* Clear floats after the columns */
      .row:after {
        content: "";
        display: table;
        clear: both;
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
        width: 400px;
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
        text-align: center;
      }

      li {
        margin-bottom: 20px;
      }

    </style>
    </head>
    <body>
        <% String userID = null; if(session.getAttribute("userID") != null){ userID
    = (String)session.getAttribute("userID"); } %>


    <%
    String title = "";
    String memo = "";
    int idx = Integer.parseInt(request.getParameter("idx"));

    String URL = "jdbc:mysql://localhost:3306/mytest";
    String USER = "root";
    String PASSWORD= "light1223!";
    
    Connection conn;
    Statement stmt;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
        stmt = conn.createStatement();
        String sql = "select title, memo from board2 where num=" + idx;
        ResultSet rs = stmt.executeQuery(sql);
        
        if(rs.next()){
          title = rs.getString(1);
          memo = rs.getString(2);
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch(Exception e) {
        out.println("<h2>DB 연결 실패</h2>");
        out.println(e.getMessage());
    }
%>
        <div class="header">
            <a href="board.html"><img src="logo3.png" class="img_logo" /></a>
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

        <div class="column_middle">
            <div id="wrap">
                <h2>게시글 수정</h2>
                <form name="modifyform" method="post" action="C_modify_ok.jsp?idx=<%=idx%>">
                    <table>
                        <tr>
                            <th>제목 *</th>
                            <td><input
                      type="text"
                      placeholder="글 제목"
                      name="title"
                      value="<%=title%>"
                    /></td>
                        </tr>
                        
                        <tr>
                            <th>내용</th>
                            <td><textarea cols="100" rows="30" name="memo" value="<%=memo%>"></textarea></td>
                        </tr>
                    </table>
                    <input class="write_btn" type="submit" value="수정" onclick="javascript:modifyCheck()">
                    <input class="write_btn" type="reset" value="다시작성하기">
                    <input class="write_btn" type="button" value="취소" onclick="javascript:history.back(-1)">
                </form>
            </div>
        </div>

      </div>
    </body>
</html>

        