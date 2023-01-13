<%@ page import="com.flexnet.utl.*"%><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<title>Elysium Technology</title>
<link rel="stylesheet" href="css/admStyle.css" type="text/css">
<script type="text/Javascript">
function acessoLogin(){
	document.frmLogin.submit();
}
</script>
<body leftmargin="0" topmargin="0">
<table border="0" cellpadding="0" cellspacing="0" height="<%=iHeight%>" width="100%">
<tr>
	<td width="10" background="img/_shadow-left.gif" valign="top"><img src="img/_shadow-left-top.gif" width="10" height="10" border="0" alt=""></td>
	<td width="100%" height="100%" bgcolor="#ffffff">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr height="1">
			<td bgcolor="#888888" height="1" width="1"></td>
			<td bgcolor="#888888" height="1" width="100%"></td>
			<td bgcolor="#888888" height="1" width="1"></td>
		</tr>
		<tr>
			<td bgcolor="#888888" height="100%" width="1"><img src="img/trans1x1.gif" width="1" height="100%" alt=""></td>
			<td width="100%" height="100%">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
				<tr>
					<td width="100%" height="100%" align="right" valign="bottom">
<script language="JavaScript">
w=0;
h=0;
if ( window.screen.width > 500 ) {
	w = parseInt( 400 * window.screen.width / 800 );
	h = parseInt( 325 * window.screen.height / 600 );
} else {
	w = parseInt( 160 );
	h = parseInt( 130 );
}
document.write("<img src=\"img/logoHome.gif\" width=" + w + " height=" + h + " border=\"0\" alt=\"login para acesso ao sistema\" style=\"cursor: pointer;\" onclick=\"javascript: acessoLogin();\">");
</script></td>
				</tr>
				</table>
			</td>
			<td bgcolor="#888888" width="1"><img src="img/trans1x1.gif" width="1" height="100%" alt=""></td>
		</tr>
		<tr height="1">
			<td bgcolor="#888888" height="1" width="1"></td>
			<td bgcolor="#888888" height="1" width="100%"></td>
			<td bgcolor="#888888" height="1" width="1"></td>
		</tr>
		</table>
	</td>
	<td width="10" background="img/_shadow-right.gif" valign="top"><img src="img/_shadow-right-top.gif" width="10" height="10" border="0" alt=""></td>
</tr>
<form name="frmLogin" id="frmLogin" action="frmLogin.jsp" method="post"><input type="hidden" name="sWhidt" id="sWhidt"value="<%=sWhidt%>"><input type="hidden" name="sHeight" id="sHeight"value="<%=sHeight%>"></form></table>
</body>
</html>