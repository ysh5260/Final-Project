<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="conL" style="padding-top:50px;">  
	<div class="row">
		<div class="p-0">
			<div class="card-header flex-wrap border-0">
	            <div>
	              <h4 style="font-weight: 800; font-size: 25px;"> 스터디 모집</h4> 
	            </div>
	            <div class="d-flex justify-content-between align-items-center mb-3">
					<button type="button" class="btn btn-primary" onclick="javascript:location.href='/board/form/${cateCode}'">모집 등록</button>
				</div>
	             
         	</div>		
			<div class="card-body pt-0 pb-0">
				<div class="row">
				<c:set value="${pagingVO.dataList }" var="boardList"/>
				<c:choose>
					<c:when test="${empty boardList}">
						<div class="table-responsive">
							<table class="">
								<tbody>
									<tr>
										<td>모집중인 스터디가 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardList }" var="board"> 
							<div class="col-xl-3 col-sm-4" style="padding-right:0;">
								<div class="card box-hover" style="border-top: 5px solid #175bc7;"> 
									<a href="/board/detail/${board.boNo}">
										<div class="card-body fs-4" style="height: 160px"> 
											<h4 class="mb-0" > <strong>[${board.boTitle }]</strong></h4> 
											<br>
											<input type="hidden" value="${board.boContent}" id="content">
												<p id="boContent"></p>
										</div>
										<div class="card-footer d-flex justify-content-between flex-wrap align-items-center pb-4" style="padding-left:12px;">
											<p class="mb-0 text-secondary col-8">
												작성일 <span class="text-purple">: ${board.boWriteDate }</span>
											</p>
											<div class="col-3"> 
												<c:choose >
											     	<c:when test="${board.ssStatus eq 'N' }"> 
											     	<span class="badge light badge-success"> 모집중</span>
											     	</c:when>
											     	<c:otherwise>
											     	<span class="badge light badge-danger">모집완료</span>
											     	</c:otherwise> 
											     </c:choose>
											</div>
											<br>
											<div class="col-12">
												<i class='fas fa-crown' style='font-size:15px;color:gold;'></i> ${board.stuNameKo }
												<span style="padding-left:10px;"></span> 
												<i class='far fa-eye' ></i> ${board.boHit }
											</div>
										</div>
									</a>	
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
				</div>
			</div>
		</div>
		<nav>
		  <ul class="pagination pagination-sm justify-content-end">
		    <li class="page-item page-indicator">
		      <a class="page-link" href="?page=${pagingVO.currentPage - 1}">
		        <i class="la la-angle-left"></i>
		      </a>
		    </li>
		    <c:choose>
		      <c:when test="${pagingVO.totalPage == 0}">
		        <li class="page-item"><span class="page-link">검색된 결과가 없습니다.</span></li>
		      </c:when>
		      <c:otherwise>
		        <c:forEach var="i" begin="1" end="${pagingVO.totalPage}">
		          <c:if test="${pagingVO.currentPage == i}">
		            <li class="page-item active">
		              <span class="page-link"><c:out value="${i}" escapeXml="false"/></span>
		            </li>
		          </c:if>
		          <c:if test="${pagingVO.currentPage != i}">
		            <li class="page-item">
		              <a class="page-link" href="?page=${i}"><c:out value="${i}" escapeXml="false"/></a>
		            </li>
		          </c:if>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		    <li class="page-item page-indicator">
		      <a class="page-link" href="?page=${pagingVO.currentPage + 1}">
		        <i class="la la-angle-right"></i>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>	
</div>		




</body>
<!-- jqeury -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
/*
    var content = $("#content").val();
	var split = strSplit(content);
	var boContent = $("#boContent").text(split);
	
	alert(">>>"+boContent);
*/
   
	const contents = document.querySelectorAll("#content");
	const boContents = document.querySelectorAll("#boContent");
	for(let i=0; i< contents.length; i++){
		boContents[i].innerHTML =  strSplit(contents[i].value);
	}


	function strSplit(str) {
	    var result = "";
	    if(str.length > 50) {
	        result = str.substring(0, 50) + " ...";    // 보여줄 문자열 길이
	    } else {
	        result = str;
	    }
	    return result;
	};
	
</script>
</html>