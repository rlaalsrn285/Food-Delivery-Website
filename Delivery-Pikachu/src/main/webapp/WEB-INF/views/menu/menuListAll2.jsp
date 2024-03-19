<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.container1 {
	display: flex;
	flex-direction: row;
	gap: 20px;
	padding: 20px;
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
}

.menu-item {
	background-color: #ffffff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.menu-item img {
	width: 70px;
	height: 70px;
	object-fit: cover;
}

.menu-details {
	padding: 15px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	align-items: center;
	text-align: center;
}

.menu-name {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.menu-price {
	font-size: 16px;
	color: #666;
}

.menu-btn {
	margin-top: auto; /* 버튼을 맨 아래로 이동 */
}

.menu-btn a {
	display: inline-block;
	background-color: #007bff;
	color: #ffffff;
	padding: 8px 12px;
	border-radius: 4px;
	text-decoration: none;
}

@media (min-width: 768px) {
	.container1 {
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: center;
	}

	.menu-item {
		width: calc(50% - 40px); /* Adjust based on your gap and padding */
	}
}

@media (min-width: 1024px) {
	.menu-item {
		width: calc(33.333% - 40px);
		/* Adjust based on your gap and padding */
	}
}
</style>

<h1>메뉴리스트(전부) 테스트용</h1>
<div class="container1">
	
	<c:forEach var="menuDto" items="${listAll}">
		<div class="menu-item">
			<img src="${menuDto.menuImgLink}" alt="메뉴 이미지">
			<div class="menu-details">
				<div class="menu-name">메뉴이름: ${menuDto.menuName}</div>
				<div class="menu-price">${menuDto.menuPrice}원</div>
				<div class="menu-btn">
					<a href="#">담기</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
