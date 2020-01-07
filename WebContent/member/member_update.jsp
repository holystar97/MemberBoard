<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개별 회원 수정</title>
<style>
table#member_view_tbl {
    width:800px;
}
 
/* 필수 항목 아이콘 */
span.req-item { color:red }
 
/* 에러 메시지 */
.err_msg { color:red; }
</style>
 
<!-- bootstrap CSS -->  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- bootstrap javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 
<!-- daum 우편번호/주소 검색 서비스 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 
<script>
//도로명 주소 검색
function getPostcodeAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수
 
            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;
 
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }
 
            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
           
           // 주소 정보 전체 필드 및 내용 확인 : javateacher
           /*  var output = '';
            for (var key in data) {
                output += key + ":" +  data[key]+"\n";
            }
           
            alert(output); */
 
            // 3단계 : 해당 필드들에 정보 입력
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memberZip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('memberAddressBasic').value = fullAddr;
 
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('memberAddressDetail').focus();
        }
    }).open();
}
 
window.onload= function() {
   
    member_update_form.onsubmit = function() {
       
        // alert("전송");
       
        // 점검 항목 :
        // 1) 신규 패쓰워드 폼점검
        // 2) 이메일 폼점검
        // 3) 연락처 폼점검
        // 4) 주소 입력시 상세주소를 입력여부 점검
       
        // 점검 플래그
        let validFlag = 0;
       
        // 1) 신규 패쓰워드 폼점검
        let newPw = document.querySelector("input#memberNewPassword");
        let regexPw = newPw.getAttribute("pattern"); // newPw.pattern
       
        var regex = new RegExp(regexPw);
       
        // 신규 패쓰워드가 공백이면 조건 통과
        if (newPw.value.trim() == '') {
            alert("패쓰워드 공백");
            validFlag++;
        } else { // 신규 패쓰워드가 입력되었을 때
       
            if (!regex.test(newPw.value)) {
                pw_err.innerHTML = newPw.title;        
            } else {
                pw_err.innerHTML = "";
                validFlag++;
            }
        } //
       
        // 2) 이메일 폼점검
        let emailFld = document.querySelector("input#memberEmail");
        let regexEmail = emailFld.getAttribute("pattern"); // emailFld.pattern
       
        var regex = new RegExp(regexEmail);
       
        if (!regex.test(emailFld.value)) {
            email_err.innerHTML = emailFld.title;          
        } else {
            email_err.innerHTML = "";
            validFlag++;
        }
       
        // 3) 연락처 폼점검
        let phoneFld = document.querySelector("input#memberPhone");
        let regexPhone = phoneFld.getAttribute("pattern"); // phoneFld.pattern
       
        var regex = new RegExp(regexPhone);
       
        if (!regex.test(phoneFld.value)) {
            phone_err.innerHTML = phoneFld.title;          
        } else {
            phone_err.innerHTML = "";
            validFlag++;
        }
       
 
        console.log("### 점검 플래그(패쓰워드/이메일/연락처) : "+ validFlag);
       
        // 4) 주소 점검
        var memberZip = document.getElementById("memberZip");
        var memberAddressBasic = document.getElementById("memberAddressBasic");
        var memberAddressDetail = document.getElementById("memberAddressDetail");
       
        console.log("memberZip : "+memberZip.value);
        console.log("memberAddressBasic : "+memberAddressBasic.value);
        console.log("memberAddressDetail : "+memberAddressDetail.value);
       
        // 경우-1
        // 우편번호/기본주소가 입력 되었고 상세주소가 미입력되었을 때
        if (memberZip.value.trim() != '' &&
            memberAddressBasic.value.trim() !='' &&
            memberAddressDetail.value.trim() == '') {
           
            alert("상세 주소를 입력하십시오");
            memberAddressDetail.value = ""; // 초기화
            memberAddressDetail.focus();
            validFlag--;
        } else {
            validFlag++;
        }
       
        // 경우-2
        // 우편번호/기본주소가 미입력되었는데 상세주소가 입력되었을 때
        if (memberZip.value.trim() == '' &&
            memberAddressBasic.value.trim() =='' &&
            memberAddressDetail.value.trim() != '') {
           
            alert("우편번호/기본 주소를 입력하십시오");
            document.getElementById("address_search_btn").focus();
            validFlag--;
        } else {
            validFlag++;
        }
       
        console.log("### 점검 플래그(패쓰워드/이메일/연락처/주소) : "+ validFlag);
       
        // 전송 가능 최종 점검
        if (validFlag == 5) {
           
            alert("전송 !");
           
        } else {
           
            alert("폼점검 실패");
            member_update_form.reset();
            return false; // 전송 금지
        } //    
               
    } // onsubmit
};
</script>
</head>
<body>
 
    <div id="wrap" class="mx-auto" style="width:800px;">
   
    <!-- 개별 회원 수정폼 -->
    <form id="member_update_form"
          name="member_update_form"
          method="post"
          action="../member/member_update_proc.do"
          novalidate>
         
        <table id="member_view_tbl"
               class="table table-bordered">
            <!-- 아이디 -->
            <tr>
                <td>
                    <label id="memberId"><span class="req-item">*</span> 아이디 : </label>
                </td>
                <td>${member.memberId}
                    <input type="hidden"
                           id="memberId"
                           name="memberId"
                           value="${member.memberId}"/>
                </td>
            </tr>
           
            <!-- 패쓰워드 -->
            <tr>
                <td>
                    <label id="memberPassword"><span class="req-item">*</span> 패쓰워드 : </label>
                </td>
                <td>${member.memberPassword}
                    <input type="hidden"
                           id="memberPassword"
                           name="memberPassword"
                           value="${member.memberPassword}"/>
                </td>
            </tr>
           
            <!-- 신규 패쓰워드 -->
            <tr>
                <td>
                    <label id="memberNewPassword"> 신규 패쓰워드 : </label>
                </td>
                <td>
                    <input type="password"
                           id="memberNewPassword"
                           name="memberNewPassword"
                           size="25"
                           class="form-control"
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
                           title="패쓰워드는 영문대소문자/특수문자/숫자 조합하여 8~20자로 입력하십시오"                           
                           value="" /> 
                           
                    <!-- 패쓰워드 에러 메시지 -->
                    <span id="pw_err" class="err_msg"></span>        
                </td>
            </tr>
           
            <!-- 이름 -->
            <tr>
                <td>
                    <label id="memberName"><span class="req-item">*</span> 이름 : </label>
                </td>
                <td>${member.memberName}
                    <input type="hidden"
                           id="memberName"
                           name="memberName"
                           value="${member.memberName}" />
                </td>
            </tr>
           
            <!-- 성별 -->
            <tr>
                <td>
                    <label id="memberGender"><span class="req-item">*</span> 성별 : </label>
                </td>
                <td>
                    ${member.memberGender == 109 ? '남자' : '여자'}
                    <input type="hidden"
                           name="memberGender"
                           value="${member.memberGender}" />
                </td>
            </tr>
           
            <!-- 메일  -->
            <tr>
                <td>
                    <label for="memberEmail"><span class="req-item">*</span> 이메일 : </label>
                </td>
                <td>
                    <input type="email"
                           id="memberEmail"
                           name="memberEmail"
                           class="form-control"
                           pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"
                           title="이메일을 입력하세요"
                           value="${member.memberEmail}" />
                           
                    <!-- 이메일 에러 메시지 -->
                    <span id="email_err" class="err_msg"></span>       
                </td>
            </tr>
           
            <!-- 연락처  -->
            <tr>
                <td>
                    <label for="memberPhone"><span class="req-item">*</span> 연락처 : </label>
                </td>
                <td>
                    <div class="row">
                        <div class="col-sm-8 mr-0">
                            <input type="text"
                                   id="memberPhone"
                                   name="memberPhone"
                                   class="form-control"
                                   pattern="01\d{1}-\d{3,4}-\d{4}"
                                   title="전화번호는 우측 예시와 같이 입력하십시오"
                                   value="${member.memberPhone}"/>
                           </div>
                        <div class="col-sm-4 mt-1 pl-0">       
                            ex) 010-1234-5678
                        </div>
                    </div> 
                   
                    <!-- 연락처 에러 메시지 -->
                    <span id="phone_err" class="err_msg"></span>   
                </td>
            </tr>
           
            <!-- 생년월일 -->
            <tr>
                <td>
                    <label for="memberBirth"><span class="req-item">*</span> 생년월일 : </label>
                </td>
                <td><fmt:formatDate value="${member.memberBirth}"
                                    pattern="yyyy년 M월 d일" />
                    <input type="hidden"
                           id="memberBirth"
                           name="memberBirth"
                           value="${member.memberBirth}"/>
                </td>
            </tr>
           
            <!-- 우편번호 -->
            <tr>
                <td>
                    <label for="memberZip"> 우편번호 : </label>
                </td>
                <td>
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="text"
                                   id="memberZip"
                                   name="memberZip"
                                   class="form-control"
                                   readonly
                                   value="${member.memberZip}"/>
                        </div>   
                        <div class="col-sm-9">
                            <input type="button"
                                   value="주소 검색"
                                   id="address_search_btn"
                                   class="btn btn-primary"
                                   onclick="getPostcodeAddress()" />
                        </div>
                    </div>         
                </td>
            </tr>
           
            <!-- 기본 주소 -->
            <tr>
                <td>
                    <label for="memberAddressBasic"> 기본 주소 : </label>
                </td>
                <td>
                    <input type="text"
                           id="memberAddressBasic"
                           name="memberAddressBasic"
                           class="form-control"
                           pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
                           title="기본 주소를 입력하세요"
                           maxlength="200"
                           readonly
                           value="${fn:split(member.memberAddress, '*')[0]}"/>
                </td>
            </tr>
           
            <!-- 상세 주소 -->
            <tr>
                <td>
                    <label for="memberAddressDetail"> 상세 주소 : </label>
                </td>
                <td>
                    <input type="text"
                           id="memberAddressDetail"
                           name="memberAddressDetail"
                           class="form-control"
                           pattern="[\w | \W | 가-힣 | / | -]{2,100}"
                           title="상세 주소를 입력하세요"
                           maxlength="100"
                           value="${fn:split(member.memberAddress, '*')[1]}" />
                </td>
            </tr>
 
        </table>     
       
        <!-- 전송/취소 -->
        <div class="mx-auto" style="width:100px">
            <button type="submit" id="update_submit_btn" class="btn btn-primary">전송</button>
            <button type="reset" class="btn btn-primary">취소</button>
        </div>
       
    </form>
    <!--// 회원 수정폼-->
   
    </div>
   
</body>
</html>
