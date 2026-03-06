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

/* ====== 메인 영역 ====== */
.container {
  width: 90%;
  max-width: 1400px;
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
  height: 120px;
  border: 1px solid #ddd;
}

.dot {
  width: 6px;
  height: 6px;
  background: #ff4d4f;
  border-radius: 50%;
  margin-top: 4px;
}

/* 요일 */
.calendar th {
  background: #f0f0f0;
  text-align: center;   
  vertical-align: middle;
}

/* 날짜 */
.calendar td {
  text-align: left;     
  vertical-align: top;  
  padding: 8px;
  cursor: pointer;
  position: relative;
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
/* =====팝업창 영역====== */
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

/* ===== 2단 레이아웃 ===== */
.main-layout {
  display: flex;
  gap: 30px;
  align-items: flex-start;
}

.calendar {
  flex: 2;
}

.todo-section {
  flex: 1;
  margin-top: 0;   /* 🔥 기존 margin-top 제거 */
}

/* 일정 헤더 */
.todo-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.todo-header button {
  padding: 6px 12px;
  background: #03a9f4;
  border: none;
  color: white;
  border-radius: 6px;
  cursor: pointer;
  font-size: 13px;
}

.todo-header button:hover {
  background: #0288d1;
}

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

/* ===== 기간 영역 ===== */
.date-range {
  margin-bottom: 15px;
}

.date-label {
  display: block;
  font-size: 14px;
  margin-bottom: 6px;
  color: #333;
}

.date-inputs {
  display: flex;
  align-items: center;
  gap: 8px;
}

.date-inputs input[type="date"] {
  flex: 1;
  padding: 10px 12px;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 14px;
}

.date-inputs input[type="date"]:focus {
  border-color: #03a9f4;
  outline: none;
}

.date-separator {
  font-size: 14px;
  color: #666;
}

</style>
</head>

<body>
<jsp:include page="header.jsp" />

<!-- ===== 메인 컨텐츠 ===== -->
<div class="container">
	
<div class="main-layout">

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
  <div class="todo-header">
    <h3 id="selectedDate">오늘 일정</h3>
    <button onclick="addSchedule()">+ 일정 추가</button>
  </div>
  
    <ul class="todo-list" id="todoList">
		<!-- ajax으로 데이터 조회 -->
    </ul>
  </div>
</div>
</div>

<!-- 모달 팝업 -->
<div id="scheduleModal" class="modal">
  <div class="modal-content">

    <div class="modal-header">
      <h3>일정 등록</h3>
      <span class="close" onclick="closeModal()">✕</span>
    </div>

    <input type="hidden" id="scheduleDate">
    
    <!-- 카테고리 선택 -->
    <select id="categoryId" class="modal-select"></select>

    <input type="text" id="scheduleTitle" placeholder="일정 제목">
   
	 <!-- 기간 -->
	<div class="date-range">
	  <label class="date-label">기간 :</label>
	  <div class="date-inputs">
	    <input type="date" id="startDate">
	    <span class="date-separator">~</span>
	    <input type="date" id="endDate">
	  </div>
	</div>

    <textarea id="scheduleMemo" placeholder="메모"></textarea>

    <div class="modal-btn">
      <button id="saveBtn" onclick="saveSchedule()">저장</button>
      <button id="updateBtn" onclick="updateSchedule()" style="display:none;">수정</button>
  	  <button id="deleteBtn" onclick="deleteSchedule()" style="display:none;">삭제</button>
      <button id="closeBtn" onclick="closeModal()">취소</button>
    </div>

  </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
let today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();
let selectedDateGlobal = "";

let modalMode = "add";
let currentScheduleNo = null;

let scheduleDates = {};

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
    //cell.innerText = day;
    // yyyy-mm-dd 형식 맞추기
    let dateStr = currentYear + "-" +
                  String(currentMonth + 1).padStart(2, '0') + "-" +
                  String(day).padStart(2, '0');

    // 날짜 div
    let dateDiv = document.createElement("div");
    dateDiv.innerText = day;
    cell.appendChild(dateDiv);

    //일정 있는 날이면 dot 추가
    if (scheduleDates && scheduleDates[dateStr]) {
      let dot = document.createElement("div");
      dot.classList.add("dot");
      cell.appendChild(dot);
    }

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
  //renderCalendar();
  loadMonthSchedule();
}

