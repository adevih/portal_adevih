<%@ include file="inc/incImport.jsp"  	%>
<%
	Long	lngFilial					=	(Long)session.getAttribute("FILIAL");
	String	stFundo						=	"fundoCab10.gif";
	String	sLogo						=	"logoCabAcesso10.gif";
	String	sNomeUsuarioLogado			=	UTLUtils.getStringToString((String)session.getAttribute("NOME"));
	if ( lngFilial != null && lngFilial.longValue() != 0 )
	{ 
		SYSFilial filial				=	new SYSFilial( lngFilial.longValue(), conn );
		stFundo							=	filial.getBackHeader();
		sLogo							=	filial.getLogo();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<meta charset="ISO-8859-1">
	<title>FlexNet Informática</title>
</head>
<style>.nomeUser { FONT-SIZE: 9px; COLOR: #000000; FONT-FAMILY: Arial, verdana; TEXT-ALIGN: right;}</style>
<body leftmargin="0" topmargin="0" bgcolor="#d7d8d8">
<table border=0 cellpadding=0 cellspacing=0 height="100%" width="100%">
<tr height="100%">
	<td valign="top">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td height="1" bgcolor="#ffffff"></td></tr>
		</table>
		<table background="img/<%=stFundo%>" cellpadding="0" cellspacing="0" width="100%" height="60">
		<tr>
			<td width="10"><img src="img/trans1x1.gif" width="10" height="1" alt=""></td>
			<td ><a href="http://www.servicosespecializados.com.br" target="_blank"><img src="img/<%=sLogo%>" alt="visitar o site FlexNet Informática" height="60" border="0"></a></td>
			<td width="100%" class="nomeUser" valign="bottom"><%=sNomeUsuarioLogado%></td>
			<td width="30"><img src="img/trans1x1.gif" width="30" height="1" alt=""></td>
		</tr>
		</table>
	</td>
</tr>
</table>
</body>
</html>
<%@ include file="/inc/incRodape.jsp"  	%>
