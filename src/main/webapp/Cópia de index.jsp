<%
	String txtWhidth						=	request.getParameter("txtWhidth");
	String txtHeight						=	request.getParameter("txtHeight");
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
	String sWhidt							=	"100%";
	String sHeight							=	"100%";
	String sMiddle							=	"90%";
	String sBr								=	"";
	if ( intWhidth < 500 )
	{
		sWhidt								=	txtWhidth;
		sMiddle								=	"80%";
		sBr									=	"<br>";
	}
	else
	{
		if ( intHeight < 800 )
		{
			sWhidt							=	txtWhidth;
			sMiddle							=	"86%";
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="whidth=device-whidth, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<!--meta http-equiv="Pragma" content="no-cache"-->
<meta http-equiv="Expires" content="-1">
<title>PoralFlex :: Infinity Company : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>
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
	//alert("sWhidth: " + sWhidth);
	if ( document.frmLoad.txtWhidth.value == "0") {
		document.frmLoad.txtWhidth.value = window.screen.width;
		document.frmLoad.txtHeight.value = window.screen.height;
		document.frmLoad.submit();
	}
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
<table border="0" cellpadding="0" cellspacing="0" width="<%=sWhidt%>">
<tr>
	<td>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td height="1" bgcolor="#eeeeee"></td></tr>
		</table>
		<table background="img/fundoCab.gif" cellpadding="0" cellspacing="0" width="100%" height="60">
		<tr><td>&nbsp;&nbsp;</td><td align="left"><img src="img/logoInfinity.png" alt="Infinity Company" width="200" height="56" border="0"></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td height="1" bgcolor="#999999"></td></tr>
		<tr><td height="1" bgcolor="#eeeeee"></td></tr>
		<form name="frmLoad" id="frmLoad" method="post"><input type="hidden" name="txtWhidth" id="txtWhidth"value="<%=txtWhidth%>"><input type="hidden" name="txtHeight" id="txtHeight"value="<%=txtHeight%>"></form>
		</table>
	</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" height="<%=sMiddle%>" width="<%=sWhidt%>">
<tr>
	<td width="10" background="img/_shadow-left.gif" valign="top"><img src="img/_shadow-left-top.gif" width="10" height="10" border="0" alt=""></td>
	<td width="100%" height="100%" bgcolor="#ffffff">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr>
			<td bgcolor="#888888" height="1" width="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
			<td bgcolor="#888888" height="1" width="100%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
			<td bgcolor="#888888" height="1" width="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
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
</script>
					</td>
				</tr>
				</table>
			</td>
			<td bgcolor="#888888" width="1"><img src="img/trans1x1.gif" width="1" height="100%" alt=""></td>
		</tr>
		<tr>
			<td bgcolor="#888888" height="1" width="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
			<td bgcolor="#888888" height="1" width="100%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
			<td bgcolor="#888888" height="1" width="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
		</tr>
		</table>
	</td>
	<td width="10" background="img/_shadow-right.gif" valign="top"><img src="img/_shadow-right-top.gif" width="10" height="10" border="0" alt=""></td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" _height="20%" width="<%=sWhidt%>">
<tr>
	<td valign="bottom">
		<table border=0 cellpadding=0 cellspacing=0 width="100%" bgcolor=#87CEFA>
			<form name="frmLogin" id="frmLogin" action="frmLogin.jsp" method="post"><input type="hidden" name="txtWhidth" id="txtWhidth"value="<%=txtWhidth%>"><input type="hidden" name="txtHeight" id="txtHeight"value="<%=txtHeight%>"></form>
			<tr><td bgcolor="#336699" height=1><img src="img/trans1x1.gif" width=15 height=1 alt=""></td></tr>
			<tr><td bgcolor="#ffffff" height=1><img src="img/trans1x1.gif" width=15 height=1 alt=""></td></tr>
			<tr><td class=Texto align=center><img src="img/trans1x1.gif" width=1 height=2 alt=""><br>&copy;&nbsp;2004-2021 PortalFlex Servi&ccedil;os Administrativos&nbsp;<%=sBr%><span class=Texto>ediflex.com.br</span>&nbsp;::&nbsp;<span class=Texto>servicosespecializados.com.br</span><br><img src="img/trans1x1.gif" width=1 height=2 alt=""><br></td></tr>
			<tr><td bgcolor="#336699" height=1><img src="img/trans1x1.gif" width=15 height=1 alt=""></td></tr>
		</table>
	</td>
</tr>
</table>
