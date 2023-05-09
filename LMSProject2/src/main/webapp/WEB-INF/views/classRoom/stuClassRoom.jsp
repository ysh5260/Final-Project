<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 페이지 타이틀 -->
<style>
#imgArea {
	text-align: center;
	width: 60px;
	height: 80px;
	object-fit: contain;
}
</style>
<div class="page-titles">
	<ol class="breadcrumb">
		<li><h5 class="bc-title">클래스룸</h5></li>
		<li class="breadcrumb-item"><a href="#"> 
				<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" clip-rule="evenodd" d="M10.0122 1.82893L11.6874 5.17545C11.8515 5.50399 12.1684 5.73179 12.5359 5.78451L16.2832 6.32391C17.2091 6.45758 17.5775 7.57968 16.9075 8.22262L14.1977 10.8264C13.9314 11.0825 13.8101 11.4505 13.8731 11.812L14.5126 15.488C14.6701 16.3974 13.7023 17.0911 12.8747 16.6609L9.52545 14.9241C9.1971 14.7537 8.80385 14.7537 8.47455 14.9241L5.12525 16.6609C4.29771 17.0911 3.32986 16.3974 3.48831 15.488L4.12686 11.812C4.18986 11.4505 4.06864 11.0825 3.80233 10.8264L1.09254 8.22262C0.422489 7.57968 0.790922 6.45758 1.71678 6.32391L5.4641 5.78451C5.83158 5.73179 6.14942 5.50399 6.31359 5.17545L7.98776 1.82893C8.40201 1.00148 9.59799 1.00148 10.0122 1.82893Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg> 클래스
		</a></li>
		<li class="breadcrumb-item active"><a href="#">${className }
				클래스</a></li>
	</ol>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="card">
			<div class="card-header">
				<h4>
					<span style="font-size: 20px; color: #f96d00;">|</span><strong>&nbsp;${className} 클래스룸</strong>
				</h4>
			</div>
			<div class="card-body">
				<!-- ///// 출석 ///// -->
				<div class="row">
					<div class="row">
					<div class="col-xl-12">
						<div class="card">
							<div class="card-header border-0" style="padding-bottom:10px;">
								<div class="fw-bold fs-4">
									&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-user-check"></i>&nbsp;&nbsp;&nbsp;
									출석
								</div>
							</div>
							<div class="card-body pt-0">
								<div
									class="table-responsive active-projects style-1 attendance-tbl">
									<div id="attendance-tbl_wrapper"
										class="dataTables_wrapper no-footer">
										<table id="attendance-tbl" class="table dataTable no-footer"
											role="grid" aria-describedby="attendance-tbl_info">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0"
														aria-controls="attendance-tbl" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Employee Name: activate to sort column descending"
														style="width: 151.281px;">학생</th>
													<th><span>1</span>
														<p>주차</p></th>
													<th><span>2</span>
														<p>주차</p></th>
													<th><span>3</span>
														<p>주차</p></th>
													<th><span>4</span>
														<p>주차</p></th>
													<th><span>5</span>
														<p>주차</p></th>
													<th><span>6</span>
														<p>주차</p></th>
													<th><span>7</span>
														<p>주차</p></th>
													<th><span>8</span>
														<p>주차</p></th>
													<th><span>9</span>
														<p>주차</p></th>
													<th><span>10</span>
														<p>주차</p></th>
													<th><span>11</span>
														<p>주차</p></th>
													<th><span>12</span>
														<p>주차</p></th>
													<th><span>13</span>
														<p>주차</p></th>
													<th><span>14</span>
														<p>주차</p></th>
													<th><span>15</span>
														<p>주차</p></th>
													<th><span>16</span>
														<p>주차</p></th>
													<th><span></span>
														<p></p></th>
												</tr>
											</thead>
											<tbody>
												<tr role="row" class="odd">
													<td class="sorting_1">
														<div class="products">
															<c:choose>
																<c:when test="${empty atd.profileNo}">
																	<img id="imgArea" src="${pageContext.request.contextPath}/resources/images/profile.png">
																</c:when>
																<c:otherwise>
																	<img id="imgArea" src="${pageContext.request.contextPath}/resources/images/profile${atd.profilePath}${atd.profileName }" />
																</c:otherwise>
															</c:choose>
															<div>
