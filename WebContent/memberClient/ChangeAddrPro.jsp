<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="aa" style="display: none;">${result }</div>

<script>
	window.onload = function() {

		var result = document.getElementById("aa").innerText.trim();

		if (result == 1) {
			alert('주소가 변경되었습니다.');
		} else {
			alert('주소변경이 실패하였습니다.');
		}
		location.href = "../baemin/Main.do";

	}
</script>
