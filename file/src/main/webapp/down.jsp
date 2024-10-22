<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
	// 파라메타로 넘어온 물리파일 이름과, 논리파일 이름을 받는다
	request.setCharacterEncoding("UTF-8");
	String orgName = request.getParameter("logiName");
	String phyName = request.getParameter("phyName");
	if( orgName == null || orgName.equals("") ||
		phyName == null || phyName.equals("") ) {
		response.sendRedirect("index.jsp");
	}
	
	System.out.println("원본 파일명 : " + orgName);
	System.out.println("실제 파일명 : " + phyName);
	/* DB에 첨부파일의 원본 파일명과, 실제 파일명을 저장해서 관리 */
	
	// 실제 파일의 절대 경로를 문자열로 완성한다
	String uploadPath = "C:\\workspace\\file\\src\\main\\webapp\\upload";
	phyName = uploadPath + "\\" + phyName;
	// 브라우저의 응답에 파일과 원본 파일명을 담아서 보냅니다
	response.setContentType("application/octet-stream");
	// 원본 파일명을 인코딩 처리
	orgName = URLEncoder.encode(orgName, "UTF-8");
	// 보낼 파일의 이름을 response에 담음
	response.setHeader("Content-Disposition", "attachment; filename=" + orgName );
	
	System.out.println(phyName);
	System.out.println(orgName);
	
	// 파일 객체를 생성해서 스트림으로 전송한다
	// 실제 파일명으로 파일 객체 생성
	File file = new File(phyName);
	// 파일 이름이 담긴 파일 객체로 실제 파일을 읽어옴
	FileInputStream fileIn = new FileInputStream(file);
	// 서블렛의 아웃풋 스트림 객체를 생성
	ServletOutputStream ostream = response.getOutputStream();
	// 파일을 4kb크기로 나눠서 전송
	byte[] outputByte = new byte[4096];
	// 데이터가 읽어와지면, 아웃풋 스트림으로 보냄
	while(fileIn.read(outputByte, 0, 4096 ) != -1){
		ostream.write(outputByte, 0, 4096);
	}
	fileIn.close();
	// 준비된 서블렛의 아웃풋 스트림을 전송한다
	ostream.flush();
	ostream.close();
%>