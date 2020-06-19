<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../util/ContextPath.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>MyPageClient.jsp</title>


<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
#topnav {
	position: fixed;
	top: 0;
	width: 100%;
	overflow: hidden;
}

</style>
<script>
	function pwCheck() {
		var pw = document.modalForm.pw.value;
		var pwc = document.modalForm.pwc.value;
		if (pw == pwc && pw.length > 3) {
			console.log("비밀번호 일치");
			document.getElementById("btn").disabled = false;
			pwCk = 1;
		} else {
			console.log("비밀번호 틀림");
			document.getElementById("btn").disabled = true;
			pwCk = 0;
		}
	} //  pwCheck() end

	function rePwCheck() {
		document.getElementById("btn").disabled = true;
	}
</script>
</head>
<body>

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center" style="margin-top: 2%">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-500">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<!--사용자 마이 페이지-->
				<form method="post" action="${ctxpath}/memberClient/UpdateClientForm.do" name="myPageForm">
				<div class="w3-container w3-card">
					<div class="w3-section w3-center">
						<h2>내 정보 보기</h2>
					</div>
					<p>
						<label><b>이름</b></label> <input type="text"
							class="w3-input w3-border" readonly value="${dto.name }">
					</p>

					<p>
						<label><b>아이디</b></label> <input type="text"
							class="w3-input w3-border" readonly value="${dto.id }">
					</p>

					<p>
						<label><b>전화번호</b></label> <input type="text"
							class="w3-input w3-border" readonly name="tel" id="tel"
							value="${dto.tel }">
					</p>

					<p>
						<label><b>주소</b></label> <input type="text"
							class="w3-input w3-border" readonly value="${dto.addr }">

						<label><b>상세주소</b></label> <input type="text"
							class="w3-input w3-border" readonly value="${dto.addr2 }">
					</p>

					<p>
						<label><b>가입일</b></label> <input type="text"
							class="w3-input w3-border" readonly value="${dto.regDate }">
					</p>

					<div class="w3-row-padding w3-section">
						<div class="w3-col s6">
							<input class="w3-button w3-baemint w3-block" type="submit"
								value="정보수정">
						</div>

						<div class="w3-col s6">
							<input class="w3-button w3-baemint w3-block" type="button"
								value="뒤로가기" onclick="javascript:history.back()">
						</div>
					</div>
					<div class="w3-row-padding w3-section">
						<div class="w3-col s6">
							<input class="w3-button w3-baemint w3-block" type="button"
								value="주문내역" onclick="location = '../baemin/OrderList.do'">
						</div>
						<div class="w3-col s6">
							<input class="w3-button w3-baemint w3-block" type="button"
								value="로그아웃" onClick="location='${ctxpath}/util/Logout.do'">
						</div>
					</div>
				</div>
				</form>
				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />

</body>
</html>