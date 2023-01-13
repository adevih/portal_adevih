<%@ include file="inc/incCabec.jsp"%>
<%@ page import="java.io.*, com.cloudinary.*" %>
<%
	Cloudinary cloudinary = new Cloudinary("cloudinary://315236799838879:JCZI0tNtgAASbGJC6SZ0sixJiSk@hepslkhkv");
	cloudinary.uploader().upload("https://res.cloudinary.com/hepslkhkv/image/upload/v1663621567/Intranet/inf/arq/220827235333_cm4qbp.jpg", com.cloudinary.utils.ObjectUtils.asMap("public_id", "teste_flag"));
%>
<%@ include file="inc/incRodape.jsp"%>