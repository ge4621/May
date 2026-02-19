<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/* ====== 공통 ====== */
* {
  box-sizing: border-box;
  font-family: 'Arial', sans-serif;
}

body {
  margin: 0;
  background: #f4f6f8;
}

/* ====== 상단 메뉴바 ====== */
.header {
  height: 60px;
  background: #333;
  color: white;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 30px;
}

.header .logo {
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
}

.header .menu a {
  color: white;
  margin-left: 20px;
  text-decoration: none;
}

.header .menu a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
<!-- ===== 상단 메뉴 ===== -->
<div class="header">
  <div class="logo" onclick="location.href='/may/main'">May Planner</div>
  <div class="menu">
    <a href="dashBoard">Dashboard</a>
    <a href="#">To-Do</a>
    <a href="#">Calendar</a>
    <a href="logout.member">Logout</a>
  </div>
</div>

</body>
</html>