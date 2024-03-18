<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container w-1000">
	<div class="cell">
		<h1>${memberDto.memberId}님의페이지</h1>
	</div>
	<div class="cell floating-cell">
		<div class="w-25 row">
			<div class="col-md-3">
				<div class="cell center">
					<img src="profilePhoto" width="150" height="150">
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="#">가게등록(임시)</a>
					</h2>
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/member/pwUpdate">비밀번호 변경</a>
					</h2>
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/member/profileEdit">개인정보
							변경</a>
					</h2>
				</div>
				<div class="cell center">
					<h2>
						<a class="link link-animation" href="/member/delete_account"
							style="color: red";>회원 탈퇴</a>
					</h2>
				</div>
			</div>
		</div>
		<div class="w-75">
			<div class="cell center">
				<h2>가입 정보</h2>
			</div>
			<div class="cell">
				<table class="table table-horizontal">
					<tr>
						<th width="30%">닉네임</th>
						<td class="left">${memberDto.memberNick}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td class="left">${memberDto.memberEmail}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td class="left">${memberDto.memberContact}</td>
					</tr>

					<tr>
						<th>주소</th>
						<td class="left">[${memberDto.memberPost}]
							${memberDto.memberAddress1} ${memberDto.memberAddress2}</td>
					</tr>
					<tr>
						<th>등급</th>
						<td class="left">${memberDto.memberGrade}</td>
					</tr>
					
				</table>
			</div>



		</div>
	</div>
</div>


<br>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

