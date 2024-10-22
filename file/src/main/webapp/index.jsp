<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 업로드 하기</title>
	</head>
	<body>
		<!-- cos.jar 파일을 다운로드 받고, 빌드패스에 추가합니다 -->
		<!-- file을 보낼때에는 반드시 post 방식에, 인코딩 타입은 multipart/form-data로 지정해야 합니다 -->
		<form method="post"
			  enctype="multipart/form-data"
			  action="getfile.jsp">
			<input type="text" name="name">
			<br>
			<input type="file" name="attach">
			<br>
			<input type="submit" value="전송하기">
			
		</form>
	</body>
</html>



