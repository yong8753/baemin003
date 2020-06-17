<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${list.size() < 0.5}">
	<div class="w3-container w3-center">
		<%-- 칸 띄우기 --%>
		<br> <br> <br> <br> <br> <br> <i
			class="fa fa-ban" style="font-size: 70px; color: red"></i>
		<p>죄송합니다</p>
		<p>근처에 가까운 매장이 없습니다.</p>
	</div>
</c:if>

<c:if test="${list.size() > 0.5}">
	<!-- 반복의 시작 -->
	<c:forEach items="${ list }" var="dto">
		<!-- 반복시작 -->
		<div class="w3-panel w3-border-bottom" style="margin: 0px;"
			onclick="go2Shop(this)">
			<div class="w3-row w3-section">
				<div class="w3-col w3-right" style="width: 55px;">
					<i class="material-icons" style="color: orange;">star</i><strong>
						${dto.rank} </strong>
				</div>
				<div class="w3-rest">
					<h4>
						<b>${dto.shopName}</b>
					</h4>
					<input type="hidden" class="no" value="${dto.no}" />
				</div>
			</div>
			<div class="w3-section">
				<p>${dto.shopAddr}</p>
				<div class="w3-label" style="color: #8C8C8C; font-size: small;">
					${dto.shopCategory}</div>
			</div>
		</div>
		<!-- 반복 끝 -->
	</c:forEach>
	<!-- 반복의 끝 -->

</c:if>