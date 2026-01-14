<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>May Planner</title>

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
}

.header .menu a {
  color: white;
  margin-left: 20px;
  text-decoration: none;
}

.header .menu a:hover {
  text-decoration: underline;
}

/* ====== 메인 영역 ====== */
.container {
  width: 1000px;
  margin: 30px auto;
}

/* ====== 달력 ====== */
.calendar {
  background: white;
  padding: 20px;
  border-radius: 10px;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.calendar-header h2 {
  margin: 0;
}

.calendar table {
  width: 100%;
  margin-top: 20px;
  border-collapse: collapse;
}

.calendar th,
.calendar td {
  width: 14.2%;
  height: 80px;
  border: 1px solid #ddd;
  text-align: right;
  padding: 8px;
  cursor: pointer;
}

.calendar th {
  background: #f0f0f0;
}

.calendar td:hover {
  background: #e3f2fd;
}

.calendar .today {
  background: #03a9f4;
  color: white;
}

/* ====== 일정 영역 ====== */
.todo-section {
  margin-top: 30px;
  background: white;
  padding: 20px;
  border-radius: 10px;
}

.todo-section h3 {
  margin-top: 0;
}

.todo-list {
  list-style: none;
  padding: 0;
}

.todo-list li {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
</style>
</head>

<body>

<!-- ===== 상단 메뉴 ===== -->
<div class="header">
  <div class="logo">May Planner</div>
  <div class="menu">
    <a href="#">Dashboard</a>
    <a href="#">To-Do</a>
    <a href="#">Calendar</a>
    <a href="logout.member">Logout</a>
  </div>
</div>

<!-- ===== 메인 컨텐츠 ===== -->
<div class="container">

  <!-- 달력 -->
  <div class="calendar">
    <div class="calendar-header">
      <button onclick="prevMonth()">◀</button>
      <h2 id="monthYear"></h2>
      <button onclick="nextMonth()">▶</button>
    </div>

    <table>
      <thead>
        <tr>
          <th>Sun</th>
          <th>Mon</th>
          <th>Tue</th>
          <th>Wed</th>
          <th>Thu</th>
          <th>Fri</th>
          <th>Sat</th>
        </tr>
      </thead>
      <tbody id="calendarBody"></tbody>
    </table>
  </div>

  <!-- 일정 (당일 일정 리스트(오늘 일정) 및 날짜 클릭시 일정(X월 X일 일정) 리스트 구분)-->
  <div class="todo-section">
    <h3 id="selectedDate">오늘 일정</h3>
    <ul class="todo-list" id="todoList">
      <li>✔ 프로젝트 기획 정리</li>
      <li>✔ 로그인 기능 점검</li>
      <li>✔ 일정 테이블 설계</li>
    </ul>
  </div>

</div>

<script>
let today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();

function renderCalendar() {
  const firstDay = new Date(currentYear, currentMonth, 1).getDay();
  const lastDate = new Date(currentYear, currentMonth + 1, 0).getDate();

  document.getElementById("monthYear").innerText =
    currentYear + "년 " + (currentMonth + 1) + "월";

  const tbody = document.getElementById("calendarBody");
  tbody.innerHTML = "";

  let row = document.createElement("tr");
  for (let i = 0; i < firstDay; i++) {
    row.appendChild(document.createElement("td"));
  }

  for (let day = 1; day <= lastDate; day++) {
    let cell = document.createElement("td");
    cell.innerText = day;

    if (
      day === today.getDate() &&
      currentMonth === today.getMonth() &&
      currentYear === today.getFullYear()
    ) {
      cell.classList.add("today");
    }

    cell.onclick = () => selectDate(day);
    row.appendChild(cell);

    if ((firstDay + day) % 7 === 0) {
      tbody.appendChild(row);
      row = document.createElement("tr");
    }
  }
  tbody.appendChild(row);
}
//◀클릭시 실행 함수
function prevMonth() {
  currentMonth--;
  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear--;
  }
  renderCalendar();
}
//▶클릭시 실행 함수
function nextMonth() {
  currentMonth++;
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  }
  renderCalendar();
}
//하단 일정 리스트 조회 부분 함수
function selectDate(day) {
  document.getElementById("selectedDate").innerText =
    currentYear + "년 " + (currentMonth + 1) + "월 " + day + "일 일정";

  // 나중에 Ajax로 일정 조회하면 여기서 교체
  document.getElementById("todoList").innerHTML =
    "<li>📌 선택한 날짜의 일정이 여기에 표시됩니다</li>";
}

renderCalendar();
</script>

</body>
</html>
