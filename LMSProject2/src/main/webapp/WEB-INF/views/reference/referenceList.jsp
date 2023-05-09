<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 페이지 타이틀 -->
<div class="page-titles">
	<ol class="breadcrumb">
		<li><h5 class="bc-title">자료실</h5></li>
		<li class="breadcrumb-item"><a href="javascript:void(0)">
			<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" clip-rule="evenodd" d="M10.0122 1.82893L11.6874 5.17545C11.8515 5.50399 12.1684 5.73179 12.5359 5.78451L16.2832 6.32391C17.2091 6.45758 17.5775 7.57968 16.9075 8.22262L14.1977 10.8264C13.9314 11.0825 13.8101 11.4505 13.8731 11.812L14.5126 15.488C14.6701 16.3974 13.7023 17.0911 12.8747 16.6609L9.52545 14.9241C9.1971 14.7537 8.80385 14.7537 8.47455 14.9241L5.12525 16.6609C4.29771 17.0911 3.32986 16.3974 3.48831 15.488L4.12686 11.812C4.18986 11.4505 4.06864 11.0825 3.80233 10.8264L1.09254 8.22262C0.422489 7.57968 0.790922 6.45758 1.71678 6.32391L5.4641 5.78451C5.83158 5.73179 6.14942 5.50399 6.31359 5.17545L7.98776 1.82893C8.40201 1.00148 9.59799 1.00148 10.0122 1.82893Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			자료 목록 </a>
		</li>
		<li class="breadcrumb-item active"><a href="#">${className }</a></li>
	</ol>
	<a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample1" role="button" aria-controls="offcanvasExample1">+ Add Task</a>
</div>
<div class="container-fluid">
	<div class="row">
	<div class="card">
		<div class="card-header" style="padding-bottom:10px;">
			<h4><span style="font-size:20px; color: #f96d00;">|</span><strong>&nbsp;${className } 자료 목록</strong></h4>
				<c:if test="${sessionScope.userInfo.userType eq 'STU'}">
					<c:set var="display" value="none" />
				</c:if>		
				<div>
		   			 <c:if test="${sessionScope.userInfo.userType eq 'PRO'}">	
		   				 <button type="button" class="btn btn-info" style="display:${display}"  onclick="javascript:location.href='/class/proClassRoom/${lecCode}'">목록</button>
		   			</c:if> 
					<c:if test="${sessionScope.userInfo.userType eq 'STU'}">	
		   				 <button type="button" class="btn btn-info" onclick="javascript:location.href='/class/stuClassRoom/${lecCode}'">목록</button>
		   			</c:if> 
		   			 <button type="button" class="btn btn-primary" style="display:${display}" onclick="javascript:location.href='/reference/referenceForm/${lecCode}'">등록</button>
				</div>		
		</div>	
	
	<!-- ///////////////////////////card-header ////////////////////-->
	<div class="card-body">
	 <c:choose>
		<c:when test="${empty referenceList}">
			<div class="card-body">
				<span style="font-size:18px;">등록된 자료 내역이 존재하지 않습니다.</span>
			</div>
		</c:when>
	</c:choose>	
	</div>
	<c:if test="${sessionScope.userInfo.userType eq 'PRO'}">
		<c:set var="display" value="inline" />
		<div class="row" id="fileList" style="padding: 0 19px 0 6px;">
			
		</div>
		
	</c:if>
	<c:if test="${sessionScope.userInfo.userType eq 'STU'}">
		<c:set var="display" value="none" />
		<div class="row" id="fileList" style="padding: 0 19px 0 6px;">
		</div>
	</c:if>
	</div> 
</div>
</div>
<script type="text/javascript">

