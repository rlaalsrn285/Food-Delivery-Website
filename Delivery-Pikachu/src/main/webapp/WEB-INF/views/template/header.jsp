<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>피카츄배달</title>

<link rel="stylesheet" type="text/css" href="/css/commons.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">
<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- font awesome 아이콘 CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<!-- jQuery CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<style>
.header_wrap {
	display: flex;
	align-items: flex-end;
}

.header_sideMenu {
	font-size: 20px; > a { color : #939393 !important;
	text-decoration: none;
}

}
.header-font-style {
	flex: 1;
	font-weight: bold;
	font-size: 45px;
}

.hr.hr-border {
	border: 0;
	height: 3px;
	background: #fed23d;
}
.hr-border {
	border: 0;
	height: 3px;
	background: #ccc;
}

.footer-atag-style a {
	color: #939393 !important;
	text-decoration: none;
}
.tool {
    height: 30px; /* 원하는 높이로 조정하세요 */
    vertical-align: middle; /* 텍스트를 수직으로 가운데 정렬합니다 */
}
</style>
</head>
<body>
	<main>
		<div class="header">
			<div class="header_wrap">
				<a href="/"><img class="image-test" src="/image/pica.png"
					width="110" height="110"></a>
				<div class="cell center header-font-style">
					<a href="/" style="text-decoration-line: none;">배츄</a>
				</div>
				<div class="header_sideMenu right">
					<c:choose>
						<c:when test="${sessionScope.loginId != null}">
							<a href="/member/mypage"><i class="fa-solid fa-user"></i>
								${sessionScope.loginId}</a>
							<div class="header_sideMenu right">
								<a href="/member/mypage">마이페이지</a>&nbsp; <a
									href="/member/logout">로그아웃</a>
							</div>
						</c:when>
						<c:otherwise>
							<a href="/member/signIn">로그인</a> &nbsp;
                            <a href="/member/signup">회원가입</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr class="hr hr-border">
		</div>

		<div class="section">
			<div class="article">