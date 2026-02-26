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
  padding: 20px;
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

/*모달*/
.modal-content select {
  width: 100%;
  padding: 10px 12px;
  margin-bottom: 15px;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 14px;
  background: #fff;
}

.modal-content select:focus {
  border-color: #03a9f4;
  outline: none;
}

.modal {
  display: none;
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.4);
  z-index: 1000;
  align-items: center;
  justify-content: center;
}

.modal-content {
  background: #ffffff;
  width: 420px;
  padding: 25px 30px;
  border-radius: 12px;
  box-shadow: 0 20px 40px rgba(0,0,0,0.2);
}

.modal-content h3 {
  margin: 0 0 20px;
  font-size: 20px;
  text-align: center;
  color: #333;
}

.modal-btn {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.modal-btn button {
  padding: 8px 16px;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  border: none;
}

.modal-btn button:first-child {
  background: #03a9f4;
  color: white;
}

.modal-btn button:last-child {
  background: #e0e0e0;
}

.modal-content input[type="text"],
.modal-content textarea {
  width: 100%;
  padding: 10px 12px;
  margin-bottom: 15px;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 14px;
}

.modal-content textarea {
  resize: none;
  height: 80px;
}

.modal-content input:focus,
.modal-content textarea:focus {
  border-color: #03a9f4;
  outline: none;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.close {
  cursor: pointer;
  font-size: 18px;
  color: #999;
}

.close:hover {
  color: #333;
}

</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">

  <!-- ===== 상단 요약 카드 ===== -->
  <div class="summary-cards">

    <div class="card">
      <h4>이번 달 일정</h4>
      <p class="big-number" id="monthCount">0</p>
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
      <p class="big-number" id="categoryCount">없음</p>
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
      <ul class="upcoming-list" id="D_daySchedule">
        <li>D-1 프로젝트 마감</li>
        <li>D-3 병원 예약</li>
      </ul>
    </div>

    <!-- 카테고리 관리 -->
    <div class="dashboard-box">
      <h3>카테고리 관리</h3>
      <button onclick="addCategory()">+ 카테고리 추가</button>
      <ul class="category-list" id="categoryList"></ul>
    </div>

  </div>
  
  <!-- 모달 팝업 -->
<div id="categoryModal" class="modal">
  <div class="modal-content">

    <div class="modal-header">
      <h3>카테고리 추가</h3>
      <span class="close" onclick="closeModal()">✕</span>
    </div>

    <input type="text" id="categoryTitle" placeholder="카테고리명">

    <textarea id="categoryMemo" placeholder="메모"></textarea>

    <div class="modal-btn">
      <button id="saveBtn" onclick="saveCategory()">저장</button>
      <button id="updateBtn" onclick="updateCategory()" style="display:none;">수정</button>
  	  <button id="deleteBtn" onclick="deleteCategory()" style="display:none;">삭제</button>
    </div>

  </div>
</div>

</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
let now = new Date();
let currentMonth = now.getFullYear() + "-" + String(now.getMonth() + 1).padStart(2, '0');
let modalMode = "add";

$(function(){
	initDashBoard();
})

function initDashBoard(){
	selectMonthSc(currentMonth);
	//selectFinshSc();
	//selectFinshRate();
	selectCategorySc(currentMonth);
	selectCategoryType();
	selectDdaySc(now);
}
//이번달 일정개수
function selectMonthSc(currentMonth){
	$.ajax({
		url : "selectMonthSc.do",
		type : "get",
		data : {
			currentMonth : currentMonth
		},
		success : function(s){
			$("#monthCount").text(s);
		}
	})
}
//가장 많은 카테고리 개수
function selectCategorySc(currentMonth){
	$.ajax({
		url : "selectCategorySc.do",
		type : "get",
		data : {
			currentMonth : currentMonth
		},
		success : function(list){
			if(list.length == 0){
				$("#categoryCount").text("없음");
                return;
			}
			
			let names = list.map(function(item){
				return item.categoryName;
			});
			
			$("#categoryCount").text(names.join(","));
		}
	})
}

//카테고리 종류 조회
function selectCategoryType(){
	$.ajax({
		url : "selectCategoryType.do",
		type : "get",
		success : function(list){
			let html ="";
			if(!list || list.length == 0){
				html = "<li>등록된 카테고리가 없습니다.</li>";
			}else{
				for(let s of list){
					html += "<li>" + s.categoryName + "</li>"
				}
			}
			$("#categoryList").html(html);
		},
		error : function(){
			alert("카테고리 조회 실패");
		}
	});
}

//다가오는 일정D-day
function selectDdaySc(now){
	$.ajax({
		url : "selectDdaySc.do",
		type : "get",
		data : {
			currentDate : now
		},
		success : function(list){
			let html ="";
			if(!list || list.length == 0){
				html = "<li>다가오는 일정이 없습니다.</li>";
			}else{
				for(let s of list){
					html += "<li> D-"+ s.countDay + s.title +"</li>";
				}
			}
			$("#D_daySchedule").html(html);
		}
	})
}

//카테고리 추가 팝업
function addCategory(){
    modalMode = "add";
    
    $("#categoryTitle").prop("readonly", false);
    $("#categoryMemo").prop("readonly", false);

    $("#saveBtn").show();
    $("#updateBtn").hide();
    $("#deleteBtn").hide();

    $("#categoryTitle").val("");
    $("#categoryMemo").val("");

    $("#categoryModal").css("display","flex");
}
//팝업창 닫기
function closeModal() {
	  document.getElementById("categoryModal").style.display = "none";
}

function saveCategory(){
	const categoryName = $("#categoryTitle").val();
	const categoryMemo = $("#categoryMemo").val();
	
	$.ajax({
		url : "addCategory.do",
		data : {
			categoryName : categoryName,
			categoryMemo : categoryMemo
		},
		success : function(result){
			if(result.success){
				 alert("카테고리 등록되었습니다.");
				 closeModal();
				 selectCategoryType();
			 }else{
				 alert("등록 실패");
			 }
		},
		error : function(){
			alert("서버 오류 발생");
		}
	})
}


</script>

</body>
</html>