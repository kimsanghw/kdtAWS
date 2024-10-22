<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fileName = request.getParameter("phyName");
	String logiName = request.getParameter("logiName");
	if( fileName == null || fileName.equals("") ||
		logiName == null || logiName.equals("")	) {
		response.sendRedirect("index.jsp"); return;
	}
	System.out.println("읽을 파일 이름 : " + fileName );
	System.out.println("원본 파일 이름 : " + logiName );
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>첨부파일 확인</title>
	</head>
	<body>
		<img src="./upload/<%= fileName %>">
		<img src="down.jsp?phyName=<%= fileName %>&logiName=<%= logiName %>">
	</body>
</html>