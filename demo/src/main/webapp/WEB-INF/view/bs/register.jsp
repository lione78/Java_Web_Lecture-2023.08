<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        td {
            text-align: center;
            font-size: small
        }

        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <img src="/demo/img/ck.png" height="60">
            <div class="p-2 bg-dark justify-content-between">
                <img src="https://picsum.photos/1500/180" width="100%">
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top: 240px;">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <!--enctype : 파일 전송 위하여 인코딩 필요-->
                <form action="/demo/bs/register3" method="post" enctype="multipart/form-data">
                    <table class="table table-borderless">
                        <tr>
                            <td colspan="3" style="text-align: left; font-size: x-large;"
                                class="border border-dark border-2 border-top-0 border-start-0 border-end-0">회원 가입</td>
                        </tr>
                        <tr>
                            <td style="width: 35%;"><label class="col-form-label">사용자 ID</label></td>
                            <td style="width: 50%;"><input type="text" name="id" class="form-control"></td>
                            <td style="width: 15%;"><label class="col-form-label">
                                    <!--eventlistner를 이용-->
                                    <a href="#" id="dupCheck"><span
                                            class="badge bg-secondary"><small>중복확인</small></span></a>
                                </label></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">패스워드</label></td>
                            <td colspan="2"><input type="password" name="pwd" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">패스워드 확인</label></td>
                            <td colspan="2"><input type="password" name="pwd2" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">이름</label></td>
                            <td colspan="2"><input type="text" name="uname" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">이메일</label></td>
                            <td colspan="2"><input type="text" name="email" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">프로필사진</label></td>
                            <td colspan="2"><input type="file" name="profile" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td colspan="2">
                                <input type="radio" name="gender" value="1"> 남자
                                <input type="radio" name="gender" class="ms-3" value="2"> 여자
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <button type="submit" class="btn btn-primary">제출</button>
                                <button type="reset" class="btn btn-secondary ms-2">취소</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="col"></div>
        </div>
    </div>
</body>

</html>