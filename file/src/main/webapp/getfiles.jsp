<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
	
	int size = 10*1024*1024;	// 10 * mb * kb = 10mb
	// 업로드 폴더 경로
	String uploadPath = "C:\\workspace\\file\\src\\main\\webapp\\upload";
	MultipartRequest multi = null;
	try{// Multipart로 해석할 내용은 일단 request에 담겨옵니다
		// 인코딩 되어있어 request가 해석을 할수 없을 뿐입니다
		// request에 담긴 파라메타를 Multipart에게 전달해야 합니다
		multi = new MultipartRequest(
				request, // request객체를 넘겨받음
				uploadPath, // 파일을 저장할 경로
				size, // 파일의 최대 크기 설정값
				"UTF-8", // 원본의 인코딩 값 설정
				new DefaultFileRenamePolicy()	// 파일을 저장, 파일명 변경시 필요한 권한에대한 정책을 담당하는 객체
				);
	}catch( Exception e){
		System.out.println(e);
		response.sendRedirect("index.jsp"); return;
	}
	// ※※※※※ request가 아니라 multi에게 요청해야 합니다 ※※※※※
	String name = multi.getParameter("name");
	
	// 파일 이름의 목록을 받아옵니다
	Enumeration<?> files= multi.getFileNames();
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 받기</title>
	</head>
	<body>
		<%
		while( files.hasMoreElements() == true){
			// 파일 이름과 객체를 가져옴
			String fileId = (String) files.nextElement();
			// 물리 저장소에 저장된 실제 파일 이름을 가져옴
			String fileName = (String)multi.getFilesystemName("fileId");
			// 파일 이름이 있으면
			if( fileName != null ){
				// 새로운 파일 이름으로 사용할 문자열을 생성
				String newFileName = UUID.randomUUID().toString();
				// 원본 파일명과, 새로운 파일명을 확인
				String orgName = uploadPath + "\\" + fileName;
				String newName = uploadPath + "\\" + newFileName;
				// File객체를 이용하여, 저장된 파일의 이름을 변경
				File srcFile = new File(orgName);
				File targetFile = new File(newName);
				srcFile.renameTo(targetFile);	// 실제로 파일명이 변경
				out.println("원본파일명 : " + fileName +"<br>");
				out.println("새로운파일명 : " + newFileName +"<br>");
				out.println("저장경로 : " + uploadPath +"<br><hr>");
				// 원본 파일명과, 변경된 파일명을 DB에 저장하여
				// 게시글에 첨부된 파일을 관리
				
			}
		}
		%>
	</body>
</html>