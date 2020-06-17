<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="aa" style="display: none;">${shop_no }</div>


<script>
	window.onload = function() {
		var aa = document.getElementById("aa").innerText.trim();
		console.log(aa);
		console.log(aa);
		console.log(aa);
		location.href = '../baemin/ShopPage.do?shopNo=' + aa;
	}
</script>