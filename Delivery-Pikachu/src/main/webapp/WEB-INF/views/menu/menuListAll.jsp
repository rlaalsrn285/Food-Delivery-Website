<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.containerStyle {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
}
.menu-item img {
	width: 70px;
	height: 70px;
	object-fit: cover;
}
</style>

<h1 class="cell center">메뉴리스트(전부) 테스트용</h1>
<div class="container w-1200 containerStyle">

	<c:forEach var="menuDto" items="${listAll}">
		<div class="cell">
			<div class="flex-cell w-100">

				<div class="cell menu-item">
					<img src="${menuDto.menuImgLink}" width="70" height="70">
				</div>
				<div class="cell w-30">메뉴이름 : ${menuDto.menuName}</div>
				<div class="cell w-30">${menuDto.menuPrice}원</div>
				<div class="cell menu-btn">
					<a href="#">담기</a>
				</div>
			</div>
		</div>
	</c:forEach>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>