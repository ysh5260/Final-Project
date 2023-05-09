<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 페이지 타이틀 -->
<div class="page-titles">
   <ol class="breadcrumb">
      <li><h5 class="bc-title">쪽지</h5></li>
      <li class="breadcrumb-item"><a href="javascript:void(0)">
         <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
         </svg>
         내 쪽지함 </a>
      </li>
      <li class="breadcrumb-item active"><a href="javascript:void(0)">쪽지함</a></li>
   </ol>
</div>
<div class="container-fluid">

   <!-- 표현하고자 하는 내용 넣기 -->


<div class="card" style="border:none">
<div class="default-tab">
<h4 style="padding: 20px;"><span style="font-size:18px; color: #f96d00;">|</span> 쪽지함</h4>
	<ul class="nav nav-tabs" role="tablist" style="padding-left: 18px; ">
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="tab" href="#msgList"><i class="la la-envelope me-2"></i> 받은쪽지함</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" href="#msgSendList"><i class="la la-user me-2"></i> 보낸쪽지함</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="msgList" role="tabpanel">
			<div class="pt-4">
					<div class="card" style="border:none;">
<!-- 						<div class="card-header"> -->
<!-- 							<div class="card-title"> -->
<!-- 								<h4><span style="font-size:18px; color: #f96d00;">|</span> 받은 쪽지함</h4> -->
<!-- 							</div>						 -->
<!-- 						</div> -->
						<div class="card-body" style="margin:0 2% 0;">
							<table class="table table-responsive text-center">
								<thead>
									<tr>
										<th><input class="form-check-input" type="checkbox" value="" id="allCheck"></th>
										<th>No</th>
										<th>보낸사람</th>
										<th>내용</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty msgList }">
											<tr>
												<td colspan="5">메세지 함이 텅 비었습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${msgList }" var="msg">
												<tr role="row" class="even">
<%-- 													<input type="hidden" name="msgNo" value="${msg.msgNo }"/> --%>
													<td><input class="form-check-input" type="checkbox" value="${msg.msgNo }"  sunnyRecv id="check"></td>
													<td class="sorting_1" style="width:10px; text-align:center;">${msg.rnum}</td>
													<td>${msg.msgSender }</td>
													<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; max-width:200px;text-align:left;">
														<a onclick="window.open('/msg/msgDetail?msgNo=${msg.msgNo}', 'win_new2', 'width=500, height=500, top=100, left=100')">${msg.msgContent }</a>
													</td>
													<td>${msg.msgDate }</td>
												</tr> 
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>	
							<button type="button" class="btn btn-primary" onclick="f_send()" style="float: right;">쪽지보내기</button>
							<button type="button" class="btn btn-outline-primary" style="float: left;" onclick="msgDelete()">삭제</button>
						</div>
					</div>
			</div>
		</div>
		
		<div class="tab-pane fade" id="msgSendList">
			<div class="pt-4">
				<div class="card" style="border:none;">
<!-- 					<div class="card-header"> -->
<!-- 						<div class="card-title"> -->
<!-- 							<h4><span style="font-size:18px; color: #f96d00;">|</span> 보낸 쪽지함</h4> -->
<!-- 						</div>						 -->
<!-- 					</div> -->
						<div class="card-body" style="margin:0 2% 0;">
							<table class="table table-responsive text-center">
								<thead>
									<tr>
										<th><input class="form-check-input" type="checkbox" value="" id="allCheck"></th>
										<th>No</th>
										<th>받는사람</th>
										<th>내용</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty msgSendList }">
											<tr>
												<td colspan="5">메세지 함이 텅 비었습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${msgSendList }" var="msg">
												<tr role="row" class="even">
<%-- 													<input type="hidden" name="msgNo" value="${msg.msgNo }"/>												 --%>
													<td><input class="form-check-input" type="checkbox" value="${msg.msgNo }" sunnyRecv id="check"></td>
													<td class="sorting_1" style="width:10px; text-align:center;">${msg.rnum}</td>
													<td>${msg.msgReceiver }</td>
													<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; max-width:200px;text-align:left;">
														<a onclick="window.open('/msg/msgDetail?msgNo=${msg.msgNo}', 'win_new2', 'width=500, height=500, top=100, left=100')">${msg.msgContent }</a>
													</td>
													<td>${msg.msgDate }</td>
												</tr> 
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<button type="button" class="btn btn-primary" onclick="f_send()" style="float: right;">쪽지보내기</button>
							<button type="button" class="btn btn-outline-primary" style="float: left;" onclick="msgDelete()">삭제</button>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div> <!-- tab-content 끝나는 곳 -->
</div> <!-- default Tab 끝나는 곳 -->
</div>
<script>
let win1;
let win2;
function f_send() {
	win1 = open("/msg/msgSend", "winNew1",
			"width=500, height=500, top=100, left=100");
}

//쪽지 체크박스 전체 선택(받은쪽지함)
let allCheckbox = document.querySelector('#msgList #allCheck');
allCheckbox.addEventListener('change', () => {
	let checkboxes = document.querySelectorAll('#msgList input[type="checkbox"]');
	checkboxes.forEach((checkbox) => {
		checkbox.checked = allCheckbox.checked;
	});
}); 

// 쪽지 체크박스 전체 선택(보낸쪽지함)
let allSendCheckbox = document.querySelector('#msgSendList #allCheck');
allSendCheckbox.addEventListener('change', () => {
	let checkboxes = document.querySelectorAll('#msgSendList input[type="checkbox"]');
	checkboxes.forEach((checkbox) => {
		checkbox.checked = allCheckbox.checked;
	});
}); 


function msgDelete(){
	let ckValues = [];
	let recvCkboxs =  document.querySelectorAll("[sunnyRecv]:checked");
	for(let i=0; i<recvCkboxs.length; i++){
		ckValues.push(recvCkboxs[i].value);
	}

	let data = JSON.stringify(ckValues);
	console.log("최종확인:",ckValues);
	
	$.ajax({
		type : 'post',
		url : '/msg/msgDelete',
		data : data,
		contentType : "application/json;charset=utf-8",
		success : function(result){
			console.log(result);
			if(result == "success"){
				alert()
				location.href = location.href;
			}else{
				alert("삭제 실패");
			}
		}
	});
}




</script>


