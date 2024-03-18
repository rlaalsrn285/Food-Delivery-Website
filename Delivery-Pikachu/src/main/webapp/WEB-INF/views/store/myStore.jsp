<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.storeImage {
        width: 250px;
        height: 250px;
        display: block; /* 이미지를 블록 레벨 요소로 설정하여 가운데 정렬합니다. */
        margin: 0 auto; /* 이미지를 가운데 정렬합니다. */
    }
</style>

<div class="container w-700">
	
	<div class="cell" style="text-align: center;">
	<br>
	<h1>${storeDto.storeName}</h1>
	<br>
	<img class="storeImage" src="${storeDto.storeImgLink}">
	<div>${storeDto.storeIntro}</div>
	<a href="/store/myStore?storeNo="${storeDto.storeImgLink}></a>
	
	
	</div>
	
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>