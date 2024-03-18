<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>메뉴리스트(전부) 테스트용</h1>

<div class="container w-800">
<c:forEach var="menuDto" items="${listAll}">
<div class="flex-cell">
	<div>메뉴이름 : ${menuDto.menuName}</div>
	<br>
	<div>${menuDto.menuPrice} 원</div>
</div>
</c:forEach>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>