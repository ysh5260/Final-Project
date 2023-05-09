<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.modal {
   position: fixed;
   z-index: 100;
}

#studyListTbl tr, #timeTbl tr {
   user-select: none;
}

#studyListTbl tr {
   cursor: pointer;
}

.nav-link {
   color:black;
}

.default-tab .nav-link.active {
   color:black;
   font-weight:800; 
   
}

.default-tab .nav-link i {
   color:#134aa9;
}

.fa-xmark {
   cursor: pointer;
}

</style>
<!-- ===================[fullCalendar 6.1.4 CDN]===================== -->
<!--  fullCalendar 6.1.4버전 CDN -->
<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<!-- fullCalendar 6.1.4버전 언어 설정 -->
<script src="/resources/fullcalendar/ko.global.min.js"></script>
<!-- ===================[fullCalendar 6.4.1 CDN]===================== -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script>/* 캘린더 스크립트 */
   (function () {
      $(function () {
         var studyCode = $('#studyCode').val();
         console.log(">>>", studyCode);
         let data = { "studyCode": studyCode };

         var request = $.ajax({
            url: "/calendar/list/",
            type: "post",
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data)

         });
         request.fail(function (jqXHR, textStatus) {
//             alert("오류발생!! : " + textStatus);
            Swal.fire({
               title : '오류 발생',
               html : textStatus,
               icon: 'error'
            })
         });

         request.done(function (data) {

            console.log("studyCode : ", data[0].groupId);

            $("input[name=studyCode]").val(data[0].groupId);

            var modalElement = document.getElementById('calendarModal')
            var modal = new bootstrap.Modal(modalElement);
            //룸코드..추가해보자
            var id = $("#calNo").val();
            var groupId = studyCode;
            console.log("studyCode>>>", studyCode);
            var title = $("#calendar_title"); //일정 제목
            var content = $("#calendar_content"); //일정 내용
            var barColor = $(".barColor"); // 색상

            var startTime = $("#startTime"); //시작시간
            var endTime = $("#endTime"); //종료시간
            var start = $("#calendar_start_date");
            var end = $("#calendar_start_date");

            var saveBtn = $("#addCalendar");
            var closeBtn = $("#closeBtn");
            var modalCloseBtn = $("#modalClose");
            var deleteBtn = $("#delCalendar");
            var flag = false;

            //saveBtn 시작//////////////////////////////////////////
            saveBtn.on("click", function () {
               console.log("flag == ", flag);
               var groupId = studyCode;
               console.log("studyCode : ", groupId);
               var title = $("#calendar_title");
               var content = $("#calendar_content");
               var barColor = $(".barColor");

               var startTime = $("#startTime");
               var endTime = $("#endTime");
               var allDay = $("#allDay");
               var start = $("#calendar_start_date");
               var end = $("#calendar_end_date");

               var saveBtn = $("#addCalendar");
               var closeBtn = $("#closeBtn");
               var modalCloseBtn = $("#modalClose");
               var deleteBtn = $("#delCalendar");

               //일정등록
               if (flag == true) {
                  titleInput = title.val();
                  contentInput = content.val();
                  console.log("allDay체크 ::", allDay.val());

                  startTimeInput = startTime.val();
                  endTimeInput = endTime.val();
                  //스윗알러트로 바꾸기
                  //alert("startTimeInput : " + startTimeInput + ", endTimeInput : " + endTimeInput);

                  startInput = document.getElementById('calendar_start_date').value;
                  endInput = document.getElementById('calendar_end_date').value;

                  barColorInput = $('input[name=optradioCustom]:checked').data('value');//색추가

                  console.log("startInput : " + startInput);

                  console.log("title : " + titleInput + ", content : " + contentInput + "startDate : " + startInput);

                  // value="T" 체크박스설정임...입력값을 받아와서 디비에 저장
                  /*                   if(allDay.val() == 'T'){ //일정이 하루종일인 경우
                                                 $.ajax({
                                                      type : "POST",
                                                      url : "/calendar/register",
                                                      data :{
                                                          'title' : titleInput,
                                                          'content' : contentInput,
                                                          'startDate' : startInput + "T" + "00:00:00",
                                                          'endDate ' : startInput + "T" + "24:00:00"
                                                      },
                                                      success : function(res){
                                                          alert("일정이 추가되었습니다.");
                                                          location.reload();
                                                               if(title == null || title == ""){
                                                                   alert("일정의 제목을 입력하세요.");
                                                               }
                                                               if(content == null || content == ""){
                                                                   alert("일정의 제목을 입력하세요.");
                                                               }
                                                               if(new Date(endInput) - new Date(startInput) < 0){
                                                                   alert("종료일이 시작일보다 먼저입니다.")
                                                               }
                                                      }
                                                 });
                                             } */
                  $.ajax({
                     type: "POST",
                     url: "/calendar/register",
                     data: {
                        'studyCode': studyCode,
                        'scTitle': titleInput,
                        'scContent': contentInput,
                        'scSdate': startInput + "T" + startTimeInput,
                        'scEdate': endInput + "T" + endTimeInput,
                        'scBarColor': barColorInput // 색추가
                     },
                         success: function(res){
//                         alert("일정이 추가되었습니다.");
/*
                        Swal.fire(
                           '일정 등록',
                           '일정이 추가되었습니다!',
                           'success'
                        ).then((reuslt)=>{
                           location.href = "/study/detail/" + studyCode + "?active=2";
                        });
*/                        
                        //룸코드는 이런거 없어도 되지 않을까 강제로 넣는건데.....
                        if (title == null || title == "") {
//                            alert("일정의 제목을 입력하세요.");
                           Swal.fire(
                              '경고',
                              '등록할 일정 제목을 입력하세요!',
                              'warning'
                           )   
                        }
                        if (content == null || content == "") {
//                            alert("일정의 내용을 입력하세요");
                           Swal.fire(
                              '경고',
                              '등록할 일정 내용을 입력하세요!',
                              'warning'
                           )
                        }
                        if (new Date(endInput) - new Date(startInput) < 0) {
//                            alert("종료일이 시작일보다 먼저입니다.");
                           Swal.fire(
                              '경고',
                              '일정 종료일이 시작일보다 먼저입니다.',
                              'warning'
                           )
                        }
                     }
                  });
                  $("#calendar_content").val('');
                  $("#calendar_start_date").val('');
                  $("#calendar_end_date").val('');
                  $(".barColor").data('value', ''); //색추가
                  
                  Swal.fire(
                     '일정 등록',
                     '일정이 추가되었습니다!',
                     'success'
                  ).then((reuslt)=>{
                     modal.hide();
                     location.href = "/study/detail/" + studyCode + "?active=2";
                  });
                  //깜빡

               } else {
                  id = $("#calNo").val();
                  groupId = $("#studyCode").val();
                  title = $("#calendar_title").val();
                  content = $("#calendar_content").val();
                  startDate = $("#calendar_start_date").val();
                  endDate = $("#calendar_end_date").val();
                  startTime = $("#startTime").val();
                  endTime = $("#endTime").val();
                  barColor = $('input[name=optradioCustom]:checked').data('value'); //색추가

                  // console.log(">> 수정 : " + id + ", " + groupId + ", " + title + ", " + content + ", " + startDate + ", " + startTime);
                  console.log(">> 수정 : ", barColor);
                  var param = {
                     'scNo': id,
                     'studyCode': groupId,
                     'scTitle': title,
                     'scContent': content,
                     'scSdate': startDate + "T" + startTime,
                     'scEdate': endDate + "T" + endTime,
                     'scBarColor': barColor//색 추가함
                  }
                  $.ajax({
                     type: "post",
                     url: "/calendar/update",
                     data: param,
                     dataType: "json",
                     success: function (req) {
                        console.log(reg);
                     }
                  }); //ajax end
//                   alert("수정 완료");
                  Swal.fire(
                     '수정 완료',
                     '해당 일정이 수정되었습니다!',
                     'success'
                  ).then((result)=>{
                     modal.hide();
                     location.reload();
                  });
               }
            });
            //saveBtn끝///////////////////////////////////////

            //deleteBtn 시작/////////////////////////////////////
            deleteBtn.on("click", function () {
               id = $("#calNo").val();
               var param = {
                  'scNo': id,
               }
               /*
               if (confirm("삭제할꺼야?")) {
                  $.ajax({
                     type: "post",
                     url: "/calendar/remove",
                     data: param,
                     dataType: "json",
                     success: function (req) {
                        console.log("reg : " + req);
                     }
                  });
                  alert(title + "삭제되었어")
                  //  event.remove(); // 캘린더 화면에서 해당 일정 삭제
                  modal.hide();
                  location.reload();
               }   // if(confirm) end
               */
               Swal.fire({
                 title: '삭제 요청',
                 html : "해당 일정을 삭제하시겠습니까?",
                 icon: 'question',
                 showCancelButton: true,
                 confirmButtonText: 'Yes'
               }).then((result) => {
                 if (result.isConfirmed) {
                    $.ajax({
                        type: "post",
                        url: "/calendar/remove",
                        data: param,
                        dataType: "json",
                        success: function (req) {
                           console.log("reg : " + req);
                        }   
                      })
//                     alert(title + "삭제되었어")
                      Swal.fire({
                        title: '삭제 완료',
                        html : title + "이(가) 삭제되었습니다.",
                        icon: 'error'
                      }).then((result) => {
                         modal.hide();
                        location.reload();
                      });
                 } else {
                    Swal.fire(
                        '삭제 중단',
                        '삭제가 중단되었습니다!',
                        'error'
                    )
                 }
               });
            });
            //deleteBtn 끝////////////////////////////////////////


            //closeBtn 시작//////////////////////////////////////////

            // modal [x] 버튼
            closeBtn.on("click", function () {
               //modal 창 내용 초기화
               $("#studyCode").val('');
               $("#calendar_title").val('');
               $("#calendar_content").val('');
               $("#calendar_start_date").val('');
               $("#calendar_end_date").val('');
               $(".barColor").data('value', ''); //색깔
               calendar.unselect();
               console.log("x버튼 클릭")
               modal.hide();
            });
            //closeBtn 끝//////////////////////////////////////////

            //modalClose 시작/////////////////////////////////////
            //modal [취소] 버튼
            modalCloseBtn.on("click", function () {
               //modal 창 초기화
               $("#studyCode").val('');
               $("#calendar_title").val('');
               $("#calendar_content").val('');
               $("#calendar_start_date").val('');
               $("#calendar_end_date").val('');
               $(".barColor").data('value', ''); //색깔
               calendar.unselect();
               console.log("취소버튼 클릭");
               modal.hide();
            });
            ////modalClose 끝/////////////////////////////////////

            //log로 controller에서 넘어온 데이터 정보
            console.log("data가 잘 넘어오는지.." + JSON.stringify(data));
            var calendarElement = $('#calendar')[0];

            /////////////////////////////////////////////////
            // full-calendar 생성////////////////////////
            var calendar = new FullCalendar.Calendar(calendarElement, {
               //                   height:700px,
               //                   width:800px,
               expandRows: true, //높이 맞게 재설정
               //헤더에 표시할 툴바
               headerToolbar: {
                  left: 'prev,next,today',
                  center: 'title',
                  right: 'dayGridMonth, timeGridWeek, timeGridDay, listWeek'
               },
               initialView: 'dayGridMonth', // 초기 로드 화면
               navLinks: true, // 날짜 선택시 daysk week 캘린더로
               editable: true, //수정 가능 여부
               //                   dropable: true,
               //                   selectHelper: true,
               selectable: true, //달력 일자 드래그
               nowIndicator: true, //현재 시간 마크
               dayMaxEvents: true, //이벤트가 오버되면 높이 제한(+몇 개)
               locale: 'ko',      //한국어 설정

               //select 시작
               select: function (info) { //캘린더에서 드래그이벤트
                  flag = true;
                  console.log("info1 >>", info);
                  //이게 없으면 
                  $("#deleteCalendar").hide(); //'삭제' 버튼이 남아있는 것을 숨김
                  modal.show();

                  console.log("title : ", title);
                  //이부분이 if(title == null || title == ""){ 였음
                  //사실상 모양만 추가로 한다는 것임
                  if (flag = true) {
                     $("#addCalendar").text("추가");
                  }

                  $('#calendarModal').modal();
                  var saveBtn = $("#addCalendar");

                  $("#calendar_start_date").val(info.startStr); //startStr은 라이브러리에있는걸까
                  $("#calendar_end_date").val(info.endStr);

                  calendar.unselect() //일정 선택 취소 시 실행될 코드 작성
               },
               //select 끝
               //eventClick 시작
               eventClick: function (info) { //등록 일정 클릭했을때
                  console.log("info2 >>", info.event);
                  console.log(calendar.getEvents());//캘린더 안의 데이터 확인용
                  console.log("클릭이 많이 되는데 하나만 되어야해 >>>>", JSON.stringify(info.event.id));
                  //$("#calNo").val(info.event.extendedProps.no); 수정함
                  $("#calNo").val(info.event.id); //이렇게 쓰는게 아니고 원체없는 값이면 extendedProps를 꼭 써줘야해
                  console.log("아이디:", info.event.id);
                  //$("#studyCode").val(info.event.extendedProps.studyCode);
                  $("#studyCode").val(info.event.groupId);
                  //이부분이 머더라.. 아마 처음 셋팅 값인듯 
                  var startDate = info.event.startStr.split('T')[0];
                  var startTime = (info.event.startStr.split('T')[1]).split('+')[0];
                  var endDate = info.event.endStr.split('T')[0];
                  var endTime = (info.event.endStr.split('T')[1]).split('+')[0];



                  // split은 문자열을 인자로 주어진 문자열을 
                  // 기준으로 쪼개서 배열에 담는다.

                  title = info.event.title;
                  content = info.event.extendedProps.content;
                  deleteBtn = $("#delCalendar");
                  if (title != null || title != '') {
                     /* 추가였지만 등록된걸 누르면 수정 */

                     $("#addCalendar").text('수정');
                     deleteBtn.css("display", "inline");
                     //                         $("#deleteCalendar").attr("style","display:inline");
                  }
                  //검색검색
                  modal.show();
                  $('#calendarModal').modal();
                  $('#studyCode').val(groupId);
                  $("#calendar_title").val(title);
                  $("#calendar_content").val(content);
                  //startDate와 endDate는 시간날짜 합친거라고 하기에는...애매한데.. 
                  $("#calendar_start_date").val(startDate);
                  $("#calendar_end_date").val(endDate);
                  $("#startTime").val(startTime);
                  $("#endTime").val(endTime);
                  $(".barColor").val(barColor)//색깔

               },
               //이벤트 부분에 데이터가 아무것도 없으니깐 아무것도 안떴지..죽자
               //비동기라 따로노는 부분임
               events: data
               //                      [
               //                       {
               //                          title: 'All Day Event',
               //                          start: '2023-04-06',
               //                       },
               //                       {
               //                          title: 'All Day Event',
               //                          start: '2023-04-07',
               //                      }
               //                   ]
            });
            // full-calendar 생성 끝///////////
            // 캘린더 랜더링
            calendar.render();
         });
      });
   })();


