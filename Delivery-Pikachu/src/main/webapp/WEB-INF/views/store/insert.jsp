<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					$("[name=storePost]").val(data.zonecode);
					$("[name=storeAddress1]").val(addr);

					// 커서를 상세주소 필드로 이동한다.
					$("[name=storeAddress2]").focus();
				}
			}).open();
		});

		$(".btn-address-clear").click(function() {
			$("[name=storePost]").val("");
			$("[name=storeAddress1]").val("");
			$("[name=storeAddress2]").val("");
		});
	});
</script>


<div class="container w-700">
	<h2>가게 등록 페이지(임시)</h2>
	<form action="insert" method="post" enctype="multipart/form-data"
		autocomplete="off">

		<div class="cell">
			멤버넘버 임시(나중에히든) <input type="text" name="memberNo"
				value="<%=session.getAttribute("memberNo")%>">
		</div>

		<div>
			<label> 가게 이름</label> <input type="text" name="storeName"
				placeholder="가게 이름을 작성해주세요" class="tool w-100">
		</div>

		<div class="cell">
			<label>주소</label>
			<div class="cell">
				<input type="text" name="storePost" readonly placeholder="우편번호"
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
			<input type="text" name="storeAddress1" placeholder="기본주소"
				class="tool w-100" readonly>
		</div>
		<div class="cell">
			<input type="text" name="storeAddress2" placeholder="상세주소"
				class="tool w-100">
		</div>

		<div class="cell">
			<label> 음식 카테고리</label> <select class="w-100" name="storeCategory">
				<option value="">선택하세요</option>
				<option value="치킨">치킨</option>
				<option value="피자/양식">피자/양식</option>
				<option value="중국집">중국집</option>
				<option value="한식">한식</option>
				<option value="일식/돈까스">일식/돈까스</option>
				<option value="족발/보쌈">족발/보쌈</option>
				<option value="야식">야식</option>
				<option value="분식">분식</option>
				<option value="카페/디저트">카페/디저트</option>
			</select>
		</div>

		<div class="cell">
			<label> 가게 연락처</label> <input type="text" name="storeContact"
				placeholder=" - 제외 숫자만 입력하세요" class="tool w-100">
		</div>

		<div class="cell">
			<label>가게 이미지</label> <input type="file" name="attach" class="w-100">
		</div>

		<div class="cell">
			<label> 가게 소개글 </label>
			<textarea class="tool w-100" name="storeIntro"
				placeholder="10글자이하만(임시)"></textarea>
		</div>

		<div class="cell">
			<label> 배달팁 </label> <input type="text" name="storeDtip"
				placeholder="ex.3,000원" class="tool w-100">
		</div>

		<div class="cell">
			<label> 최소 주문 금액 </label> <input type="text" name="storeMinprice"
				placeholder="ex.12,000원" class="tool w-100">
		</div>

		<div class="cell">
			<label> 영업시간 </label> <select class="w-100" name="storeOpenHour">
				<option value="">운영 시작 시간</option>
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select> <span>부터</span> <select class="w-100" name="storeCloseHour">
				<option value="">운영 종료 시간</option>
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select> <span>까지 운영합니다.</span>
		</div>

		<div class="cell">
			<label> 휴무일 선택 </label> <select name="storeClosed">
				<option value="월요일">월요일</option>
				<option value="화요일">화요일</option>
				<option value="수요일">수요일</option>
				<option value="목요일">목요일</option>
				<option value="금요일">금요일</option>
				<option value="토요일">토요일</option>
				<option value="일요일">일요일</option>
			</select>
		</div>

		<div class="cell">
			<label> 사업자 등록번호 </label> <input type="text"
				name="storeBusinessNumber" placeholder="ex.'-'(하이픈) 없이 입력"
				class="tool w-100">
		</div>

		<div class="w-100 right">
			<button class="btn positive w-100" type="submit">등록하기</button>
		</div>


	</form>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>