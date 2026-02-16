<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>May Planner</title>

<style>
.summary-cards {
  display: flex;
  gap: 20px;
  margin-bottom: 30px;
}

.card {
  flex: 1;
  background: white;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  box-shadow: 0 5px 15px rgba(0,0,0,0.05);
}

.big-number {
  font-size: 28px;
  font-weight: bold;
  color: #03a9f4;
}

.dashboard-layout {
  display: flex;
  gap: 30px;
  margin-bottom: 30px;
}

.dashboard-box {
  flex: 1;
  background: white;
  padding: 20px;
  border-radius: 10px;
}

.upcoming-list,
.category-list {
  list-style: none;
  padding: 0;
}

.category-list li {
  display: flex;
  justify-content: space-between;
  padding: 8px 0;
}

</style>
</head>
<body>

<div class="container">

  <!-- ===== 상단 요약 카드 ===== -->
  <div class="summary-cards">

    <div class="card">
      <h4>이번 달 일정</h4>
      <p class="big-number">24</p>
    </div>

    <div class="card">
      <h4>완료한 일정</h4>
      <p class="big-number">18</p>
    </div>

    <div class="card">
      <h4>완료율</h4>
      <p class="big-number">75%</p>
    </div>

    <div class="card">
      <h4>가장 많은 카테고리</h4>
      <p class="big-number">업무</p>
    </div>

  </div>


  <!-- ===== 통계 영역 ===== -->
  <div class="dashboard-layout">

    <!-- 카테고리 통계 -->
    <div class="dashboard-box">
      <h3>카테고리별 일정 통계</h3>
      <canvas id="categoryChart"></canvas>
    </div>

    <!-- 월별 일정 추이 -->
    <div class="dashboard-box">
      <h3>월별 일정 추이</h3>
      <canvas id="monthlyChart"></canvas>
    </div>

  </div>


  <!-- ===== 하단 영역 ===== -->
  <div class="dashboard-layout">

    <!-- 다가오는 일정 -->
    <div class="dashboard-box">
      <h3>다가오는 일정</h3>
      <ul class="upcoming-list">
        <li>D-1 프로젝트 마감</li>
        <li>D-3 병원 예약</li>
      </ul>
    </div>

    <!-- 카테고리 관리 -->
    <div class="dashboard-box">
      <h3>카테고리 관리</h3>
      <button>+ 카테고리 추가</button>
      <ul class="category-list">
        <li>업무 ✏️ 🗑</li>
        <li>개인 ✏️ 🗑</li>
      </ul>
    </div>

  </div>

</div>

</body>
</html>