<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container w-500">

	<form action="insert" method="post" enctype="multipart/form-data"
		autocomplete="off">
		<div class="cell center">
			<h1>메뉴등록</h1>
		</div>


		<div class="cell">
			<label>메뉴이미지</label> <input type="file" name="attach">
		</div>
		<div class="cell">
			<label>가게번호(임시)</label> <input type="text" name="storeNo"
				placeholder="가게번호 써라" class="tool w-100">
		</div>


		<div class="cell">
			<label>메뉴이름</label> <input type="text" name="menuName"
				placeholder="메뉴이름써라" class="tool w-100">
		</div>

		<div class="cell">
			<label>메뉴가격</label> <input type="text" name="menuPrice"
				placeholder="메뉴가격써라" class="tool w-100">
		</div>

		<div>
			<button type="submit" class="btn positive"
				style="background-color: rgb(254, 210, 61);">
				<i class="fa-solid fa-user"></i> 메뉴등록
			</button>
		</div>

	</form>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>