<!-- 																<span id="acaMajor"></span><br/> -->
																<span id="stuId" style="font-size: 13px;">${atd.stuId }</span><br>
																<span>${atd.stuNameKo }&nbsp;</span>
															</div>
														</div>
													</td>
													<td><span data-value="${atd.week1 }" id="week1"></span></td>
													<td><span data-value="${atd.week2 }" id="week2"></span></td>
													<td><span data-value="${atd.week3 }" id="week3"></span></td>
													<td><span data-value="${atd.week4 }" id="week4"></span></td>
													<td><span data-value="${atd.week5 }" id="week5"></span></td>
													<td><span data-value="${atd.week6 }" id="week6"></span></td>
													<td><span data-value="${atd.week7 }" id="week7"></span></td>
													<td><span data-value="${atd.week8 }" id="week8"></span></td>
													<td><span data-value="${atd.week9 }" id="week9"></span></td>
													<td><span data-value="${atd.week10 }" id="week10"></span></td>
													<td><span data-value="${atd.week11 }" id="week11"></span></td>
													<td><span data-value="${atd.week12 }" id="week12"></span></td>
													<td><span data-value="${atd.week13 }" id="week13"></span></td>
													<td><span data-value="${atd.week14 }" id="week14"></span></td>
													<td><span data-value="${atd.week15 }" id="week15"></span></td>
													<td><span data-value="${atd.week16 }" id="week16"></span></td>
													<td class="text-center"><p class="cnt"
															style="display: inline-block;">${atd.atdTotal}</p>/16</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<!-- ///// 수업공지,자료실, 과제  ///// -->
					<div class="row">
						<!-- ///// 수업공지 ///// -->
						<div class="col-xl-4">
							<div class="card">
								<div class="card-header border-0 pb-0 ps-3 pt-3">
									<div class="card-title fw-bold fs-4">
										&nbsp;&nbsp;&nbsp;<i class="fa-regular fa-clipboard"></i>&nbsp;&nbsp;&nbsp;
										수업 공지사항
									</div>
									<!-- 더보기 이동 버튼 -->
									<div class="">
										<button type="button" class="btn btn-primary light sharp"
											id="notBtn" data-lec-code="${lecCode }">
											<svg width="20px" height="20px" viewBox="0 0 24 24"
												version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
													fill-rule="evenodd">
											<rect x="0" y="0" width="24" height="24" />
											<circle fill="#000000" cx="5" cy="12" r="2" />
											<circle fill="#000000" cx="12" cy="12" r="2" />
											<circle fill="#000000" cx="19" cy="12" r="2" /></g></svg>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-responsive-md">
											<thead>
												<tr>
													<th style="width: 60px;"><strong>#</strong></th>
													<th><strong>제목</strong></th>
													<th><strong>등록일</strong></th>
												</tr>
											</thead>
										<tbody  style="border-top: #175bc7;">
										    <c:set value="${pagingVO.dataList }" var="boardList"/>
										    <c:choose>
										      <c:when test="${empty noticeList}">
										        <tr>
										          <td colspan="5" style="text-align:center;">공지사항이 존재하지 않습니다.</td>                                 
										        </tr>
										      </c:when>
										      <c:otherwise>
										        <c:forEach items="${noticeList }" var="list" varStatus="i"> 
										          <tr>
										            <td>${i.count }</td> 
                                       				<td><a href="/lecNotice/detail/${list.lecNoticeNo }">${list.lnTitle }</a></td>
                                     			    <td>${list.lnRegDate }</td>
										          </tr>
										        </c:forEach>
										      </c:otherwise>
										    </c:choose>
										  </tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

						<!-- ///// 자료실  ///// -->
						<div class="col-xl-4">
							<div class="card">
								<div class="card-header border-0 pb-0 ps-3 pt-3">
									<div class="card-title fw-bold fs-4">
										&nbsp;&nbsp;&nbsp;<i class="fa-regular fa-folder-open"></i>&nbsp;&nbsp;&nbsp;
										자료실
									</div>
									<!-- 더보기 이동 버튼 -->
									<div class="">
										<button type="button" class="btn btn-primary light sharp"
											id="refBtn" data-lec-code="${lecCode }"
											data-class-name="${className }">
											<svg width="20px" height="20px" viewBox="0 0 24 24"
												version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
													fill-rule="evenodd">
											<rect x="0" y="0" width="24" height="24" />
											<circle fill="#000000" cx="5" cy="12" r="2" />
											<circle fill="#000000" cx="12" cy="12" r="2" />
											<circle fill="#000000" cx="19" cy="12" r="2" /></g></svg>
										</button>
									</div>
								</div>
                 				<div class="card-body">
                                    <div class="table-responsive" style="height:15vh;overflow:auto;">
		                            <table class="table table-responsive-md">
		                                <thead>
		                                    <tr>
		                                        <th><strong>#</strong></th>
		                                        <th><strong>파일명</strong></th>
		                                        <th><strong>등록일자</strong></th>
		                                    </tr>
		                                </thead>
										 <tbody  style="border-top: #175bc7;">
										    <c:set value="${pagingVO.dataList }" var="boardList"/>
										    <c:choose>
										      <c:when test="${empty referenceList}">
										        <tr>
										          <td colspan="5" style="text-align:center;">자료 내역이 존재하지 않습니다.</td>                                 
										        </tr>
										      </c:when>
										      <c:otherwise>
										        <c:forEach items="${referenceList }" var="list" varStatus="i"> 
										          <tr>
										            <td>${i.count }</td> 
										            <td><a href="/reference/referenceList/${lecCode}">${fn:substringAfter(list.lrFileName, '_')}</a>
										            </td>
										            <td><fmt:formatDate value="${list.lrUploadDate}" pattern="yyyy-MM-dd" type="date"/></td>
										          </tr>
										        </c:forEach>
										      </c:otherwise>
										    </c:choose>
										  </tbody>
				                     </table>
                                    </div>
                                </div>
							</div>
						</div>

						<!-- ///// 과제  ///// -->
						<div class="col-xl-4">
							<div class="card">
								<div class="card-header border-0 pb-0 ps-3 pt-3">
									<div class="card-title fw-bold fs-4 ">
										&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-note-sticky"></i>&nbsp;&nbsp;&nbsp;
										과제
									</div>
									<!-- 더보기 이동 버튼 -->
									<div class="">
										<button type="button" class="btn btn-primary light sharp"
											id="subBtn" data-lec-code="${lecCode }"
											data-class-name="${className }">
											<svg width="20px" height="20px" viewBox="0 0 24 24"
												version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
													fill-rule="evenodd">
											<rect x="0" y="0" width="24" height="24" />
											<circle fill="#000000" cx="5" cy="12" r="2" />
											<circle fill="#000000" cx="12" cy="12" r="2" />
											<circle fill="#000000" cx="19" cy="12" r="2" /></g></svg>
										</button>
									</div>
								</div>
                                <div class="card-body">
                                    <div class="table-responsive" style="height:15vh;overflow:auto;">
		                            <table class="table table-responsive-md">
		                                <thead>
		                                    <tr>
		                                        <th><strong>#</strong></th>
		                                        <th><strong>제목</strong></th>
		                                        <th><strong>제출기한</strong></th>
		                                    </tr>
		                                </thead>
										 <tbody  style="border-top: #175bc7;">
										    <c:set value="${pagingVO.dataList }" var="boardList"/>
										    <c:choose>
										      <c:when test="${empty homeworkList}">
										        <tr>
										          <td colspan="5" style="text-align:center;">과제 내역이 존재하지 않습니다.</td>                                 
										        </tr>
										      </c:when>
										      <c:otherwise>
										        <c:forEach items="${homeworkList }" var="list" varStatus="i"> 
										          <tr>
										            <td>${i.count }</td>
										            <td><a href="/submit/homeworkList/${lecCode}">${list.hwTitle }</a>
										            </td>
										            <td>${fn:substring(list.hwDeadline, 0, 10) }</td>
										          </tr>
										        </c:forEach>
										      </c:otherwise>
										    </c:choose>
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
	<script>
		$(document).on("click", "#refBtn", function() {
			var lecCode = $(this).data('lec-code');
			console.log("lecCode>>", lecCode);
			location.href = "/reference/referenceList/" + lecCode;
		});
		$(document).on("click", "#notBtn", function() {
			var lecCode = $(this).data('lec-code');
			console.log("lecCode>>", lecCode);
			location.href = "/lecNotice/list/" + lecCode;
		});
		$(document).on("click", "#subBtn", function() {
			var lecCode = $(this).data('lec-code');
			console.log("lecCode>>", lecCode);
			location.href = "/submit/homeworkList/" + lecCode;
		});

		$(function() {
			var acaMajor = '${atd.acaMajor}';
			acaMajor = acaMajor.slice(0, -1); // 문자열 맨 뒷 글자 제거
			
			$("#acaMajor").text(acaMajor);
			
			for (let i = 1; i <= 16; i++) {
				var weeki = $("#week" + i).data("value");
				console.log("week" + i + ":", weeki);
				if (weeki == "Y") {
					$("#week" + i).addClass("text-success").html(
							'<i class="fa-solid fa-check"></i>');
				}
				if (weeki == "N") {
					$("#week" + i).addClass("text-danger").html(
							'<i class="fa-regular fa-xmark"></i>');
				}
			}
		})
	</script>