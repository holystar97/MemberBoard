<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<div id="pageList" class="row">
           
    <!-- 페이징(paging) -->
    <ul class="pagination">
 
        <c:choose>
            <c:when test="${pageVO.page <= 1}">
                <!-- 주의) 이 부분에서 bootstrap 페이징 적용시 불가피하게 <a> 기입. <a>없으면 적용 안됨. -->
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/member/viewPaging.do?page=1">이전</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/member/viewPaging.do?page=${pageVO.page - 1}">이전</a>
                </li>
            </c:otherwise>
        </c:choose>
 
        <c:forEach var="a" begin="${pageVO.startPage}" end="${pageVO.endPage}">
 
            <c:choose>
                <c:when test="${a == pageVO.page}">
                    <!-- 주의) 이 부분에서 bootstrap 페이징 적용시 불가피하게 <a> 기입. <a>없으면 적용 안됨. -->
                    <li class="page-item active">
                        <a class="page-link" href="${pageContext.request.contextPath}/member/viewPaging.do?page=${a}">${a}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/member/viewPaging.do?page=${a}">${a}</a>
                    </li>
                </c:otherwise>
            </c:choose>
 
        </c:forEach>
 
        <c:choose>
            <c:when test="${pageVO.page >= pageVO.maxPage}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/member/viewPaging.do?page=${pageVO.page}">다음</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/member/viewPaging.do?page=${pageVO.page + 1}">다음</a>
                </li>
            </c:otherwise>
        </c:choose>
 
    </ul>
 
</div>
