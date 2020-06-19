<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>NoticeList.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
#topnav {
	position: fixed;
	top: 0;
	width: 100%;
	overflow: hidden;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<div style="margin-top: 15px;">
					<h2 onclick="callList()">공지사항</h2>
				</div>

				<div id="whereNoticeLoad"></div>



				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- ------------------------------------------------------------------------------------------------ -->

	<script>
		window.onload = function() {
			callList();
		}
		
		function callList(){
			$("#whereNoticeLoad").load("../notice/NoticeList.do");
		}

		function modalOn() {
			document.getElementById('update').style.display = 'block'
		}
		function modalOff() {
			document.getElementById('update').style.display = 'none'
		}

		function viewNotice(e) {
			console.log(e);
			var a1 = e.children[0].innerText;
			console.log(a1);
			$("#whereNoticeLoad").load("../notice/NoticeView.do?no="+a1);
		}
	</script>



	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />


</body>
</html>