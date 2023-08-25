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
		td {height: 50px;}
	</style>
</head>
<body>
	<%@ include file="./common/top.jspf"%>

	<div class="container" style="margin-top: 80px">
		<div class="row">
			<%@ include file="./common/aside.jspf" %>
			<!-- ================= Main ==================== -->
			<div class="col-9">
				<form action="/demo/member/update" method="post">
				<input type="hidden" name="sid" value="${member.sid}">
                    <table class="table table-borderless">
                        <tr>
                            <td colspan="3" style="text-align: left; font-size: x-large;"
                                class="border border-dark border-2 border-top-0 border-start-0 border-end-0">회원 정보 수정</td>
                        </tr>
                        <tr>
                            <td style="width: 15%;"><label class="col-form-label">사용자 ID</label></td>
                            <td style="width: 85%;"><input type="text" name="userid" class="form-control" value="${member.userid}"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">패스워드</label></td>
                            <td><input type="password" name="pwd" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">패스워드 확인</label></td>
                            <td><input type="password" name="pwd2" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">이름</label></td>
                            <td><input type="text" name="uname" class="form-control" value="${member.uname}"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">이메일</label></td>
                            <td><input type="text" name="email" class="form-control" value="${member.email}"></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td>
                                <input type="radio" name="gender" value="1" ${member.gender eq 1 ? 'checked' : ''}> 남자
                                <input type="radio" name="gender" class="ms-3" value="2" ${member.gender eq 2 ? 'checked' : ''}> 여자
                            </td>
                        </tr>
                        <tr>
							<td><label class="col-form-label">자기소개</label></td>
							<td><textarea class="form-control" rows="10" name="content">${member.content}</textarea></td>
						</tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <button type="submit" class="btn btn-primary">제출</button>
                                <button type="reset" class="btn btn-secondary ms-2">취소</button>
                            </td>
                        </tr>
                    </table>
                </form>
			</div>
			<!-- ================= Main ==================== -->
		</div>
	</div>

	<%@ include file="./common/bottom.jspf"%>
</body>
</html>