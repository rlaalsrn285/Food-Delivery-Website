<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<form action="signin" method="post" autocomplete="off">
	<div class="container w-400">
		<div class="cell center">
			<br> <br>
			<h1>로그인</h1>
		</div>

		<div class="cell">
			<label>아이디</label> <input type="text" name="memberId" required
			class="tool w-100">
		</div>
		<div class="cell">
			<label>비밀번호</label> <input type="password" name="memberPw"
				class="tool w-100">
		</div>
		<div class="cell">
			<button class="btn positive w-100"
				style="background-color: rgb(236, 109, 70);">로그인</button>
		</div>
		<div class="cell btn w-100 kakao""></div>
		<div class="cell center">

			<a href="findId" style="text-decoration-line: none;">아이디 찾기</a> <a
				href="findPw" style="text-decoration-line: none;">비밀번호 찾기</a> <a
				href="signup" style="text-decoration-line: none;">회원가입</a> <br>
			<br> <br> <br> <br> <br>
		</div>

	</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>