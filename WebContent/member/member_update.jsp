<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%--jstl 양식입니다. format을 가져오는 것을 해주고잇습니다.- 생년월일 보려구용  --%>
    
    
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<title>개별 회원 조회  </title>
 <meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
table#member_view_tbl{
	width:800px;
	
}

span.req-item{
color:red;}


</style>

</head>
<body>

<div id="wrap" class="mx-auto" style="width:800px">
	<!-- 개별 회원 수정 폼 -->
	<form id="member_update_form" name="member_update_form" method="post" action="/member/member_update_proc.do">
	
		<table id="member_view_tbl" class="table table-bordered">
			<!-- 아이디 -->
			<tr>
				<td>
					<label id="memberId"><span class="req-item">*</span>아이디 : </label>
				</td>
				<td>${member.memberId} 
					<%--EL 객체 양식  --%>
					
					<input type="hidden" id="memberId" name="memberId" 
					size="25" maxlength="20" class="form-control" value="${member.memberId}"/>
					
				</td>
			</tr>
			
			<!-- 패스워드 -->
		
			<tr>
			
				<td>
					<label id="memberPassword"><span class="req-item">* </span>패스워드 : </label>
				</td>
			
				<td>${member.memberPassword}
				<input type="hidden" id="memberPassword" name="memberPassword" 
					size="25" maxlength="20" class="form-control" value="${member.memberPassword}"/>
				</td>
			
			
			</tr>
		
		<!-- 신규 패스워드 -->
		
			<tr>
			
				<td>
					<label id="memberPassword"><span class="req-item">* </span>신규 패스워드 : </label>
				</td>
			
				<td>
					<input type="text" id="memberPassword" name="memberPassword" 
					size="25" maxlength="20" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}" 
					title="패쓰워드는 영문대소문자/특수문자/숫자 조합하여 8~20자로 입력하십시오"  value=""/>
				</td>
			
			
			</tr>
		
		
		
		
		
		
		
			<!-- 이름 -->
			
			<tr>
				<td>
					<label id="memberName"><span class="req-item">* </span> 이름: </label>
				</td>
				
				<td>${member.memberName}
					<%-- <input type="text" id="memberName" name="memberName" 
					readonly maxlength="25" class="form-control" value="${member.memberName} />--%>
				</td>
			</tr>
		
			<!-- 성별 -->
			
			<tr>
				<td>
					<label id="memberGender"><span class="req-item">* </span>성별 :  </label>
				</td>
				<td>
					${member.memberGender == 109? '남자' :'여자'} 
					<%--m으로 하면 오류가 난다면 아스키 코드로 바꿔서 해주면 됨 !  --%>
				<!-- <div class="row">
				 <div class="custom-control custom-radio col-sm-2 ml-3" >
					
					<input type="radio" id="memberGenderMale" name="memberGender" title="성별을 입력하십시오" required class="custom-control-input" value="m"/>
					<label class="custom-control-label" for="memberGenderMale">남</label>
					
					
				</div>
				<div class="custom-control custom-radio">
					
					<input type="radio" id="memberGenderFemale" name="memberGender" title="성별을 입력하십시오" required class="custom-control-input" value="f"/>
					<label class="custom-control-label" for="memberGenderFemale">여</label>
					 
					  
				</div>
				</div> -->
					
				</td>
			
			</tr>
		
			<!-- 이메일 -->
		
		
			<tr>
			
				<td>
					<label for="memberEmail"><span class="req-item">* </span>이메일: </label>
				</td>
				
				<td>${member.memberEmail}
					<%-- <input type="email" id="memberEmail" name="memberEmail" 
					maxlength="50"  class="form-control" value="${member.memberEmail}" readonly/> --%>
				</td>
			
			
			</tr>
			
		
			<!-- 연락처 -->
		
		
			<tr>
				<td>
					<label for="memberPhone"><span class="req-item">* </span>연락처: </label>
				</td>
				
				<td>${member.memberPhone}
					<%--<input type="text" id="memberPhone" name="memberPhone" 
					 class="form-control" value="${member.memberPhone}"/>--%>
				</td>
			
			</tr>
			
			
			<!-- 생년월일 -->
			
			<tr>
			
				<td>
					<label for="memberBirth"><span class="req-item">* </span>생년월일: </label>
				</td>
				
				<td><fmt:formatDate value="${member.memberBirth}" pattern="yyyy년 MM월  dd일"/>
					<%--대소문자 민감하니까 조심해서 치셔야합니다아 , jstl taglibrary 이용했습니다. --%>
					<%-- <input type="text" id="memberBirth" name="memberBirth"
					 class="form-control" value="${member.memberBirth}"/>--%>
				</td>
			
			</tr>
			
			<!-- 우편번호 -->

			<tr>
			
				<td>
					<label for="memberZip">우편 번호: </label>
				</td>
				
				<td>${member.memberZip}
					<%-- -<div class="row">
						<div class="col-sm-3">
							<input type="text" id="memberZip" name="memberZip" 
							maxlength="5" class="form-control" readonly value="${member.memberZip}"/>
						</div>
						
						
					</div>--%>
				</td>
		
			</tr>
			
			<!-- 기본 주소 -->
			<tr>
			
				<td>
					<label for="memberAddressBasic"> 기본주소:</label>
				</td>
				<td>${addrBasic}
					<%-- <input type="text" id="memberAddressBasic" name="memberAddressBasic" pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}" title="기본주소를 입력하십시오"
					maxlength="200" class="form-control" readonly/>--%>
				</td>
			
			</tr>
					
		
		
		<!-- 상세 주소 -->
			<tr>
			
				<td>
					<label for="memberAddressDetail"> 상세주소:</label>
				</td>
				<td>${addrDetail}
					<%-- <input type="text" id="memberAddressDetail" name="memberAddressDetail" pattern="[\w | \W | 가-힣 | / | -]{2,100}" title="상세주소를 입력하십시오"
					maxlength="200" class="form-control"/> --%>
				</td>
			
			</tr>
	
		
		</table>	
	
		<!-- 전송 취소 -->
		<div class="mx-auto" style="width:130px">
		<button type="submit" id="join_submit_btn" class="btn btn-primary">전송</button>
		<button type="reset" class="btn btn-primary">취소</button>
		</div>
	
	</form>
	
	<!-- //회원가입폼  -->
	</div>
	
</body>
</html>