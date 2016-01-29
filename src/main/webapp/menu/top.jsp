<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="web.tool.*" %>
<%
//프로젝트 경로 자동 생성, Context root 명 자동 추출
// /ws_web/notice_v2jq -> notice_v2jq
String root = request.getContextPath(); 
%>
<link type="text/css" href="<%=root %>/menu/menu.css" rel="stylesheet" />
<script type="text/javascript" src="<%=root %>/menu/menu.js"></script>
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
<style type="text/css">
  * { margin:0;
      padding:0;
  }
  body { background:#171717; }
  div#menu {
      margin:0px auto;
      width:70%;
  }
  div#copyright {
      width:80%;
      margin:0 auto;
      font:11px 'Trebuchet MS';
      color:#969696;
      text-indent:30px;
      padding:40px 0 0 0;
  }
  div#copyright a { color:#9ba1ac; }
  div#copyright a:hover { color:#969696; }
</style>
<!-- 화면 상단 메뉴 --> 
  <br>
<%--  <center style="height: 350px;">
  <A href='<%=root %>/index.jsp'><IMG src='<%=root %>/menu/images/top_image.jpg' height='350px' style="width: 75%;margin-left: 20px;"></A>
 </center> --%>

<DIV id="clock" style='font-size: 200px; font-family:inherit; text-align: center; color: white;'></DIV>
<div id="menu">
    <ul class="menu">
        <li><a href="<%=root %>/index.jsp"><span>HOME</span></a></li>
        <%
        if(session.getAttribute("id") == null){
        %>
        <li><a href="<%=root %>/member/login.do"><span>LOGIN</span></a></li>
        <%
        }else{
        %>
        <li><a href="<%=root %>/member/logout.do"><span>${id} LOGOUT</span></a></li>
        <%
        }
        %>
        <li><a href="#" class="parent"><span>COMMUNITY</span></a>
            <ul>
                <li><a href="<%=root %>/AppleNews/list.jsp"><span>Apple News</span></a></li>
                <li><a href="<%=root %>/jailbreak/list.jsp"><span>Jailbreak</span></a></li>
                <li><a href="<%=root %>/tweak/list.jsp"><span>Tweak</span></a></li>
                <li><a href="<%=root %>/pds3/list.jsp"><span>Data</span></a></li>
            </ul>
        </li>
        <li><a href="#" class="parent"><span>SW DEVELOPMENT</span></a>
            <ul>
                <li><a href="#"><span>Develop Source</span></a></li>
                <li><a href="#"><span>JAVA</span></a></li>
                <li><a href="#"><span>JSP</span></a></li>
                <li><a href="#"><span>UI/UX</span></a></li>
                <li><a href="#"><span>Spring</span></a></li>
                <li><a href="#"><span>Hybrid App</span></a></li>
            </ul>
        </li>
        <li><a href="#"><span>PROFILE</span></a></li>
        <%
        if(Tool.isAdmin(request) || Tool.isMaster(request)){
        %>
        <li class="last"><a href="<%=root%>/admin/logout_proc.jsp"><span>LOGOUT</span></a></li>
        <%
        }else{
        %>
        <li class="last"><a href="<%=root%>/admin/login_ck_form.jsp"><span>ADMIN</span></a></li>
        <%
        }
        %>
        
    </ul>
</div>
