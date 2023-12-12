<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<script>
		function upload(){
			const formData = new FormData();
			let title = $('#inputTitle').val();		// String 읽을시
			formData.append('title', title);
			let inputFileVal = $('#inputFile')[0];
			formData.append('file', inputFileVal.files[0]);
			$.ajax({
				type:'POST',
				url: '/sample/file/formAjax',
				data: formData,
				processData: false,		// img 보낼시 false
				contentType: false,		// img 보낼시 false
				success: function(result) {
					// toJSONString으로 받으면 JSON.stringfy 사용
					let obj = JSON.parse(result);
					$('#title').html(obj.title);	// text 파일을 보내 줌
					$('#image').attr({src: '/sample/file/download/' + obj.filename});
				}
			});
		}
	</script>
<body>
	<%@ include file="../common/top.jspf" %>
	<div class="container" style="margin-top:80px">
		<div class="row">
			<%@ include file="../common/aside.jspf" %>
			<!-- ================ Main =================== -->
			<div class="col-9">
				<h3><strong>파일 업로드 by AJAX</strong></h3>
				<hr>
				<div class="row">
					<div class="col-4">
						<div class="card">
							<img class="card-img-top" id="image" src="/sample/img/home.jpg">
							<div class="card-body" align="center" valign="middle">
								<h4 class="card-title" id="title">Home 화면</h4>
							</div>
						</div>
					</div>
					<div class="col-8">
						<table class="table table-borderless">
							<tr>
								<td><label class="col-form-label">제목</label></td>
								<td><input class="form-control" type="text" id="inputTitle"></td>
							</tr>
							<tr>
								<td><label class="col-form-label">파일</label></td>
								<td><input class="form-control" type="file" id="inputFile"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center">
									<button class="btn btn-primary" onclick="upload()">제출</button>
								</td>
							</tr>
						</table>
					</div>					
				</div>
				<form action="/sample/file/formUpload" method="post" enctype="multipart/form-data">
					
				</form>
			</div>
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>

</body>
</html>