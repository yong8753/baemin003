<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="result" style="display: none">${result }</div>

<script>
	window.onload = function() {
		var result = document.getElementById("result").innerText;

		console.log("result="+result);
		
		if (result == 1) {
			alert("주문이 성공적으로 접수되었습니다.");
		} else if (result == -1) {
			alert("매장과 연결이 불안정하거나, 영업이 종료되었습니다.");
		}

		location.href = "../baemin/Main.do";
	}
</script>

