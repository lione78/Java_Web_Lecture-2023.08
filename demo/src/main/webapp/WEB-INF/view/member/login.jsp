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
				<div class="row mt-5">
					<div class="col-3"></div>
						<div class="col-6">
							 <form action="/demo/member/login" method="post">
			                    <table class="table table-borderless">
			                        <tr>
			                            <td style="width: 30%;"><label class="col-form-label">아아디</label></td>
			                            <td style="width: 70%;"><input type="text" name="email" class="form-control" placeholder="Enter ID"></td>
			                        </tr>
			                        <tr>
			                            <td><label class="col-form-label">패스워드</label></td>
			                            <td><input type="password" name="pwd" class="form-control" placeholder="Enter password"></td>
			                        </tr>
			                        <tr>
			                            <td colspan="2">
			                                <label class="form-check-label">
			                                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
			                                </label>
			                            </td>
			                        </tr>
			                        <tr>
			                            <td colspan="2" style="text-align: center;"><button type="submit" class="btn btn-primary">로그인</button></td>
			                        </tr>
			                    </table>
			                </form>
			            </div>
	                <div class="col-3"></div>
                </div>
			</div>
			<!-- ================= Main ==================== -->
		</div>
	</div>

	<%@ include file="./common/bottom.jspf"%>
</body>
</html>