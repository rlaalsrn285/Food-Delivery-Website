<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	

<script>
	$(function() {
		$(".btn-address-search").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("[name=memberPost]").val(data.zonecode);
					$("[name=memberAddress1]").val(addr);

					// 커서를 상세주소 필드로 이동한다.
					$("[name=memberAddress2]").focus();
				}
			}).open();
		});

		$(".btn-address-clear").click(function() {
			$("[name=memberPost]").val("");
			$("[name=memberAddress1]").val("");
			$("[name=memberAddress2]").val("");
		});
	});
</script>

<div class="container w-500">
	<form action="signup" method="post" enctype="multipart/form-data"
		autocomplete="off">
		<div class="cell center">
			<h1>회원가입</h1>
		</div>

		<div class="cell">
			<label> 아이디 </label> <input type="text" name="memberId"
				placeholder="영문 대소문자,숫자 8~20" class="tool w-100">
		</div>

		<div class="cell">
			<label> 비밀번호 </label> <input type="password" name="memberPw"
				placeholder="영문 대소문자, 숫자, 특수문자 1개 이상 포함 6~35자" class="tool w-100">
		</div>

		<div class="cell">
			<label> 닉네임 </label> <input type="text" name="memberNick"
				placeholder="한글,숫자 1~9글자" class="tool w-100">
		</div>

		<div class="cell">
			<label>이메일</label> <input type="email" name="memberEmail"
				placeholder="test@kh.com" class="tool w-100">
		</div>

		<div class="cell">
			<label>연락처 </label> <input type="tel" name="memberContact"
				placeholder="- 제외하고 입력" class="tool w-100">
		</div>

		<div class="cell">
			<label>등급</label> <select name="memberGrade" class="w-100">
				<option value="일반회원">일반회원</option>
				<option value="사장님">사장님</option>
				<option value="관리자">관리자</option>
			</select>
		</div>

		<div class="cell">
			<label>주소</label>
			<div class="cell">
				<input type="text" name="memberPost" readonly placeholder="우편번호"
					class="tool" size="6" maxlength="6">
				<button type="button" class="btn positive btn-address-search"
					style="background-color: rgb(254, 210, 61);">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
				<button type="button" class="btn negative btn-address-clear">
					<i class="fa-solid fa-xmark"></i>
				</button>
			</div>
		</div>

		<div class="cell">
			<input type="text" name="memberAddress1" placeholder="기본주소"
				class="tool w-100" readonly>
		</div>
		<div class="cell">
			<input type="text" name="memberAddress2" placeholder="상세주소"
				class="tool w-100">
		</div>

		<div class="cell">
			<label>프로필 이미지</label> <input type="file" name="attach">
		</div>

		<div class="w-100 right">
			<button type="submit" class="btn positive"
				style="background-color: rgb(254, 210, 61);">
				<i class="fa-solid fa-user"></i> 회원가입
			</button>
		</div>




	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>