</script>
<!-- 페이지 타이틀 -->
<div class="page-titles">
   <ol class="breadcrumb">
      <li><h5 class="bc-title">스터디</h5></li>
      <li class="breadcrumb-item"><a href="#">
         <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" clip-rule="evenodd" d="M8.79222 13.9396C12.1738 13.9396 15.0641 14.452 15.0641 16.4989C15.0641 18.5458 12.1931 19.0729 8.79222 19.0729C5.40972 19.0729 2.52039 18.5651 2.52039 16.5172C2.52039 14.4694 5.39047 13.9396 8.79222 13.9396Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path fill-rule="evenodd" clip-rule="evenodd" d="M8.79223 11.0182C6.57206 11.0182 4.77173 9.21874 4.77173 6.99857C4.77173 4.7784 6.57206 2.97898 8.79223 2.97898C11.0115 2.97898 12.8118 4.7784 12.8118 6.99857C12.8201 9.21049 11.0326 11.0099 8.82064 11.0182H8.79223Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M15.1095 9.9748C16.5771 9.76855 17.7073 8.50905 17.7101 6.98464C17.7101 5.48222 16.6147 4.23555 15.1782 3.99997" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M17.0458 13.5045C18.4675 13.7163 19.4603 14.2149 19.4603 15.2416C19.4603 15.9483 18.9928 16.4067 18.2374 16.6936" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
         스터디룸 </a>
      </li>
      <li class="breadcrumb-item active"><a href="#">${studyName } </a></li>
   </ol>
