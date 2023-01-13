<%@ include file="inc/incCabec.jsp"%>
<%@ page import="java.io.*" %>
<%
	out.write("Archive Creation:<br>");
	File file = new File("teste.txt");
	out.write("<br>AbsolutePath: " + file.getAbsolutePath() );
	out.write("<br>CanonicalPath: " + file.getCanonicalPath() );
	out.write("<br>Path: " + file.getPath() );
%>
<%@ include file="inc/incRodape.jsp"%>
