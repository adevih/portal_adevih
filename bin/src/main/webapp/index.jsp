<%@ include file="inc/incCabec.jsp"%><%@ page import="javax.mail.*, javax.mail.internet.*, java.io.*" %><%
// ================================================================================================
	String txtUsr							=	UTLUtils.getStringToString( request.getParameter("txtUsr") );
	String txtWhidth						=	request.getParameter("sWhidt");
	String txtHeight						=	request.getParameter("sHeight");
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
//	int intWhidth							=	Integer.parseInt(txtWhidth);
//	int intHeight							=	Integer.parseInt(txtHeight);
//	String sWhidt							=	(intWhidth - 22) + "";
//	String sHeight							=	"100";
// ================================================================================================
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
//	String	txtUsr						=	UTLUtils.getStringToString( request.getParameter("txtUsr") );
	String	txtPwd						=	UTLUtils.getStringToString( request.getParameter("txtPwd") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String 	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtMensagem					=	".base.";
	String	txtSss						=	UTLUtils.getBranco();
	String	txtAss						=	UTLUtils.getBranco();
	String	txtUid						=	UTLUtils.getBranco();
	boolean bErro						=	false;
	if ( txtAcao.equals("login") || txtAcao.equals("email") )
	{
		txtMensagem						=	"Usu�rio ou Senha n�o localizados!";
		bErro							=	true;
		CADColaborador _colaborador		=	new CADColaborador( 0, 0L, txtUsr, 0, 0, 0, 0, conn );
		if ( _colaborador.next() )
		{
			if ( txtAcao.equals("login") )
			{
				if ( _colaborador.getAcesso() == CADColaborador.CADASTRO_ADMINISTRADOR 
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_CONSULTA 
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_FRANQUIA
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_FINANCEIRO 
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_PAGAMENTOS 
				  || _colaborador.getAcesso() == CADColaborador.CADASTRO_EXECUTIVO )
				{
					if ( _colaborador.getSenha().equals(txtPwd) )
					{
						txtMensagem		=	"Acesso concedido!";
						txtSss			=	session.getId() + "";
						txtAss			=	_colaborador.getAcesso() + "";
						txtUid			=	_colaborador.getId() + "";
						txtOwn			=	_colaborador.getNome();
//						txtFrq			=	_colaborador.getFranquia() + "";
						txtFrq			=	_colaborador.getIdFranquia() + "";
						bErro			=	false;
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
					String	strProps		=	dir_base + "/Intranet/inf/prp/Mailinf.props";
					UTLMail mail 			=	new UTLMail(dir_base);
					mail.postMail(txtFromEmail, arrToEmail, arrCCEMail, arrBCCEMail, txtAssunto, msg.toString(), htm.toString(), strProps, files);
					txtMensagem 			= 	"Senha enviada com sucesso!";
					bErro					=	true;
				}

				catch ( MessagingException e )
				{
					txtMensagem 			= 	"UTLMail.send(0): " + e;
					bErro					=	true;
					e.printStackTrace(System.out);
				}
				catch (Exception e)
				{
					txtMensagem 			= 	"UTLMail.send(1): " + e;
					e.printStackTrace(System.out);
					bErro					=	true;
				}
			}
		}
	}
%>
<!DOCTYPE html>
<!--<%=txtAcao%>-->
<html lang="pt-br">
	<head>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />
		<!-- Meta tags Obrigat�rias -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>
			Portal Infinity
		</title>
	</head>
	<body class="bg-light" onload="javascript: Foco();">
		<div class="container">
		<div class="row align-items-center">
			<div class="col-sm"></div>
			<div class="col-sm text-center">
			<div class="panel panel-form">
					<img class="g-2" src="img/logo_infinity.png" width="250"/>
					
					<p class="lh-sm">
						<br /><br /><br />
						Bem vindo ao nosso
						Portal Elysium Technology
						<br /><br />
					</p>
					<form class="align-content-center" name="form1" id="form1" method="post">
						<input type="hidden" name="txtAcao" id="txtAcao" value="<%=txtAcao%>">
						<input type="hidden" name="txtSss"  id="txtSss"  value="<%=txtSss%>">
						<input type="hidden" name="txtAss"  id="txtAss"  value="<%=txtAss%>">
						<input type="hidden" name="txtUid"  id="txtUid"  value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"  id="txtFrq"  value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"  id="txtOwn"  value="<%=txtOwn%>">
						<input type="hidden" name="sWhidt"  id="sWhidt"  value="<%=txtWhidth%>">
						<input type="hidden" name="sHeight" id="sHeight" value="<%=txtHeight%>">
						<div class="mb-2">
							<input type="email" class="form-control shadow-sm" _id="user" name="txtUsr" id="txtUsr" placeholder="Usu�rio" aria-describedby="emailHelp">
						</div>
						<div class="mb-4">
							<input type="password" class="form-control shadow-sm" placeholder="Senha" _id="password" name="txtPwd" id="txtPwd">
						</div>
						<div class="mb-2">
							<button type="button" class="btn btn-dark btn-block" onclick="javascript: Submeter('E'); return false;">
								Entrar
							</button>
						</div>
						<div class="mb-3">
							<button type="button" class="btn btn-outline-dark  btn-block" onclick="javascript: Submeter('L'); return false;">
								Esqueci a senha
							</button>
						</div>
<%
	if ( bErro )
	{
%>
						<hr />
						<div class="alert alert-danger" role="alert">
							<%=txtMensagem%>
						</div>
<%
	}
%>
					</form>
				</div>
			</div>
			<div class="col-sm"></div>
			<div class="col-12 align-self-end text-center">
				<p class="m-5">
					<small>
						&copy; 2004-2021 PortalFlex Servi&ccedil;os Administrativos ediflex.com.br :: servicosespecializados.com.br
					</small>
				</p>
			</div>
		</div>
	</div>
	
</body>
<script type="text/Javascript">
strAviso = "<%=txtMensagem%>";
function Foco() {
	if ( document.form1.sWhidt.value == "0") {
		document.form1.sWhidt.value = window.screen.width;
		document.form1.sHeight.value = window.screen.height;
		document.form1.submit();
		return;
	}
	if ( strAviso == "Acesso concedido!" ) {
		Submeter("M");
		return;
	}
	document.form1.txtUsr.focus();
}

var varSubmit = false;
function Submeter(acao) {
	if (acao == "E") {
		if ( CampoVazio(document.form1.txtUsr.value) ) {
			alert("Falta informar o Usu�rio!");
			document.form1.txtUsr.focus();
			return;
		}
		if ( document.form1.txtUsr.value.indexOf("@") > 2 ) {
			if ( ! validateEmail(document.form1.txtUsr.value) ) {
				alert("e-Mail inv�lido!");
				document.form1.txtUsr.select();
				document.form1.txtUsr.focus();
				return;
			}
		}
		document.form1.txtAcao.value = "login";
//		document.form1.action="index.jsp";
	}
	if (acao == "L") {
		if ( CampoVazio(document.form1.txtUsr.value) ) {
			alert("Informe seu CPF (somente os n�meros) ou e-Mail!");
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
//		document.form1.action="login.jsp";
	}
	if (acao == "M") {
//		document.form1.txtAcao.value = "menu";
//		if (document.form1.txtAss.value == '<%=CADColaborador.CADASTRO_CONSULTA%>' ) {
//			document.form1.action="frmCntCns.jsp";	//"frmMenu.jsp";
//		} else {
			if (document.form1.txtAss.value == '<%=CADColaborador.CADASTRO_FINANCEIRO%>' || document.form1.txtAss.value == '<%=CADColaborador.CADASTRO_CONSULTA%>' || document.form1.txtAss.value == '<%=CADColaborador.CADASTRO_FRANQUIA%>') {
				document.form1.txtAcao.value = "consultar";
				document.form1.action="frmCliCnsN.jsp";	//"frmMenu.jsp";
			} else {
				if (document.form1.txtAss.value == '<%=CADColaborador.CADASTRO_PAGAMENTOS%>') {
					document.form1.action="frmCipCns.jsp";
				} else {
					document.form1.action="frmCliCns.jsp";
				}
			}
//		}
	}
	varSubmit = true;
//	alert(document.form1.txtAcao.value + "\n"+ document.form1.action);
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