</div>
<div class="container-fluid">

<!-- 표현하고자 하는 내용 넣기 -->
   <div class="row">
      <div class="card">
            <div class="card-header flex-wrap border-0" style="padding-bottom:10px;">
				<h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;${studyName }</strong></h4>
            </div>
   
            <div class="default-tab pt-4">
               <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item"><a
                     class="nav-link <c:if test="${active eq '1' }">active</c:if>"
                     data-bs-toggle="tab" href="#stuList">스터디원</a>
                  </li>
                  <li class="nav-item"><a
                     class="nav-link <c:if test="${active eq '2' }">active</c:if>"
                     data-bs-toggle="tab" href="#calendar1">그룹 일정</a></li>
                  <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
                     href="#timetable">시간표 비교</a></li>
               </ul>
               <!-- 스터디원 리스트 -->
               <div class="tab-content" style="padding-left: 10px;">
                  <div class="tab-pane fade <c:if test="${active eq '1' }">show active</c:if>"
                     id="stuList" role="tabpanel">
                     <div class="pt-5">
                        <div class="tab-pane fade show active" id="Preview"
                           role="tabpanel" aria-labelledby="home-tab">
                           <div class="card-body pt-0 ps-0" >
                              <div class="table-responsive">
                                 <table id="example" class="display table"
                                    style="min-width: 845px">
                                    <thead>
                                       <tr>
                                          <th>#</th>
                                          <th>학번</th>
                                          <th>학과</th>
                                          <th>이름</th>
                                          <th>분류</th>
                                       </tr>
                                    </thead>
                                    <tbody id="yujin">
                                       <c:set value="${studyVO }" var="studyList" />
                                       <c:choose>
                                          <c:when test="${empty studyList}">
                                             <tr>
                                                <td colspan="6" style="text-align: center;">참여중인 스터디원이 존재하지 않습니다.</td>
                                             </tr>
                                          </c:when>
                                          <c:otherwise>
                                             <c:forEach items="${studyVO }" var="study">
                                                <tr data-tr-id="${study.stuId}">
                                                   <td class="nRum">${study.rnum}</td>
                                                   <td>${study.stuId }</td>
                                                   <td>${study.deptName }</td>
                                                   <td>${study.stuNameKo}</td>
                                                   <c:choose>
                                                      <c:when test="${study.smLeader eq 'Y'}">
                                                         <td>스터디장</td>
                                                      </c:when>
                                                      <c:otherwise>
                                                         <td>스터디원</td>
                                                      </c:otherwise>
                                                   </c:choose>
                                                </tr>
                                             </c:forEach>
                                          </c:otherwise>
                                       </c:choose>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
   
                        <c:if test="${studyL.smLeader eq 'Y'}">
                           <div class="tab-content" id="myTabContent">
                              <div class="tab-pane fade show active" id="Preview"
                                 role="tabpanel" aria-labelledby="home-tab">
                                 <div class="card-body pt-0 ps-0">
                                    <div class="table-responsive">
                                       <table id="example" class="display table"
                                          style="min-width: 845px">
                                              <span class="badge badge-xl light badge-danger"><i class="bi bi-clock-history" style="font-size:27px;"></i>&nbsp;&nbsp;참여대기자</span>
                                          <thead>
                                             <tr>
                                                <th>학번</th>
                                                <th>학과</th>
                                                <th>이름</th>
                                                <th>신청일시</th>
                                                <th>지원동기</th>
                                                <th></th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:set value="${msgList }" var="msg" />
                                             <c:choose>
                                                <c:when test="${empty msg}">
                                                   <tr>
                                                      <td colspan="6" style="text-align: center;">참여 대기중인 내역이 존재하지 않습니다.</td>
                                                   </tr>
                                                </c:when>
                                                <c:otherwise>
                                                   <c:forEach items="${msgList}" var="msg">
                                                      <tr data-msg-id="${msg.msgDate}">
                                                         <td class="nStuId">${msg.msgSender}</td>
                                                         <td class="nStuAca">${msg.acaMajor}</td>
                                                         <td class="nStuNm">${msg.stuNameKo}</td>
                                                         <td>${msg.msgDate}</td>
                                                         <td>
                                                            <button type="button"
                                                               class="btn btn-primary btn-sm px-4 "
                                                               data-bs-container="body" data-bs-toggle="popover"
                                                               data-bs-placement="left"
                                                               data-bs-content="${msg.msgContent }"
                                                               data-bs-original-title="Popover in Left"
                                                               aria-describedby="popover373619">확인</button>
                                                         </td>
                                                         <td>
                                                            <button type="button"
                                                               class="btn tp-btn-light btn-info accept-btn"
                                                               data-stu-id="${msg.msgSender}"
                                                               data-study-code="${studyCode}" data-study-status="Y"
                                                               data-msg-content="${msg.msgContent}">수락</button>
                                                            <button type="button"
                                                               class="btn tp-btn-light btn-danger reject-btn"
                                                               data-stu-id="${msg.msgSender}"
                                                               data-study-code="${studyCode}" data-study-status="N"
                                                               data-msg-content="${msg.msgContent}">반려</button>
                                                         </td>
                                                      </tr>
                                                   </c:forEach>
                                                </c:otherwise>
                                             </c:choose>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                                 <div class="card-footer border-0"></div>
                              </div>
                           </div>
                        </c:if>
                     </div>
                  </div>
   
                  <!-- 스터디별 캘린더 -->
                  <div class="tab-pane fade <c:if test="${active eq '2' }">show active</c:if>"
                     id="calendar1">
                     <div class="pt-5">
                        <div class="tab-pane fade show active" id="Preview"
                           role="tabpanel" aria-labelledby="home-tab">
                           <div class="card-body pt-0 ps-0">
                              <div class="table-responsive">
                                 <!-- 모달창  시작 -->
                                 <div class="modal fade" id="calendarModal" tabindex="-1"
                                    role="dialog" aria-labelledby="exampleModalLabel"
                                    aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                       <div class="modal-content" id="modalBox"
                                          style="display: block;">
                                          <div class="modal-header">
                                             <span id="closeBtn" class="close" data-dismiss="modal"
                                                aria-label="Close"
                                                style="margin-left: 380px; display: inline;"><i class="fa-solid fa-xmark"></i></span>
                                             <h3 class="modal-title" id="exampleModalLabel"
                                                style="margin: 0">일정 등록</h3>
                                             <hr />
                                          </div>
                                          <div class="modal-body pt-0 pb-1">
                                             <!-- 여기가 아니라 위에다 studyCode.val()으로 직접 넣어줬음... -->
                                             <input type="hidden" id="studyCode" name="studyCode"
                                                value="${studyCode}">
                                             <!-- name의 행방이매우 궁금했었음. -->
                                             <!-- name이랑 VO 가 안이어져도 되는 이유는 controller에서 put으로 데이터를 넣는 작업을 해주었기 떄문에 안해도 되는것같음..   -->
                                             <input type="hidden" id="calNo" name="calNo" value=""><br />
   
                                             <div>
                                                <i class="fa-solid fa-check"></i> 일정 제목 <input type="text" class="form-control"
                                                   id="calendar_title" name="calendar_title">
                                             </div>
                                             <div class="pt-3">
                                                <i class="fa-solid fa-check"></i> 내용<br>
                                                <textarea class="form-control" id="calendar_content"
                                                   name="calendar_content" rows="10" cols="50"></textarea>
                                                <br>
                                             </div>
                                             <div class="row">
                                                <div class="col-sm-6">
                                                   <i class="fa-solid fa-check"></i><label for="calendar_start_date"> 시작 날짜</label> <input
                                                      type="date" class="form-control"
                                                      id="calendar_start_date" name="calendar_start_date">
                                                </div>
                                                <div class="col-sm-6">
                                                   <i class="fa-solid fa-check"></i><label for="startTime"> 시작 시간</label> <input type="time"
                                                      id="startTime" name="startTime" class="form-control">
                                                </div>
                                             </div>
                                             <div class="row pt-3">
                                                <div class="col-sm-6">
                                                   <i class="fa-solid fa-check"></i><label for="calendar_end_date"> 종료 날짜</label> <input
                                                      type="date" class="form-control" id="calendar_end_date"
                                                      name="calendar_end_date">
                                                </div>
                                                <div class="col-sm-6">
                                                   <i class="fa-solid fa-check"></i><label for="endTime"> 종료 시간</label> <input type="time"
                                                      id="endTime" name="endTime" class="form-control">
                                                </div>
                                             </div>
                                             <div class="pt-3">
                                                <i class="fa-solid fa-check"></i> 색깔 선택
                                                <div class="row pt-3" style="display: flex; flex-wrap: wrap; padding-left:15px;">
                                                   <div
                                                      class="form-check custom-checkbox mb-3 checkbox-danger"
                                                      style="flex-basis: 25%;">
                                                      <input type="radio" class="form-check-input barColor"
                                                         id="customRadioBox6" name="optradioCustom"
                                                         data-value="red"> <label
                                                         class="form-check-label" for="customRadioBox6">빨강</label>
                                                   </div>
                                                   <div
                                                      class="form-check custom-checkbox mb-3 checkbox-warning"
                                                      style="flex-basis: 25%;">
                                                      <input type="radio" class="form-check-input barColor"
                                                         id="customRadioBox5" name="optradioCustom"
                                                         data-value="orange"> <label
                                                         class="form-check-label" for="customRadioBox5">오렌지</label>
                                                   </div>
                                                   <div
                                                      class="form-check custom-checkbox mb-3 checkbox-info"
                                                      style="flex-basis: 25%;">
                                                      <input type="radio" class="form-check-input barColor"
                                                         id="customRadioBox3" name="optradioCustom"
                                                         data-value="blue"> <label
                                                         class="form-check-label" for="customRadioBox3">파랑</label>
                                                   </div>
                                                   <div
                                                      class="form-check custom-checkbox mb-3 checkbox-success"
                                                      style="flex-basis: 25%;">
                                                      <input type="radio" class="form-check-input barColor"
                                                         id="customRadioBox4" name="optradioCustom"
                                                         data-value="green"> <label
                                                         class="form-check-label" for="customRadioBox4">초록</label>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="modal-footer">
                                             <button type="button" class="추가 btn tp-btn-light btn-info"
                                                id="addCalendar">추가</button>
                                             <button type="button"
                                                class="딜리트 btn tp-btn-light btn-danger" id="delCalendar"
                                                style="display: none">삭제</button>
                                             <button type="button"
                                                class="취소 btn tp-btn-light btn-warning" id="modalClose"
                                                data-dismiss="modal">취소</button>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <!-- 모달창 끝 -->
   
                              <!-- 캘린더 -->
                              <div id='calendar-container'>
                                 <div id='calendar'></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- 시간표비교 -->
                  <div class="tab-pane fade" id="timetable">
                     <div class="pt-5">
                        <div class="tab-pane fade show active" id="Preview"
                           role="tabpanel" aria-labelledby="home-tab">
                           <div class="card-body pt-0 ps-0"> 
                              <div class="table-responsive">
                                 <div class="row">
                                    <div class="col-md-4">
                                       <div class="card">
                                          <div class="card-header">
                                             <div class="card-title"><i class="fa-solid fa-list"></i>&nbsp;&nbsp;스터디원 목록
                                             </div>
                                          </div>
   
                                          <div class="card-body">
                                             <div class="row">
                                                <div class="table-responsive">
                                                   <table class="table text-center"
                                                      id="studyListTbl">
                                                      <thead>
                                                         <tr>
                                                            <th>스터디원</th>
                                                            <th>전공</th>
                                                            <th>학번</th>
                                                         </tr>
                                                      </thead>
                                                      <tbody>
                                                         <c:forEach items="${studyVO }" var="study">
                                                            <tr class="member">
                                                               <td>${study.stuNameKo}</td>
                                                               <td>${study.deptName }</td>
                                                               <td>${study.stuId }</td>
                                                            </tr>
                                                         </c:forEach>
                                                      </tbody>
                                                   </table>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
   
                                    <div class="col-md-7">
                                       <div class="card">
                                          <div class="card-header">
                                             <div class="card-title col-8" >
                                                <i class="fa-regular fa-calendar-minus"></i>&nbsp;&nbsp;시간표 비교
                                             </div>
                                             <div class="col-5">
                                                <span style="background-color:#204170">　</span> : 중복시간 
                                                <span style="background-color:#75a9f1e3">　</span> : 미중복시간 
	                                          </div>
                                          </div>
                                          <div class="card-body">
                                             <div class="table table-responsive">
                                                <div class="row"></div>
                                                <div>
                                                   <table class="table table-bordered text-center"
                                                      id="timeTbl">
                                                      <thead>
                                                         <tr id="datTr">
                                                            <th style="width: 15%;"></th>
                                                            <th>월</th>
                                                            <th>화</th>
                                                            <th>수</th>
                                                            <th>목</th>
                                                            <th>금</th>
                                                         </tr>
                                                      </thead>
                                                      <tbody>
                                                         <tr>
                                                            <td>09:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>10:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>11:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>12:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>13:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>14:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>15:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>16:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>17:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                         <tr>
                                                            <td>18:00</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                         </tr>
                                                      </tbody>
                                                   </table>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
      </div>
   </div>
