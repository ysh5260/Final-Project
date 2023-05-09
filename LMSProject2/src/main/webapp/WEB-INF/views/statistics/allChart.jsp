<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 페이지 타이틀 -->
<div class="page-titles">
    <ol class="breadcrumb">
    <li><h5 class="bc-title">통계</h5></li>
    <li class="breadcrumb-item"><a href="javascript:void(0)">
        <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        총지표 </a>
    </li>
    <li class="breadcrumb-item active"><a href="javascript:void(0)">총 지표 확인</a></li>
</ol>
</div>
<div class="container-fluid">

<!-- 총 지표 확인 -->
<!-- 첫 번째 row 시작-->
<div class="row">
    <!-- col 시작 1-->
    <div class="col-md-4">
        <div class="card" style="overflow:auto;">
            <div class="card-header" style="padding-bottom:10px;">
                <h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;인원통계</strong></h4>
            </div>
            <div class="card-body">
	            <div style="position:sticky;">
	                <div style="height: 300px; width: 300px;">
	                    <canvas id="myChart" style="height: 100%; width: 100%;"></canvas>
	                </div>
	            </div>
        	</div>
        </div>
    </div>
    <!-- col 끝 1 -->
    
    <!-- col 시작 2-->
    <div class="col-md-4">
        <div class="card" style="overflow:auto;">
            <div class="card-header" style="padding-bottom:10px;">
                <h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;취업현황</strong></h4>
            </div>
            <div class="card-body">
	            <canvas id="myChart2" style="height: 80%; width: 100%;"></canvas>
        	</div>
        </div>
    </div>
    <!-- col 끝 2 -->

    <!-- col 시작 3-->
    <div class="col-md-4">
        <div class="card" style="overflow:auto;">
            <div class="card-header" style="padding-bottom:10px;">
                <h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;학적상태 현황</strong></h4>
            </div>
            <div class="card-body">
            	<div style="height: 300px; width: 300px;">
	                <canvas id="myChart3" style="height: 100%; width: 100%;"></canvas>
	            </div>
            </div>
        </div>
    </div>
    <!-- col 끝 3 -->
</div>
<!-- 첫 번째 row 끝 -->

<!-- 두 번째 row -->
<div class="row">
    <!--col 시작4-->
    <div class="col-md-6">
        <div class="card" style="overflow:auto;">
            <div class="card-header" style="padding-bottom: 10px;">
                <h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;단과대 별 학생 수</strong></h4>
            </div>
            <div class="card-body">
             	<canvas id="chart"></canvas>
        	</div>
        </div>
    </div>
    <!-- col 끝4 -->
    
    <!-- col 시작 5 -->
    <div class="col-md-6">
	    <div class="card" style="overflow:auto;">
	        <div class="card-header" style="padding-bottom:10px;">
	            <h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;학교 만족도 조사 평균</strong></h4>
	        </div>
	        <div class="card-body" style="height: 300px;">
	            <canvas id="chart2"></canvas>
	        </div>
	    </div>
	</div>
    
    <!-- col 끝 5-->
    
</div>
<!-- 두 번째 row 끝-->





<!-- 총지표 확인 -->


</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<script>

// 1. 인원 통계 그래프
//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('myChart').getContext('2d');
// 차트를 생성한다. 
var myChart = new Chart(chartArea, {
    // ①차트의 종류(String)
    type: 'bar',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['학생', '교수', '교직원'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '인원 수',
            // ⑥dataset값(Array)
            data: [${userOfNum.stuNum}, ${userOfNum.proNum}, ${userOfNum.empNum}],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)'
            ],
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            'rgb(255, 205, 86)'
            ],
            // ⑨dataset의 선 두께(Number)
            borderWidth: 1
        }]
    },
    // ⑩차트의 설정(Object)
    options: {
        // ⑪축에 관한 설정(Object)
        animation: {
                duration: 3000,
        },
        scales: {
            y: {
                beginAtZero: true,
            }
        },
    }
    
});

