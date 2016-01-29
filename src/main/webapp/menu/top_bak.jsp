<%@ page contentType="text/html; charset=UTF-8" %>

<%
//프로젝트 경로 자동 생성, Context root 명 자동 추출
// /ws_web/notice_v2jq -> notice_v2jq
String root = request.getContextPath(); 
%>
<link type="text/css" href="menu.css" rel="stylesheet" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="menu.js"></script>
<script>
window.onload = function(){
  startTime();
}

function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}
</script>
<!-- 화면 상단 메뉴 --> 
  <br>
<%--  <center style="height: 350px;">
  <A href='<%=root %>/index.jsp'><IMG src='<%=root %>/menu/images/top_image.jpg' height='350px' style="width: 75%;margin-left: 20px;"></A>
 </center> --%>

   <DIV id="clock" style='font-size: 200px; font-family:inherit; text-align: center;'></DIV>
   <nav id="topMenu">
    <ul>
       <%
      if(session.getAttribute("act") == null){
      %>
      <li><a class='menuLink' href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a></li>
      <%
      }else{        
      %>
      <li><a class='menuLink' href='<%=root %>/admin1/logout_proc.jsp'>Logout</a></li>       
      <li><a class='menuLink' href='<%=root %>/admin1/list.jsp'>User</a></li>
      <%
      }
      %>
     <li><a class='menuLink' href='<%=root %>/notice/list.jsp'>Notice</a></li>
     <li><a class='menuLink' href='<%=root %>/jailbreak/list.jsp'>JailBreak</a></li>
     <li><a class='menuLink' href='<%=root %>/pds3/list.jsp'>Data</a></li>
     <li><a class='menuLink' href='<%=root %>/tweak/list.jsp'>Tweak</a></li>
     <li><a class='menuLink' href='<%=root %>/AppleNews/list.jsp'>Apple News</a></li>
     <li><a class='menuLink' href='<%=root %>/index.jsp'>Home</a></li>  
    </ul>  
   </nav>
