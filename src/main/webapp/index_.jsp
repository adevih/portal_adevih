<%
	String txtUsr							=	request.getParameter("usr");
	String txtWhidth						=	request.getParameter("txtWhidth");
	String txtHeight						=	request.getParameter("txtHeight");
	if ( txtUsr == null )
	{
		txtUsr								=	"";
	}
	if ( txtWhidth == null )
	{
		txtWhidth							=	"0";
	}
	if ( txtHeight == null )
	{
		txtHeight							=	"0";
	}
	int intWhidth							=	Integer.parseInt(txtWhidth);
	int intHeight							=	Integer.parseInt(txtHeight);
	String sWhidt							=	(intWhidth - 22) + "";
	String sHeight							=	"100%";
	String sBr								=	"&nbsp;&nbsp;";
	String sMiddle							=	Integer.parseInt(((int)(intHeight * 0.75)) + "") + "";
	if ( intWhidth < 500 )
	{
		sMiddle								=	Integer.parseInt(((int)(intHeight * 0.735)) + "") + "";
		sBr									=	"<br>";
	}
	else
	{
		if ( intHeight < 800 )
		{
			sMiddle							=	Integer.parseInt(((int)(intHeight * 0.75)) + "") + "";
		}
	}
//	System.out.println("intHeight = " + intHeight + ", sMiddle = " + sMiddle);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<link rel="icon" href="img/favIcon.png">
<title>Infinity Company&nbsp;&nbsp;&nbsp;&nbsp;::&nbsp;&nbsp;&nbsp;&nbsp;powered by PortalFlex&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>
<link rel="stylesheet" href="css/admStyle.css" type="text/css">
<style>
BODY         { TEXT-DECORATION: none; BACKGROUND-COLOR: #DBDCDC; 
.Texto       { font-family: verdana; color: #000000; line-height: 12px; text-decoration: none; disply: flex; justify-content: space-between; font-size: 6px;}

@media screen and (max-width: 481px) {
#main, #subnav, #table {
	float: left;
	padding: 0;
	width; 94%;
	margin: 3%;
}
</style>
<script type="text/Javascript">
function Foco() {
sWhidth = window.screen.width;
sHeight = window.screen.height;
	if ( document.frmLoad.txtWhidth.value == "0") {
		document.frmLoad.txtWhidth.value = window.screen.width;
		document.frmLoad.txtHeight.value = window.screen.height;
		document.frmLoad.submit();
	}
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
<table border="1" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td align="center">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td height="1" bgcolor="#eeeeee"></td></tr>
		</table>
		<table background="img/fundoBranco.gif" border="0" cellpadding="0" cellspacing="0" width="100%" _height="60">
		<tr>
			<td width="10%" height="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
			<td width="80%" align="center" height="1">
			<div style="display: none;" id="cabLogo">
<%
	if ( intWhidth > 500 )
	{
%>
				<img src="img/logoInfinityDir.png" alt="Infinity Company" width="149" height="60" border="0">
				<img src="img/logoInfinityEsq.png" alt="Infinity Company" width="122" height="60" border="0">
				<img src="img/logoInfinityCen.png" alt="Infinity Company" width="149" height="60" border="0">
<%
	}
	else
	{
%>
				<img src="img/logoInfinity_3.png" alt="Infinity Company" width="111" height="60" border="0">
<%
	}
%>
			</div>
			</td>
			<td width="10%" height="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
		</tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td height="1" bgcolor="#999999"></td></tr>
		<tr><td height="1" bgcolor="#eeeeee"></td></tr>
		<form name="frmLoad" id="frmLoad" method="post"><input type="hidden" name="txtWhidth" id="txtWhidth"value="<%=txtWhidth%>"><input type="hidden" name="txtHeight" id="txtHeight"value="<%=txtHeight%>"></form>
		</table>
	</td>
</tr>
</table>
<iframe name="frmNav" id="frmNav" src="frmLogin.jsp?sWhidt=<%=intWhidth%>&sHeight=<%=intHeight%>&txtUsr=<%=txtUsr%>" height="<%=sMiddle%>" width="100%" style="border:none;"></iframe>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td valign="bottom">
		<table border=0 cellpadding=0 cellspacing=0 width="100%" bgcolor=#87CEFA>
			<tr height=1><td bgcolor="#336699" height=1></td></tr>
			<tr height=1><td bgcolor="#ffffff" height=1></td></tr>
			<tr><td class=Texto align="center" valign="middle">&copy;&nbsp;2004-2021 PortalFlex Servi&ccedil;os Administrativos<%=sBr%><span class="Texto">ediflex.com.br</span>&nbsp;::&nbsp;<span class="Texto">servicosespecializados.com.br</span></td></tr>
			<tr height=1><td bgcolor="#336699" height=1></td></tr>
		</table>
	</td>
</tr>
</table>
</body>
</html>