///////////////////////////////////////////////////////////////
// 2. 도넛 chart
//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea2 = document.getElementById('myChart2').getContext('2d');
// 차트를 생성한다. 
var myChart2 = new Chart(chartArea2, {
    // ①차트의 종류(String)
    type: 'doughnut',
    // ②차트의 데이터(Object)
    data: {
        labels: ['취업', '미취업'],
        datasets: [{
            label: '인원 수',
            data: [100, 50],
            backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)'
            ],
            // ⑨dataset의 선 두께(Number)
            borderWidth: 1,
        }]
    },
    options: {
        animation: {
                    duration: 2000, // 애니메이션 지속 시간 (2초)
                    easing: 'easeOutQuart', // 이징 함수
                    animateRotate: true, // 차트 회전 애니메이션 적용 여부
                    animateScale: true // 차트 크기 변화 애니메이션 적용 여부
                },
                maintainAspectRatio: false,
                responsive: true
    }
});
//////////////////////////////////////////////////////////////////
// 3. 학적상태 현황
var chartArea3 = document.getElementById('myChart3');
var myChart3 = new Chart(chartArea3, {
    type: 'bar',
    data: {
        labels: ['재학생', '휴학생'],
        datasets: [{
            label: '인원 수',
            data: [${stuStatusOfNum.attending}, ${stuStatusOfNum.dropping}],
            backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            ],
            borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        animation: {
                duration: 3000,
        },
        scales: {
            y: {
                beginAtZero: true,
            }
        },
    }
    
});



/////////////////////////////////////////////////////////////////
// 4.단과대별 학생 수
var ctx = document.getElementById('chart').getContext('2d');
const data = {
     labels: [
         '사범대학',
         '인문대학',
         '경상대학',
         '생활과학대학',
         '공과대학'
     ],
     datasets: [{
         type: 'bar',
         label: '학생 수',
         data: [${collOfStuNum.eduNum}, ${collOfStuNum.humNum}, ${collOfStuNum.gyeNum}, ${collOfStuNum.sciNum}, ${collOfStuNum.engNum}],
         borderColor: 'rgb(255, 99, 132)',
         backgroundColor: 'rgba(255, 99, 132, 0.2)'
     }, {
         type: 'line',
         label: '자퇴율',
         data: [30, 50, 40, 30, 20],
         fill: false,
         borderColor: 'rgb(54, 162, 235)'
     }]
 };
 const mixedChart = new Chart(ctx, {
     type: 'bar',
     data: data,
     options: {
         animation: {
             duration: 2000 // 애니메이션 지속 시간 (2초)
         }
     }
 });  
//////////////////////////////////////////////////////////////////
// 5. 신입생/재학생/휴학생
var ctx2 = document.getElementById('chart2').getContext('2d');
const data2 = {
     labels: [
         '1월',
         '2월',
         '3월',
         '4월',
         '6월',
         '7월',
         '8월',
         '9월',
         '10월',
         '11월',
         '12월'
     ],
     datasets: [{
         type: 'line',
         label: '2023년',
         data: [500, 400, 450, 200, 600, 700, 800, 200, 450, 200, 600, 700],
         borderColor: 'rgb(255, 99, 132)',
         backgroundColor: 'rgba(255, 99, 132, 0.2)'
     }, {
         type: 'line',
         label: '2022년',
         data: [30, 50, 40, 30, 20, 30, 50, 40, 30, 20, 100, 200, 100],
         fill: false,
         borderColor: 'rgb(54, 162, 235)'
     }, {
         type: 'line',
         label: '2021년',
         data: [30, 20, 100, 200, 50, 150, 180, 200, 50, 120, 250, 100],
         fill: false,
         borderColor: 'rgb(54, 162, 235)'
     }]
 };
 const mixedChart2 = new Chart(ctx2, {
     type: 'line',
     data: data2,
     options: {
         animation: {
             duration: 2000 // 애니메이션 지속 시간 (2초)
         }
     }
 });  


</script>