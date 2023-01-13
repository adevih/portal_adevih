<%@ include file="inc/incImport.jsp"%>
<%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}
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
<title>Infinity Company : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>
<link rel="stylesheet" href="css/admStyle.css" type="text/css">
<style>
.btnformm { BORDER-RIGHT: 1px outset; BORDER-TOP: 1px outset; BORDER-LEFT: 1px outset; width: 180px; cursor: pointer; COLOR: #ffffff; BORDER-BOTTOM: 1px outset; FONT-FAMILY: verdana; FONT-SIZE: 12px; HEIGHT: 36px; BACKGROUND-COLOR: #4682b4 }
.btnformn { BORDER-RIGHT: 1px outset; BORDER-TOP: 1px outset; BORDER-LEFT: 1px outset; WIDTH: 100px; cursor: pointer; COLOR: #ffffff; BORDER-BOTTOM: 1px outset; FONT-FAMILY: 'Courier New'; FONT-SIZE: 11px; HEIGHT: 18px; BACKGROUND-COLOR: #4682b4 }
.bt-az { border-color:#46a7f5; background:linear-gradient(to bottom, #86c6f8 5%, #46a7f5 100%); box-shadow:inset 0px 1px 0px 0px #d7ecfd; color:#fff; text-shadow:0px 1px 0px #528009; }

.btn { display: inline-block; font-weight: 90; text-align: center; white-space: nowrap; vertical-align: middle; -webkit-user-select: none;
	-moz-user-select: none; -ms-user-select: none; user-select: none; border: 1px solid transparent; padding: .375rem .75rem; font-size: 1rem;
	line-height: 1.5; border-radius: .25rem; transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out }
@media screen and (prefers-reduced-motion:reduce) { .btn { transition: none 	} }
.btn:focus, .btn:hover { text-decoration: none }
.btn.focus, .btn:focus { outline: 0; box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25) }
.btn.disabled, .btn:disabled { opacity: .65 }
.btn:not(:disabled):not(.disabled) { cursor: pointer }
a.btn.disabled, fieldset:disabled a.btn { pointer-events: none }
.btn-primary { color: #fff; 	background-color: #05A492; 	border-color: #2A626C }
.btn-primary:hover { color: #fff; background-color: #0069d9; border-color: #0062cc }
.btn-primary.focus, .btn-primary:focus { 	box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5) }
.btn-primary.disabled, .btn-primary:disabled { color: #fff; 	background-color: #007bff; border-color: #007bff }
.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle { 	color: #fff; 	background-color: #0062cc; 	border-color: #005cbf }
.btn-primary:not(:disabled):not(.disabled).active:focus, .btn-primary:not(:disabled):not(.disabled):active:focus, .show>.btn-primary.dropdown-toggle:focus { box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5) }

.btn-block { display: block; width: 100% }
.btn-block+.btn-block { margin-top: .5rem }
input[type=button].btn-block, input[type=reset].btn-block, input[type=submit].btn-block { width: 100% }

.btn-group-lg>.btn, .btn-lg { padding: .5rem 1rem; font-size: 1.0rem; line-height: 1.5; border-radius: .3rem }
.btn-group-lg>.btn+.dropdown-toggle-split,.btn-lg+.dropdown-toggle-split { padding-right: .75rem; padding-left: .75rem }


</style>
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/Javascript">
function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
//	alert(document.form1.sWhidt.value + " X " + document.form1.sHeight.value);
	document.form1.btnAcao[0].focus();
}

var varSubmit = false;
function Submeter(acao) {
	if (acao == "Ext") {
		document.form1.txtAcao.value="sair";
		document.form1.action="frmLogin.jsp";
	}
	if (acao == "Cli") {
		document.form1.action="frmCliCns.jsp";
	}
	if (acao == "Clb") {
		document.form1.action="frmClbCns.jsp";
	}
	if (acao == "Cnt") {
		document.form1.action="frmCntCns.jsp";
	}
	if (acao == "Ctf") {
		document.form1.action="frmCntFrqCns.jsp";
	}
	if (acao == "Cip") {
		document.form1.action="frmCipCns.jsp";
	}
	if (acao == "Cbp") {
		document.form1.action="frmCbpCns.jsp";
	}
	if (acao == "Pwd") {
		document.form1.action="frmPwd.jsp";
	}
	if (acao == "Dlr") {
		document.form1.action="frmDlrCns.jsp";
	}
	varSubmit = true;
	document.form1.submit();
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
<table border="0" cellpadding="0" cellspacing="0" height="99%" width="100%" align="center" valign="top">
<tr align="center">
	<td width="10" background="img/_shadow-left.gif" valign="top"><img src="img/_shadow-left-top.gif" width="10" height="10" border="0" alt=""></td>
	<td width="100%" height="100%" bgcolor="#ffffff" valign="top">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr>
			<td bgcolor="#888888" height="1" width="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
			<td bgcolor="#888888" height="1" width="100%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
			<td bgcolor="#888888" height="1" width="1"><img src="img/trans1x1.gif" width="1" height="1" alt=""></td>
		</tr>
		<tr align="center">
			<td bgcolor="#888888" height="100%" width="1"><img src="img/trans1x1.gif" width="1" height="100%" alt=""></td>
			<td width="100%" height="100%" align="center" valign="top">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" align="right">
				<tr class="linhaObsInf">
					<td width="100%" align="right">&nbsp;<%=txtOwn%>&nbsp;</td>
				</tr>
				</table>
				<br>
				<table border="0" cellpadding="0" cellspacing="0" width="30%" height="50%" align="center">
				<tr>
					<td width="100%" height="100%" align="left" valign="top" align="center">
						<table border="0" cellpadding="0" cellspacing="0" align="center">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"  id="sWhidt"  value="<%=sWhidt%>">
						<input type="hidden" name="sHeight" id="sHeight" value="<%=sHeight%>">
						<input type="hidden" name="txtSss"  id="txtSss"  value="<%=txtSss%>">
						<input type="hidden" name="txtAss"  id="txtAss"  value="<%=txtAss%>">
						<input type="hidden" name="txtUid"  id="txtUid"  value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"  id="txtOwn"  value="<%=txtOwn%>">
						<input type="hidden" name="txtAcao" id="txtAcao" value="">
						<tr style="height: 1px;"><td width="80" height="1" style="height: 1px;"><img src="img/trans1x1.gif" width="80" height="1" alt=""></td><td width="100" height="1" style="height: 1px;"><img src="img/trans1x1.gif" width="100" height="1" alt=""></td></tr>
						<tr class="selecF12"><td colspan=2"><img src="img/building.gif" alt="">Portal Corporativo</td></tr>
						<tr><td colspan="2" bgcolor="#999999"><img src="img/trans1x1.gif" width="180" height="1" alt=""></td></tr>
						<tr><td colspan="2" bgcolor="#eeeeee"><img src="img/trans1x1.gif" width="180" height="1" alt=""></td></tr>
						<tr class="cabAcesso" height="26">
							<td colspan="2" align="center">
								<br>
								<div style="width: 220px;">
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
%>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o do cadastro de cliente" onclick="javascript: Submeter('Cli');" value="Cliente" ths="1" nxt="2" prv="20" onkeydown="javascript: return verTab(event);">Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o do cadastro de coordenador" onclick="javascript: Submeter('Clb');" value="Coordenador"  ths="2" nxt="3" prv="1" onkeydown="javascript: return verTab(event);">Coordenador</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o do cadastro de contratos" onclick="javascript: Submeter('Cnt');" value="Contratos" ths="3" nxt="4" prv="2" onkeydown="javascript: return verTab(event);">Contratos</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="consulta do cadastro de contratos por franquia" onclick="javascript: Submeter('Ctf');" value="Contratos / Franquia" ths="4" nxt="5" prv="3" onkeydown="javascript: return verTab(event);">Contratos / Franquia</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o de pagamentos � clientes" onclick="javascript: Submeter('Cip');" value="Pagamentos Cliente" ths="5" nxt="6" prv="4" onkeydown="javascript: return verTab(event);">Pagamentos Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o de pagamentos � coordenador" onclick="javascript: Submeter('Cbp');" value="Pagamentos Coordenador" ths="6" nxt="7" prv="5" onkeydown="javascript: return verTab(event);">Pagamentos Coordenador</button>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_EXECUTIVO )
	{
%>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o do cadastro de cliente" onclick="javascript: Submeter('Cli');" value="Cliente" ths="1" nxt="2" prv="20" onkeydown="javascript: return verTab(event);">Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o do cadastro de contratos" onclick="javascript: Submeter('Cnt');" value="Contratos" ths="3" nxt="4" prv="2" onkeydown="javascript: return verTab(event);">Contratos</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o de pagamentos � clientes" onclick="javascript: Submeter('Cip');" value="Pagamentos Cliente" ths="4" nxt="5" prv="3" onkeydown="javascript: return verTab(event);">Pagamentos Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o de pagamentos � coordenador" onclick="javascript: Submeter('Cbp');" value="Pagamentos Coordenador" ths="5" nxt="20" prv="4" onkeydown="javascript: return verTab(event);">Pagamentos Coordenador</button>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o do cadastro de contratos" onclick="javascript: Submeter('Cnt');" value="Contratos" ths="3" nxt="4" prv="2" onkeydown="javascript: return verTab(event);">Contratos</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o de pagamentos � coordenador" onclick="javascript: Submeter('Cbp');" value="Pagamentos Coordenador" ths="5" nxt="20" prv="4" onkeydown="javascript: return verTab(event);">Pagamentos Coordenador</button>
<%
	}
%>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten��o das cota��es do dolar" onclick="javascript: Submeter('Dlr');" value="Cota��o Dolar" ths="6" nxt="20" prv="5" onkeydown="javascript: return verTab(event);">Cota��o Dolar</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="altera��o da senha de acesso" onclick="javascript: Submeter('Pwd');" value="Senha" ths="6" nxt="20" prv="5" onkeydown="javascript: return verTab(event);">Senha</button>
								</div>
									<br><br>
								<input class="btnform" type="button" name="btnAcao" title="sair do sistema" onclick="javascript: Submeter('Ext');" value="Sair" ths="20" nxt="1" prv="5" onkeydown="javascript: return verTab(event);">
									<br><br>
							</td>
						</tr>
						</form>
						</table>
							
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
</body>
<script type="text/Javascript">
function tab(e) {
	e = window.event || e;
	o = e.target || e.srcElement;
	kc  = e.which || e.keyCode;
	ret = null;
	if (o.tagName == "INPUT" && (o.type == "button" || o.type == "BUTTON") && kc == 13) {
		o.click();
		return ;
	}
	if ( (o.tagName != "SELECT" && (kc == 40 || kc == 38 || kc == 13 || kc == 9)) || (o.tagName == "SELECT" && (kc == 37 || kc == 39 || kc == 13 || kc == 9)) ) {
		prv = o.getAttribute("prv");
		nxt = o.getAttribute("nxt");
		for (i=0;i<form1.length; i++) {
			if (o.tagName == "SELECT") {
				if (kc == 37) {
					if (form1[i].getAttribute("ths") == prv) {
						ret = form1[i];
						break;
					}
				} else {
					if (form1[i].getAttribute("ths") == nxt) {
						ret = form1[i];
						break;
					}
				}
			} else {
				if (kc == 38) {
					if (form1[i].getAttribute("ths") == prv) {
						ret = form1[i];
						break;
					}
				} else {
					if (form1[i].getAttribute("ths") == nxt) {
						ret = form1[i];
						break;
					}
				}
			}
		}
	}
	if (ret != null) {
		if (ret.style.display == "none") {
			tab(ret);
		} else {
			ret.focus();
		}
	}
}
</script>
</html>