$(function() {
		$.ajax({
				type: "post",
				url: "/reference/referenceFile",
				dataType: "json",
				data: { lecCode: '${lecCode}' },
				success : function (res) {
					let groups = {};
					$.each(res, function (index, item) {
						let unixTime = item.lrUploadDate; // Unix 시간
						let date = new Date(unixTime); // Date 객체 생성
						let year = date.getFullYear(); // 년도 가져오기
						let month = date.getMonth() + 1; // 월 가져오기 (0부터 시작하므로 1을 더함)
						let day = date.getDate(); // 일자 가져오기
						let hours = date.getHours(); // 시간 가져오기
						let minutes = date.getMinutes(); // 분 가져오기
						let seconds = date.getSeconds(); // 초 가져오기

						// YYYY-MM-DD HH:mm:ss 형식으로 출력
						let formattedDate = `\${year}-\${month.toString().padStart(2, '0')}-\${day.toString().padStart(2, '0')} \${hours.toString().padStart(2, '0')}:\${minutes.toString().padStart(2, '0')}`;
						console.log(formattedDate); // 출력: 2022-05-03 07:20
						let key = formattedDate + "_" + item.lrTitle; // combine lrUploadDate and lrTitle as key
						if (!groups[key]) {
							groups[key] = [];
						}
						groups[key].push(item);
					});
	
	
					$.each(groups, function (key, items) {
						let [formattedDate,title] = key.split("_"); 
						let str = "";
						  str += "<div class='col-xl-3' style='padding-right:0;'>"; 
						  str += "<div class='card dz-card' id='card-title-2'>";
						  str += "<div class='card-header flex-wrap' style='padding-left:10px;'>";
						  str += "<h3 class='card-title'>";
						  str += "<i class='bi bi-folder2-open' style='color:#007ed9; font-size:18px;'></i>&nbsp;";
						  str +=  title + "<br/>";
						  str += "</h3>"; 
						  str += "<div class='d-flex justify-content-end mb-0'>"+formattedDate+"</div>";
						  str += "</div>";
						  str += "<div class='tab-content' id='myTabContent-1'>";
						  str += "<div class='tab-pane fade active show' id='CardTitle2' role='tabpanel' aria-labelledby='home-tab-1'>";
						  str += "<div class='card-text' style='height: 130px; overflow-y: auto; margin-left:20px'>";
						  str += "<br>";
						$.each(items, function (index, item) {
							let data = item.lrFilePath+item.lrFileName;
							let fileExt = item.lrFileName.split('.').pop().toLowerCase();
							let fileName = item.lrFileName.split('_').pop().toLowerCase();
							let ext;
							if (fileExt === 'jpg' || fileExt === 'jpeg' || fileExt === 'png') {
								ext = '<i class="bi bi-images" style="font-size: 24px;"></i>'
							} else if (fileExt === 'pdf') {
								ext = '<i class="bi bi-file-pdf" style="font-size: 24px;"></i>' 
							} else if (fileExt === 'zip') {
								ext = '<i class="bi bi-file-zip" style="font-size: 24px;"></i>'
							} else {
								ext = '<i class="bi bi-files" style="font-size: 24px;"></i>'
							}
							str += "<a href='/reference/displayFile?fileName=" + data + "' target='_blank' onclick='event.preventDefault(); Swal.fire({icon: \"question\", text: \"다운로드 받겠습니까?\", showCancelButton: true}).then((result) => {if (result.value) {window.location.href=\"/reference/displayFile?fileName=" + data + "\";}});'>" + ext + " " + fileName + "</a><br/>";
						  });
						    str += "</div>";
						    str += "<div class='card-footer pt-2 gap-2 d-flex justify-content-end align-items-center' style='display: ${display}'>";
						    str += "<button type='button' class='btn light btn-success mr-2' style='display: ${display}'>수정</button>";
						    str += "<button type='button' class='btn light btn-danger' style='display: ${display}'>삭제</button>";
						    str += "</div>";
						    str += "</div>";
						    str += "</div>";
						    str += "</div>";
						    $("#fileList").append(str);
					});
				}
			})
			
		}) 
		
	function getExtension(filename) {
	var ext = filename.split('.').pop();
	return ext;
	}
	</script>