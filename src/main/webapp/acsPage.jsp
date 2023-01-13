<%@ page import="com.flexnet.utl.*"%>
<%
	String 	acsTipo					=	UTLUtils.getStringToString( request.getParameter("acsTipo") );
	String	acsMenu					=	UTLUtils.getStringToString( request.getParameter("acsMenu") );
	String 	acsFil					=	UTLUtils.getStringToString( request.getParameter("acsFil") );
	String 	acsPag					=	UTLUtils.getStringToString( request.getParameter("acsPag") );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<meta charset="ISO-8859-1">
	<title>FlexNet :: ediflex.com.br :: Portal Corporativo : <%=session.getAttribute("EMPRESA_NOME")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>
</head>
<link rel="stylesheet" href="css/admStyle.css" type="text/css">
<frameset rows="61, 100%, 17" frameborder="1" framespacing="0">
    <frame scrolling="no" noresize SRC="acsTop.jsp" name="frmHead" id="frmHead" id="frmHead">
   	<frame scrolling="auto" SRC="acsLogo.jsp" name="frmPage" id="frmPage">
    <frame scrolling="no" noresize SRC="acsFoot.jsp" name="frmFoot" id="frmFoot">
  <noframes>
  <body>Não há suporte</body>
  </noframes>
</frameset>
</html>
