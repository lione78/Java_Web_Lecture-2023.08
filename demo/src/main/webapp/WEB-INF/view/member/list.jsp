<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- core : if, foreach --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- fmt : format 날짜 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/head.jspf"%>
	<style>
        th { text-align: center; width: 2%; background-color: dimgray; height: 50px; }
        td { height: 50px; text-align: center; }
    </style>
    <script>
    	function search(){
    		let field = document.getElementById('field').value;
    		let query = document.getElementById('query').value;
    		// console.log("search()", field, query);
    		location.href = '/demo/member/list?f=' + field + '&q=' + query;
    	}    	
    </script>
</head>
<body>
	<%@ include file="./common/top.jspf"%>

	<div class="container" style="margin-top: 80px">
		<div class="row">
			<%@ include file="./common/aside.jspf" %>
			<!-- ================= Main ==================== -->
			<div class="col-9">
				<table class="table table-sm table-borderless">
					<tr>
						<td style="width: 52%; text-align: left;">
							<h3>
								<strong>회원 목록</strong>
							</h3>						
						</td>
						<td style="width: 15%;">
							<select class="form-select" id="field">
		                        <option value="userid" ${field eq 'userid' ? 'selected' : ''}>ID</option>
		                        <option value="uname" ${field eq 'uname' ? 'selected' : ''}>이름</option>
		                        <option value="content" ${field eq 'content' ? 'selected' : ''}>본문</option>
	                    	</select>
						</td>
						<td style="width: 25%;">
							<input class="form-control" placeholder="검색할 내용" id="query" value="${query}"
									onkeyup="if(window.event.keyCode==13) search()"> <%-- Key Up시 13 엔터키 --%>
						</td>
						<td style="width: 8%;">
							<button class="btn btn-outline-primary" onclick="search()">검색</button>
						</td>
					</tr>
				</table>
				<hr>
				<table class="table table-striped">
					<tr class="table-secondary">
						<th style="width: 8%">SID</th>
						<th style="width: 8%">ID</th>
						<th style="width: 14%">이름</th>
						<th style="width: 50%">간략소개</th>
						<th style="width: 20%">가입시간</th>
					</tr>
				<c:forEach var="member" items="${memberList}">
					<tr>											
						<td>${member.sid}</td>
						<td><a href="/demo/member/detail/${member.sid}">${member.userid}</a></td>
						<td>${member.uname}</td>
						<td>${fn:substring(member.content, 0, 30)}</td>
						<td>${fn:replace(fn:substring(member.modTime, 2, 16), 'T', ' ')}</td>
					</tr>
				</c:forEach>
				</table>
			</div>
			<!-- ================= Main ==================== -->
		</div>
	</div>

	<%@ include file="./common/bottom.jspf"%>
</body>
</html>