<%@ include file="inc/incCabec.jsp"%><%@ page import="javax.mail.*, javax.mail.internet.*, java.io.*" %><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtUsr						=	UTLUtils.getStringToString( request.getParameter("txtUsr") );
	String	txtPwd						=	UTLUtils.getStringToString( request.getParameter("txtPwd") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String	txtMensagem					=	UTLUtils.getBranco();
	String	txtSss						=	UTLUtils.getBranco();
	String	txtAss						=	UTLUtils.getBranco();
	String	txtUid						=	UTLUtils.getBranco();
	if ( txtAcao.equals("login") || txtAcao.equals("email") )
	{
		txtMensagem						=	"Usuário ou Senha não localizados!";
		CADColaborador _colaborador		=	new CADColaborador( 0, txtUsr, 0, 0, 0, 0, conn );
		if ( _colaborador.next() )
		{
			if ( txtAcao.equals("login") )
			{
				if ( _colaborador.getAcesso() == CADColaborador.CADASTRO_ADMINISTRADOR 
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_CONSULTA 
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_EXECUTIVO )
				{
					if ( _colaborador.getSenha().equals(txtPwd) )
					{
						txtMensagem		=	"Acesso concedido!";
						txtSss			=	session.getId() + "";
						txtAss			=	_colaborador.getAcesso() + "";
						txtUid			=	_colaborador.getId() + "";
						txtOwn			=	_colaborador.getNome();
					}
				}
			}
			else
			{
				try
				{
					if ( _colaborador.getSenha() == null || _colaborador.getSenha().trim().length() == 0 )
					{
						_colaborador.setSenha(_colaborador.getEmail());
						_colaborador.atualize(conn);
					}
					String txtFromEmail		=	"PortalInfinity<suporte@servicosespecializados.com.br>";
					String[] arrToEmail		=	new String[1];
					arrToEmail[0]			=	_colaborador.getNome() + "<" + _colaborador.getEmail() + ">";
					String[] arrCCEMail		=	null;
					String[] arrBCCEMail	=	null;
					String	txtAssunto		=	"Sua senha do PortalInfinity";
					String[] files			=	null;
					UTLLoadArquivo msg		=	new UTLLoadArquivo( dir_base + "/Intranet/inf/mail/mensagem.txt" );
					msg.add("<!--[DESTINATARIO]-->", _colaborador.getNome());
					msg.add("<!--[SENHA]-->", _colaborador.getSenha());
					UTLLoadArquivo htm		=	new UTLLoadArquivo( dir_base + "/Intranet/inf/mail/mensagem.htm" );
					htm.add("<!--[DESTINATARIO]-->", _colaborador.getNome());
					htm.add("<!--[SENHA]-->", _colaborador.getSenha());
					htm.add("<!--[EMAIL]-->", _colaborador.getEmail());
					String	strProps		=	"/Intranet/inf/prp/Mailinf.props";
					UTLMail mail 			=	new UTLMail(dir_base);
					mail.postMail(txtFromEmail, arrToEmail, arrCCEMail, arrBCCEMail, txtAssunto, msg.toString(), htm.toString(), strProps, files);
					txtMensagem 			= 	"Senha enviada com sucesso!";
				}

				catch ( MessagingException e )
				{
					txtMensagem 			= 	"UTLMail.send(0): " + e;
					e.printStackTrace(System.out);
				}
				catch (Exception e)
				{
					txtMensagem 			= 	"UTLMail.send(1): " + e;
					e.printStackTrace(System.out);
				}
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Elysium Technology</title>
<link rel="stylesheet" href="css/admStyle.css" type="text/css">
<style>
BODY         { TEXT-DECORATION: none; BACKGROUND-COLOR: #DBDCDC; 
.Texto       { font-family: verdana; color: #000000; line-height: 12px; text-decoration: none; disply: flex; justify-content: space-between; font-size: 6px;}
</style>
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/Javascript">
strAviso = "<%=txtMensagem%>";
function Foco() {
	tab = parent.document.getElementById("cabLogo");
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Acesso concedido!") {
			if ( tab.style.display == "none" ) {
				tab.style.display = "block";
			}
			h = parseInt(parent.document.getElementById("frmNav").height) - 60;
			parent.document.getElementById("frmNav").height = h;
			Submeter("A");
			return;
		}
	} else {
		if ( tab.style.display == "block" ) {
			tab.style.display = "none";
			h = parseInt(parent.document.getElementById("frmNav").height) + 60;
			parent.document.getElementById("frmNav").height = h;
		}
	}
	var _corAnt = "";
	_funf = "function () {_corAnt=this.style.backgroundColor;this.style.backgroundColor='#f4fa58';";
	_funb = "function () {this.style.backgroundColor=_corAnt;";
	var f = 0;
	inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++) {
		if ( inputs[i].className == "input" || inputs[i].className == "input2" ) {
			var _onfocus = inputs[i].onfocus + "";
			var _onblur = inputs[i].onblur + "";
			if ( _onfocus.indexOf("{") > -1 ) {
				for (f=_onfocus.length;f>1;f--) {
					if (_onfocus.charAt(f) == '}' ) {
						break;
					}
				}
				_onfocus = _funf + _onfocus.substring(_onfocus.indexOf("{")+1, f);
			} else {
				_onfocus = _funf;
			}
			if ( _onblur.indexOf("{") > -1 ) {
				for (f=_onblur.length;f>1;f--) {
					if (_onblur.charAt(f) == '}' ) {
						break;
					}
				}
				_onblur = _funb + _onblur.substring(_onblur.indexOf("{")+1, f);
			} else {
				_onblur = _funb;
			}
			eval("inputs[i].onfocus=" + _onfocus + "};");
			eval("inputs[i].onblur=" + _onblur +"};" );
		}
	}

	document.form1.txtUsr.focus();
}

var varSubmit = false;
function Submeter(acao) {
	if (acao == "V") {
		document.form1.action="ascLogo.jsp";
	}
	if (acao == "A") {
		document.form1.action="frmMenu.jsp";
	}
	if (acao == "E") {
		if ( CampoVazio(document.form1.txtUsr.value) ) {
			alert("Falta informar o Usuário!");
			document.form1.txtUsr.focus();
			return;
		}
		if ( document.form1.txtUsr.value.indexOf("@") > 2 ) {
			if ( ! validateEmail(document.form1.txtUsr.value) ) {
				alert("e-Mail inválido!");
				document.form1.txtUsr.select();
				document.form1.txtUsr.focus();
				return;
			}
		}
		document.form1.txtAcao.value = "login";
		document.form1.action="frmLogin.jsp";
	}
	if (acao == "L") {
		if ( CampoVazio(document.form1.txtUsr.value) ) {
			alert("Informe seu CPF (somente os números) ou e-Mail!");
			document.form1.txtUsr.focus();
			return;
		}
		if ( ! isNaN(document.form1.txtUsr.value) ) {
			if (!(CheckCC( document.form1.txtUsr ))) {
				alert("Por favor, verifique o CPF informado!")
				document.form1.txtUsr.focus();
				return;
			}
		} else {
			if (!emailValido(document.form1.txtUsr)) {
				alert("Por favor, verifique o e-Mail informado!")
				document.form1.txtUsr.focus();
				return;
			}
		}
		document.form1.txtAcao.value = "email";
		document.form1.action="frmLogin.jsp";
	}
	varSubmit = true;
	document.getElementById("divBtn").style.display = "none";
	document.getElementById("divBtn").style.visibility = "hidden";
	document.getElementById("divPro").style.display = "block";
	document.getElementById("divPro").style.visibility = "visible";
	document.form1.submit();
}

function CampoVazio(Campo) {
	r = / /g;
	s = Campo.replace(r, "");
	if (s.length == 0) {
		return true;
	} else {
		return false;
	}
}

function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
<table border="0" cellpadding="0" cellspacing="0" height="99%" width="100%">
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
			<td width="100%" height="100%" align="center" valign="top">
				<table border="0" cellpadding="0" cellspacing="0" width="30%" height="50%">
				<br><br>
				<tr>
					<td width="100%" height="100%" align="left" valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"  id="sWhidt"  value="<%=sWhidt%>">
						<input type="hidden" name="sHeight" id="sHeight" value="<%=sHeight%>">
						<input type="hidden" name="txtAcao" id="txtAcao" value="<%=txtAcao%>">
						<input type="hidden" name="txtSss"  id="txtSss"  value="<%=txtSss%>">
						<input type="hidden" name="txtAss"  id="txtAss"  value="<%=txtAss%>">
						<input type="hidden" name="txtUid"  id="txtUid"  value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"  id="txtOwn"  value="<%=txtOwn%>">
						<tr><td colspan=2"><img src="img/logoInfinityBemVindo.png" width="299" height="233" alt="Portal Infinity Company"></td></tr>
						<tr><td colspan="2" bgcolor="#999999"><img src="img/trans1x1.gif" width="180" height="1" alt=""></td></tr>
						<tr><td colspan="2" bgcolor="#eeeeee"><img src="img/trans1x1.gif" width="180" height="1" alt=""></td></tr>
						<tr class="cabAcesso" height="26">
							<td>Usu&aacute;rio:</td>
							<td><input class="input" type="text" name="txtUsr" id="txtUsr" size="40" ths="1" prv="3" nxt="2" value="<%=txtUsr%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Senha:</td>
							<td><input class="input" type="password" name="txtPwd" id="txtPwd" ths="2" prv="1" nxt="3" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr><td colspan="2" bgcolor="#999999"><img src="img/trans1x1.gif" width="180" height="1" alt=""></td></tr>
						<tr><td colspan="2" bgcolor="#eeeeee"><img src="img/trans1x1.gif" width="180" height="1" alt=""></td></tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center">
									<input tabindex="-1" class="btnform" type="button" name="btnAcao" onclick="javascript: Submeter('L');" value="Esqueci" ths="4" prv="3" nxt="1" title="Esqueceu a senha? Informe seu CPF (somente os n&uacute;meros) ou e-Mail que n&oacute;s enviamos para seu e-mail." onkeydown="javascript: return verTab(event);">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="btnform" onclick="javascript: Submeter('E');" type="button" name="btnAcao" value="Entrar" ths="3" prv="2" nxt="1" onkeydown="javascript: return verTab(event);">
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
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

function emailValido(email) {
var mail_format = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/;
	if(email.value.match(email)){
		return true;
	} else {
		return false;
	}
}
function Calculo ( Tipo ) {			// Tipo: 1=CPF, 2=CGC
var qtd = 0;
var aux = 0;
var DV1 = 0;
var DV2 = 0;
	if ( Tipo == 1 ) { 
		qtd = 9; 
		aux = 10;
	} else { 
		qtd = 13; 
		aux = 6;
	}
	DV2 = -1;
	DV1 = Digito(qtd, Tipo, aux, DV2);
	aux++ ;
	DV2 = Digito(qtd, Tipo, aux, DV1);
	if ( DV1 != Numeros.charAt(qtd) ) {
		return false
	}
	qtd++;
	if ( DV2 != Numeros.charAt(qtd) ) {
		return false;
	}
	return true
}
function Digito ( Qtd, Ind, Aux, DV) {
var vezes = 0;
var somatoria = 0;
var div = 0;
var mlt = Aux;
	for ( ; vezes < Qtd ; vezes++ ) {
		somatoria = somatoria + (Numeros.charAt(vezes) * mlt);
		mlt-- ;
		if ( mlt == 1 ) {
			mlt = 9 ;
		}
	}
	if ( DV != -1 ) {
		somatoria = somatoria + (DV * 2);
	}
	mlt = Math.floor(somatoria / 11) ;
	mlt = mlt * 11 ;
	somatoria = somatoria - mlt ;
	if ( somatoria > 1 ) { 
		return (11 - somatoria) 
	} else { 
		return 0 
	}
}
function CheckCC( Texto ) {		// Funcao controle do Teste de DV (digito verificador)
var chr = ""			;		// Caracteres para ajustar sem a formatacao
var l = 0				;		// Indice de pesquisa
var qtd = 0				;		// Quantidade de caracteres numericos
var Tx = Texto;
    Numeros = ""		;		// Inicializa a variavel do CGC/CPF
	for (l = 0; l < Tx.value.length ; l++) {
		if ( Numero(Tx.value.charAt(l)) ) {	// Verifica se eh numerico
			chr=chr+Tx.value.charAt(l);		// Extrai o caracter numerico
			qtd++							// Adiciona 1 a quantidade de numericos
		}	
	}
	if ( qtd > 11 ) { 				// Define o tipo de calculo: 1=CPF, 2=CGC
		l = 2; 
		qtd = 15;   
	} else {
		l = 1; 
		qtd = 11; 	
	}
var ini = qtd - chr.length;		// Defines zeros a esquerda
var lop = 0;
	while ( ini != lop ) {			// Preenche zeros a esquerda
		lop++ ;
		Numeros = Numeros + "0" ;
	}
	for (lop = 0; lop < qtd; lop++) { 	// Preenche com o numero digitado
		Numeros = Numeros + chr.charAt(lop) ;
	}
var nmr = "";
	if (l==1) { 
		nmr="CPF" 
	} else { 
		nmr="CGC" 
	}
	if ( Calculo(l) ) { 
//		Texto.value = Formatar(chr);
		return true ;
	} else { 
		return false;
	}
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