//▶클릭시 실행 함수
function nextMonth() {
  currentMonth++;
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  }
  //renderCalendar();
  loadMonthSchedule();
}

function loadMonthSchedule(){
	const month = currentMonth + 1;
	
	$.ajax({
		url : "loadMonthSchedule.do",
		type : "get",
		data : {
			currentYear : currentYear,
			month : month
		},
		success : function(result){
			scheduleDates = {};
			
			for(var i = 0; i <result.length; i++){
				var start = new Date(result[i].startDate);
				var end;
				
				if(result[i].endDate){
					end = new Date(result[i].endDate);
				}else{
					end = start;
				}
				var current = new Date(start);
				
				while(current <= end){
					var dateStr = current.getFullYear() + "-" + String(current.getMonth()+1).padStart(2,'0') + "-" + 
						String(current.getDate()).padStart(2,'0')
					
					scheduleDates[dateStr] = true;
					current.setDate(current.getDate()+1);
				}
			}
			renderCalendar();
		}
	})
}

//일정 리스트 조회 부분 함수
function selectDate(day) {
	const selectedDate = currentYear + "-" + String(currentMonth + 1).padStart(2, "0") + "-" + String(day).padStart(2, "0");
   
	// 오늘 날짜 만들기
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth()+1).padStart(2,"0");
    const dd = String(today.getDate()).padStart(2,"0");
    const todayStr = yyyy + "-" + mm + "-" + dd;
	
    if (selectedDate === todayStr) {
        document.getElementById("selectedDate").innerText = "오늘 일정";
    } else {
        document.getElementById("selectedDate").innerText =
            currentYear + "년 " + (currentMonth + 1) + "월 " + day + "일 일정";
    }

    selectedDateGlobal = selectedDate;
    loadSchedule(selectedDate);
}

function setTodayDate(){
	const yyyy = today.getFullYear();
    const mm = String(today.getMonth()+1).padStart(2,"0");
    const dd = String(today.getDate()).padStart(2,"0");
    const todayStr = yyyy + "-" + mm + "-" + dd;

    selectedDateGlobal = todayStr;

    document.getElementById("selectedDate").innerText = "오늘 일정";
}

function setStartDateEndDate(){
    $("#startDate").on("change",function(){
    	const startValue = $(this).val();
    	const endInput = $("#endDate");
    	
    	if(!endInput.val() || endInput.val() < startValue){
    		endInput.val(startValue);
    	}
    	endInput.attr("min",startValue);
    })
}

function selectCategory(){
	
	$.ajax({
		url : "selectCategory.do" ,
		type : "get" ,
		success : function(list){
			let html = "<option value=''>카테고리 선택</option>";
			
			for(let c of list){
				html += "<option value='"+c.categoryNo+"'>" + c.categoryName + "</option>";
			}
			 $("#categoryId").html(html);
		}
	});
}

//모달 추기화
function initModal(mode = "add"){
	if(mode =="add"){
		// 공통 초기화
	    $("#scheduleTitle").val("").prop("readonly", false);
	    $("#scheduleMemo").val("").prop("readonly", false);
	    $("#categoryId").val("").prop("disabled", false);
	    $("#startDate").val("").prop("disabled", false);
	    $("#endDate").val("").prop("disabled", false);
	}else{
		$("#scheduleTitle").prop("readonly", false);
	    $("#scheduleMemo").prop("readonly", false);
	    $("#categoryId").prop("disabled", false);
	    $("#startDate").prop("disabled", false);
	    $("#endDate").prop("disabled", false);
	}

    $("#saveBtn").hide();
    $("#updateBtn").hide().text("수정");
    $("#deleteBtn").hide();
    $("#closeBtn").hide();

    switch(mode) {
        case "add":
            $("#saveBtn").show();
            $("#closeBtn").show();
            break;
        case "detail":
            $("#updateBtn").show().text("수정");
            $("#deleteBtn").show();
            $("#scheduleTitle").prop("readonly", true);
            $("#scheduleMemo").prop("readonly", true);
            $("#categoryId").prop("disabled", true);
            $("#startDate").prop("disabled", true);
            $("#endDate").prop("disabled", true);
            break;
        case "edit":
            $("#updateBtn").show().text("저장");
            $("#deleteBtn").show();
            break;
    }
}

