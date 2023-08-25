<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- core : if, foreach --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- fmt : format 날짜 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newline", "\n"); %>
 
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/head.jspf"%>
	<style>
       td {height: 50px;}
    </style>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script>
    	function showModal() {
    		$('#deleteModal').modal('show');
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
				<h3>
					<strong>회원 상세 조회</strong>
					<span style="font-size: 0.6em;">
						<a href="/demo/member/list">
							<i class="ms-5 fa-solid fa-list"></i> 목록
						</a>
						<a href="/demo/member/update/${member.sid}">
							<i class="ms-3 fa-solid fa-pen-to-square"></i> 수정
						</a>
						<a href="javascript:showModal()"></a>
						<button type="button" class="btn btn-outline-primary btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#deleteModal">
            				회원탈퇴
        				</button>
					</span>
				</h3>
				<hr>
				<div class="row">
					<div class="col-8">
						<h6>ID : ${member.userid} | ${fn:replace(fn:substring(member.modTime, 0, 16), 'T', ' ')}</h6>
					</div>
					<div class="col-4 text-end">
						<h5>이름 : ${member.uname}</h5>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-1"></div>
					<div class="col-10">
						${fn:replace(member.content, newline, '<br>')}
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			<!-- ================= Main ==================== -->
		</div>
	</div>
	

	<%@ include file="./common/bottom.jspf"%>
	
	<!-- The Modal -->
    <div class="modal" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">탈퇴 확인</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    정말로 탈퇴하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" 
                    		onclick="location.href='/demo/member/deleteConfirm/${member.sid}'">탈퇴</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>

            </div>
        </div>
    </div>
</body>
</html>