</div>

<script>/* 스터디원 리스트 스크립트 */
   $(function () {
      // 각 버튼에 대해 클릭 이벤트 등록
      var nStuId = null;
      var nStuAca = null;
      var nStuNm = null;
      var lastRnum = null;
      let members = [];

      // 해당 td에 시간표 표시 여부 data값 설정
      $("#timeTbl td").attr("data-status", 0);
      console.log("timeTbl > td: ", $(this));

      // 스터디원 선택 여부 data값 설정
      $(".member").attr("data-select", "N");

      $(".nav").on("click", "a", function () {
         $("#calendar").find(".fc-dayGridMonth-button").click();
      });

      $('.accept-btn').click(function () {
         var $this = $(this); // 클릭된 버튼 요소 저장
         var stuId = $(this).data('stu-id');
         var studyCode = $(this).data('study-code');
         var studyStatus = $(this).data('study-status');
         var msgContent = $(this).data('msg-content');
         var msgId = $(this).closest('tr').data('msg-id');
         var obj = {
            "stuId": stuId,
            "studyCode": studyCode,
            "studyStatus": studyStatus,
            "msgContent": msgContent
         };
         
         $.ajax({
            type: "post",
            url: "/study/insert",
            dataType: "text",
            data: obj,
            success: function (res) {
               console.log("res>>", res);
//                alert("변경되었습니다");
               Swal.fire(
                  '요청 성공',
                  '변경되었습니다.',
                  'success'
               )
               var nStuId = $this.parent().parent().find('.nStuId').text();
               var nStuAca = $this.parent().parent().find('.nStuAca').text();
               var nStuNm = $this.parent().parent().find('.nStuNm').text();
               var lastRnum = parseInt($('#yujin').find('.nRum').text());
               var nRum = lastRnum + 1;
               console.log("nStuId>>>", nStuId);
               $('tr[data-msg-id="' + msgId + '"]').remove();

               var newStudyMemElem = `
                  <tr>
                    <td>\${nRum}</td>
                    <td>\${nStuId}</td> 
                    <td>\${nStuAca}</td>
                    <td>\${nStuNm}</td>
                    <td>스터디원</td>
                  </tr>
                `;
               $('#yujin').append(newStudyMemElem);
            },
            error: function (err) {
               console.log("err>>", err);
//                alert("승인신청에 실패");
               Swal.fire(
                  '요청 실패',
                  '승인신청이 실패되었습니다.',
                  'error'
               ).then((result) => {
	               $('.standByDelete').remove();
           	   });
            }
         });

      });


      $('.reject-btn').click(function () {
         var stuId = $(this).data('stu-id');
         var studyCode = $(this).data('study-code');
         var studyStatus = $(this).data('study-status');
         var msgContent = $(this).data('msg-content');
         var obj = {
            "stuId": stuId,
            "studyCode": studyCode,
            "studyStatus": studyStatus,
            "msgContent": msgContent
         };
         console.log("studyObj>> ", obj);
         $.ajax({
            type: "post",
            url: "/study/insert",
            dataType: "text",
            data: obj,
            success: function (res) {
               console.log("res>>", res);
//                alert("변경되었습니다");
               Swal.fire(
                  '변경 완료',
                  '변경이 완료되었습니다!',
                  'success'
                )
               $('.standByDelete').remove();
            },
            error: function (err) {
               console.log("err>>", err);
//                alert("반려 처리에 실패");
               Swal.fire(
                  '처리 실패',
                  '반려 처리에 실패하였습니다.',
                  'error'
                )
            }
         });
      });

      /* 선택한 tr 표시 css 넣기 */
    function trBgDraw(p_this) {
         p_this.css({
            "background": "linear-gradient(to bottom, #add8e6, #f7f7f7)",
            "box-shadow": "0px 2px 4px rgba(0,0,0,0.3), 0px 4px 8px rgba(0,0,0,0.2), 0px 8px 16px rgba(0,0,0,0.1)"
         });
      }

      /* 선택한 tr 표시 리셋 */
    function trBgDrawReset(p_this) {
      p_this.removeAttr("style");
    }

      // 학생 시간표 그리기
      function addStuTime(stuTime){
      let table = document.getElementById("timeTbl");

      for(i=0; i<stuTime.length; i++){
        let startRow = (parseInt(stuTime[i].lrsStart.substr(1)) - 9) + 1;
        let endRow = (parseInt(stuTime[i].lrsEnd.substr(1)) - 9) + 1;
        let dayCol = 0;
  
        switch (stuTime[i].weekCode) {
          case "MON":
            dayCol = 1;
            break;
          case "TUE":
            dayCol = 2;
            break;
          case "WED":
            dayCol = 3;
            break;
          case "THU":
            dayCol = 4;
            break;
          case "FRI":
            dayCol = 5;
            break;
          default:
            return;
        }

        for (let j = startRow; j <= endRow; j++) {
          let cell = table.rows[j].cells[dayCol];
               let stat = parseInt($(cell).attr("data-status")); 

               if(stat == 0){ // data-status = 0 일 때
                  cell.style.backgroundColor = "#75a9f1e3";
               }else{
                  cell.style.backgroundColor = "#204170";
               }

          stat += 1;
               $(cell).attr("data-status", stat);
        }
      }
    }

      // 학생 시간표 빼기
      function removeStuTime(stuTime){
      let table = document.getElementById("timeTbl");

      for(i=0; i<stuTime.length; i++){
        let startRow = (parseInt(stuTime[i].lrsStart.substr(1)) - 9) + 1;
        let endRow = (parseInt(stuTime[i].lrsEnd.substr(1)) - 9) + 1;
        let dayCol = 0;
  
        switch (stuTime[i].weekCode) {
          case "MON":
            dayCol = 1;
            break;
          case "TUE":
            dayCol = 2;
            break;
          case "WED":
            dayCol = 3;
            break;
          case "THU":
            dayCol = 4;
            break;
          case "FRI":
            dayCol = 5;
            break;
          default:
            return;
        }

        for (let j = startRow; j <= endRow; j++) {
          let cell = table.rows[j].cells[dayCol];
               let stat = parseInt($(cell).attr("data-status")); 
               stat -= 1;
               $(cell).attr("data-status", stat);

               if(stat == 0){ // data-status = 0 일 때
                  cell.style.backgroundColor = "white";
               }else if(stat == 1){   // 겹치는 시간 없을 때
                  cell.style.backgroundColor = "#75a9f1e3";
               }else {   // 시간 겹칠 때
                  cell.style.backgroundColor = "#204170";
               }
        }
      }
    }
    

      $(document).on("click", ".member", function(){
         if($(this).attr("data-select") == "N"){   // 멤버 선택
            $(this).attr("data-select", "Y");
            trBgDraw($(this));
            let stuId = $(this).find('td:eq(2)').text();

            $.ajax({
               type: "get",
               url: `/study/getStuTime/\${stuId}`,
               success: function(res){
                  console.log("선택한 학생 시간표:", res);
                  addStuTime(res);
               }
            });

            return false;
         }

         if($(this).attr("data-select") == "Y"){   // 멤버 선택 해제
            $(this).attr("data-select", "N");
            trBgDrawReset($(this));

            let stuId = $(this).find('td:eq(2)').text();

            $.ajax({
               type: "get",
               url: `/study/getStuTime/\${stuId}`,
               success: function(res){
                  console.log("선택한 학생 시간표:", res);
                  removeStuTime(res);
               }
            });

            return false;
         }
      });

   });


</script>