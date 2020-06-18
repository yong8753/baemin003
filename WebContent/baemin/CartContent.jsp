<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<p>&nbsp;</p>
<p></p>
<!-- 반복의 시작 -->
<!-- 3 main content start here!!!----------------------------------------------------------- -->
<c:if test="${list.size()<1}">

	<div class="w3-center">
		<i class="material-icons" style="font-size: 48px; color: red">add_shopping_cart</i>
	</div>
	<div class="w3-center w3-section" style="margin-bottom: 15px;">
		<strong> 메뉴를 담아주세요</strong>
	</div>
</c:if>

<!-- ------------------------------------------------------------------- -->
<c:if test="${list.size()>=1}">
	<c:forEach items="${list}" var="dto">
		<div class="w3-section cartRow">
			<div class="w3-row">
				<div class="w3-col w3-right" style="width: 60px;">
					<button type="button" class="w3-button"
						onclick="deleteFromCart(this)">삭제</button>
				</div>
				<strong class="w3-rest w3-left" style="margin: 8px;">${dto.menu_Name }</strong>
			</div>
			<div class="w3-cyan" style="display: none;">${dto.menu_No }</div>
			<div class="w3-left w3-margin-left w3-margin-right">
				<div class="w3-small" style="color: #8C8C8C; text-align: justify;">
					${dto.menuEx}</div>
			</div>
			<div class="w3-row">
				<div class="w3-col s6">
					<span class="w3-left" style="margin-top: 12px; margin-left: 10px;">${dto.price }</span>
					<span class="w3-left" style="margin-top: 12px; margin-left: 5px;">원</span>
				</div>
				<div class="w3-col s6 w3-margin-bottom">
					<div class="w3-bar w3-border w3-right"
						style="margin-top: 5px; margin-right: 5px; width: 140px;">
						<div class="w3-bar-item w3-button w3-left"
							onclick="countMinus(this)">-</div>
						<div class="w3-bar-item">${dto.count }</div>
						<div class="w3-bar-item w3-button w3-right"
							onclick="countPlus(this)">+</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- 3 main content start here!!!----------------------------------------------------------- -->
	<!-- 반복의 끝 -->
	<div id="cart_shop_no" style="display: none;">${cart_shop_no }</div>
	<div id="cart_total" style="display: none;">${totalPrice }</div>
</c:if>



<script>
	function countMinus(e) {
		console.log("---------------------");
		var a1 = e.parentNode.children[1].innerText;
		console.log(a1);
		var a2 = e.parentNode.parentNode.parentNode.parentNode.children[1].innerText;
		console.log(a2);

		var data = {
			// 항목이름 : 값(변수)
			protocol : 1,
			count : -1,
			menu_No : a2
		}
		aaaa(data);

		setTimeout(loadCartContent, 100);
	}
	function countPlus(e) {
		console.log("+++++++++++++++++++++");
		var a1 = e.parentNode.children[1].innerText;
		console.log(a1);
		var a2 = e.parentNode.parentNode.parentNode.parentNode.children[1].innerText;
		console.log(a2);

		var data = {
			// 항목이름 : 값(변수)
			protocol : 1,
			count : 1,
			menu_No : a2
		}
		aaaa(data);

		setTimeout(loadCartContent, 100);
	}
	function deleteFromCart(e) {
		console.log("****** delete *******");
		var a2 = e.parentNode.parentNode.parentNode.children[1].innerText;
		console.log(a2);

		var data = {
			protocol : 2,
			menu_No : a2
		}
		aaaa(data);

		setTimeout(loadCartContent, 100);
	}

	function aaaa(ddd) {
		$.ajax({
			type : "post",
			url : "../baemin/UpdateCartPro.do",
			//dateType : "json",
			//contentType : "application/json; charset=utf-8",
			data : ddd,
			success : function(result) {
				console.log("result");
				console.log(result);
			},
			error : function(data) {
				console.log(data);
			}
		});
	}
</script>