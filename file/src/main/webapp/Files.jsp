<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<form name="files" method="post" enctype="multipart/form=data" action="getfiles.jsp">
		<input type="file" name="file1"><br>
		<input type="file" name="file2"><br>
		<input type="file" name="file3"><br>
		<input type="file" name="file4"><br>
		<input type="file" name="file5"><br>
		<input type="submit" value="전송하기">
		</form>
	</body>
</html>