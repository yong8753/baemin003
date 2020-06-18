<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxpath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>NoticeUpdateForm.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>



	<div class="sw-center w3-section">
		<div class="sw-container-500">
			<div class="w3-card">
				<div class="main w3-padding">
					<p>
						<label class="w3-text"><b>글번호</b></label> <input
							class="w3-input w3-border" name="no" id="no" type="text"
							value="${dto.no}" readonly>
					</p>

					<p>
						<label class="w3-text"><b>글제목</b></label> <input
							class="w3-input w3-border" name="title" name="title" type="text"
							value="${dto.title}" readonly>
					</p>

					<p>
						<label class="w3-text"><b>글내용</b></label>
						<textarea class="w3-input w3-border" rows="5" cols="50"
							name="content" id="content" style="resize: none;" readonly>${dto.content}</textarea>
					</p>

					<p>
						<label class="w3-text"><b>작성일</b></label> <input
							class="w3-input w3-border" name="startdate" name="startdate"
							type="text" value="${dto.startDate}" readonly>
					</p>

					<p>
						<label class="w3-text"><b>종료일</b></label> <input
							class="w3-input w3-border" name="enddate" name="enddate"
							type="text" value="${dto.endDate}" readonly>
					</p>
					&nbsp;

					<p align="center">
						<button class="w3-button w3-baemint" onclick="noticeload2()">글목록</button>
					</p>

				</div>
			</div>
		</div>
	</div>




</body>
</html>