//일정 추가 팝업
function addSchedule(){

    if (!selectedDateGlobal) {
        alert("날짜를 먼저 선택하세요.");
        return;
    }

    modalMode = "add";
    currentScheduleNo = null;
    initModal("add");
    
    $("#scheduleDate").val(selectedDateGlobal);
    $("#startDate").val(selectedDateGlobal);
    $("#endDate").val(selectedDateGlobal).attr("min", selectedDateGlobal);
    $("#scheduleModal").css("display","flex");
}

function openDetail(scheduleNo) {
    modalMode = "detail";
    currentScheduleNo = scheduleNo;
    initModal("detail");

    $.ajax({
        url: "DetailSchedule.do",
        type: "get",
        data: { scheduleNo: scheduleNo },
        success: function(s){
            $("#scheduleTitle").val(s.title);
            $("#scheduleMemo").val(s.content);
            $("#categoryId").val(s.categoryNo);
            $("#startDate").val(s.startDate);
            $("#endDate").val(s.endDate);
            
            $("#scheduleModal").css("display","flex");
        }
    });
}

function updateSchedule(){

    if(modalMode == "detail"){
        modalMode = "edit";
        initModal("edit");
        return;
    }

    if(modalMode == "edit"){

        $.ajax({
            url: "updateSchedule.do",
            type: "post",
            data:{
                scheduleNo: currentScheduleNo,
                title: $("#scheduleTitle").val(),
                content: $("#scheduleMemo").val(),
                categoryNo : $("#categoryId").val(),
                startDate : $("#startDate").val(),
                endDate : $("#endDate").val()
            },
            success:function(result){
                alert("수정 완료");
                modalMode = "add";
                closeModal();
                loadSchedule(selectedDateGlobal);
            }
        });
    }
}

function deleteSchedule(){

    if(!confirm("삭제하시겠습니까?")) return;

    $.ajax({
        url: "deleteSchedule.do",
        type: "post",
        data:{ scheduleNo: currentScheduleNo },
        success:function(result){
            alert("삭제 완료");
            closeModal();
            loadSchedule(selectedDateGlobal);
            loadMonthSchedule();
        }
    });
}

function saveSchedule(){
	
	 const date = $("#scheduleDate").val();
	 
	 $.ajax({
		 url : "saveSchedule.do",
		 type : "post",
		 data : {
			  startDate: $("#startDate").val(),
			  endDate : $("#endDate").val(),
		      title: $("#scheduleTitle").val(),
		      content: $("#scheduleMemo").val(),
		      categoryNo: $("#categoryId").val()
		 },
		 success:function(result){
			 if(result.success){
				 alert("일정이 등록되었습니다.");
				 closeModal();
				 loadSchedule(date);
				 loadMonthSchedule();
			 }else{
				 alert("등록 실패");
			 }
		 },
		 error : function(){
			 alert("서버 오류 발생")
		 }
	 });
}

function loadSchedule(date){
	console.log(date)
	$.ajax({
		url : "selectSchedule.do",
		type : "get",
		data:{
			startDate : date
		},
		success : function(list){
			console.log(list)
			let html = "";
			if(!list || list.length == 0){
				html = "<li>일정이 없습니다.</li>";
			}else{
				for(let s of list){
					html += "<li onclick='openDetail(" + s.scheduleNo+ ")'>📌" + s.title + "</li>";
				}
			}
			$("#todoList").html(html);
		},
		error : function(){
			alert("일정 조회 시패");
		}
	});
}

//팝업창 닫기
function closeModal() {
	$("#scheduleModal").css("display","none");
	$("#endDate").attr("min", "");
	modalMode = "add";       // 기본 모드로 초기화
}

//페이지 로드 시 오늘 날짜 자동 조회
$(document).ready(function(){
	
	//renderCalendar();
	loadMonthSchedule();
	selectCategory();
	setTodayDate();    
    loadSchedule(selectedDateGlobal);
    setStartDateEndDate();
    
});
</script>

</body>
</html>
