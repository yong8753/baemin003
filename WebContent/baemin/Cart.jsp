<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Cart.jsp</title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}

#buttonbar {
	position: fixed;
	bottom: 90px;
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
		<div class="sw-container-500">
			<!-- 3 main content start here!!!----------------------------------------------------------- -->
			<div id="whereCartContentLoad"
				class="w3-center w3-margin w3-round-large"
				style="padding: 10px 0px;">

				<!-- --------------------------------------------------------------- -->
				<!-- -------------    이곳에 장바구니가 load 됩니다.    ---------------------- -->
				<!-- --------------------------------------------------------------- -->


			</div>
		</div>
	</div>

	<!--  buttonbar position fix-->
	<div id="buttonbar" class="w3-row w3-center" style="width: 100%;">
		<div class="w3-row-padding sw-container-500">
			<c:if test="${cart.getCartList().size()>0}">
				<div class="w3-col s6">
					<button class="w3-button w3-baemint w3-block w3-card" type="button"
						onclick="comfirmOrder()">
						<span id="totalPrice">---</span> <span>원 결제</span>
					</button>
				</div>
				<div class="w3-col s6">
					<button class="w3-button w3-baemint w3-block w3-card" type="button"
						onclick="back2shop()">+ 더 주문하기</button>
					<input type="hidden" id="shop_no" value="" />
				</div>

			</c:if>
		</div>
	</div>
	<!--  buttonbar position fix-->


	<script>
		window.onload = function() {
			loadCartContent();
			setTimeout(loadCartContent, 300);
		}

		function comfirmOrder() {
			console.log("주문 완료");
			//location.href = "OrderPro.jsp";
			document.getElementById("commentInputModal").style.display = 'block';
		}

		function back2shop() {
			var shop_No = document.getElementById("shop_no").value;

			if (shop_No.trim().length < 1) {
				location.href = "../baemin/Main.do";
			} else {
				location.href = "../baemin/ShopPage.do?shopNo=" + shop_No;
			}

		}

		function loadCartContent() {
			$("#whereCartContentLoad").load("../baemin/CartContent.do");
			setTimeout(function() {
				var a1 = document.getElementById("cart_total").innerText;
				document.getElementById("totalPrice").innerText = a1;
				var a2 = document.getElementById("cart_shop_no").innerText;
				document.getElementById("shop_no").value = a2;
			}, 200)
		}
	</script>

	<div id="commentInputModal" class="w3-modal w3-border w3-padding">
		<div class="w3-modal-content sw-container-500 w3-round-xlarge w3-padding">
			<form action="../baemin/OrderPro.do" method="post">

				<div class="w3-section w3-center" style="margin-top: 15px;">
					<h6>추가 요청사항을 입력하세요 (선택)</h6>
				</div>
				<div class="w3-row-padding w3-section">
					<input type="text" name="comment" id="comment"
						class="w3-input w3-border" />
				</div>
				<div class="w3-center w3-row-padding w3-section" style="margin-bottom: 15px;">
					<input type="submit" id="go2OrderPro" class="w3-button w3-baemint"
						value="주문 넣기" />
				</div>

			</form>
		</div>
	</div>



	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />
</body>
</html>
