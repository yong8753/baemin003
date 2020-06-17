<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-card-4 w3-border">
	<div class="main w3-padding">

		<div class="w3-section">
			<label class="w3-text"><b>글번호</b></label> <input
				class="w3-input w3-border" name="no" id="no" type="text"
				value="${dto.no }" readonly>
		</div>

		<div class="w3-section">
			<label class="w3-text"><b>글제목</b></label> <input
				class="w3-input w3-border" name="title" name="title" type="text"
				value="${dto.title }" readonly>
		</div>

		<div class="w3-section">
			<label class="w3-text"><b>글내용</b></label>
			<textarea class="w3-input w3-border" rows="5" cols="50"
				name="content" id="content" style="resize: none;" readonly>${dto.content }</textarea>
		</div>

		<div class="w3-section">
			<label class="w3-text"><b>작성일</b></label> <input
				class="w3-input w3-border" name="startdate" name="startdate"
				type="text" value="${dto.startDate }" readonly>
		</div>

		<div class="w3-section">
			<label class="w3-text"><b>종료일</b></label> <input
				class="w3-input w3-border" name="enddate" name="enddate" type="text"
				value="${dto.endDate }" readonly>
		</div>

	</div>
</div>

