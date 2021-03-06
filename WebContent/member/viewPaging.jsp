<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전체 회원 정보 조회 (페이징)</title>

<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
table#view_paging {
	font-size:9pt;
}

/*페이징 섹션*/

div#paging_box {
	width:100%;
	margin:auto;
	display:flex;
	align-items:center;
	justify-content:center;
}

</style>


</head>
<body>

	<!-- 회원정보 출력부 -->

	<div id="wrap" style="width:80%; margin:auto">
		<table id="view_paging" class="table table-bordered table-hover">
			<!-- 표제 -->
			<tr>
			
				<th>번호</th>
				<th>회원 아이디</th>
				<th>회원명</th>
				<th>성별</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>생년월일</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>메뉴</th>
				
			</tr>
			
			
			<!-- 회원정보 나열 -->
			<c:forEach var="member" items="${members}" varStatus="st">
			<tr>
				<td>${st.count+(pageVO.page-1)*limit}</td>
				<td>${member.memberId}</td>
				<td>${member.memberName}</td>
				<td>${member.memberGender==109 ? "남자": "여자"}</td>
				<td>${member.memberEmail}</td>
				<td>${member.memberPhone}</td>
				<td><fmt:formatDate value="${member.memberBirth}" pattern="yyyy년  M월  d일"/></td>
				<td>${member.memberZip}</td>
				<td>${fn:replace(member.memberAddress,"*"," ")}</td>
				<td>
					<input type="button" value="수정" class="btn-sm btn-primary" />
					<input type="button" value="삭제" class="btn-sm btn-primary" />
				</td>
		
			</tr>
			</c:forEach>
			
			
		</table>
	
	</div>


	<!-- 페이징 -->
	<div id="paging_box">
		<%@ include file="paging.jsp" %>
	</div>
	
	
	
	
	


</body>
</html>