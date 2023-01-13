<%@ include file="inc/incCabec.jsp"%><%@ page import="javax.mail.*, javax.mail.internet.*, java.io.*" %><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);

	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String 	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );

	if ( (! txtSss.equals(session.getId())) || ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA ) )
	{
		txtSss							=	"...";
	}

	String	txtColaborador				=	UTLUtils.getStringToString( request.getParameter("txtColaborador") );
	String	txtCad						=	UTLUtils.getStringToString( request.getParameter("txtCad") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	String	txtCpf						=	UTLUtils.getStringToString( request.getParameter("txtCpf") );
	String	txtNome						=	UTLUtils.getStringToString( request.getParameter("txtNome") );
	String	txtIdt						=	UTLUtils.getStringToString( request.getParameter("txtIdt") );
	String 	txtEnd						=	UTLUtils.getStringToString( request.getParameter("txtEnd") );
	String	txtCep						=	UTLUtils.getStringToString( request.getParameter("txtCep") );
	String	txtPix						=	UTLUtils.getStringToString( request.getParameter("txtPix") );
	String	txtEnc						=	UTLUtils.getStringToString( request.getParameter("txtEnc") );
	String	txtBnc						=	UTLUtils.getStringToString( request.getParameter("txtBnc") );
	String	txtAgn						=	UTLUtils.getStringToString( request.getParameter("txtAgn") );
	String	txtCta						=	UTLUtils.getStringToString( request.getParameter("txtCta") );
	String	txtFav						=	UTLUtils.getStringToString( request.getParameter("txtFav") );
	String	txtEml						=	UTLUtils.getStringToString( request.getParameter("txtEml") );
	String	txtReset					=	UTLUtils.getStringToString( request.getParameter("txtReset") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	String	txtPercClb					=	UTLUtils.getStringToString( request.getParameter("txtPercClb") );

	String	strBtn						=	"New Coordinator";
	String	strMensagem					=	UTLUtils.getBranco();
	String	btnContratos				=	UTLUtils.getBranco();
	boolean bExcluir					=	false;
	
	if ( txtAcao.equals("modificar") )
	{
		long lCodigo					=	Long.parseLong( txtColaborador );
		CADColaborador _colaborador		=	new CADColaborador( lCodigo, conn );
		txtCad							=	_colaborador.getAcesso() + "";
		txtCrt							=	_colaborador.getCarteira() + "";
		txtCpf							=	_colaborador.getCpf();
		txtNome							=	_colaborador.getNome();
		txtIdt							=	_colaborador.getIdentidade();
		txtEnd							=	_colaborador.getEndereco();
		txtCep							=	_colaborador.getCep();
		txtPix							=	_colaborador.getPix();
		txtEnc							=	_colaborador.getEnderecoCarteira();
		txtBnc							=	_colaborador.getBanco();
		txtAgn							=	_colaborador.getAgencia();
		txtCta							=	_colaborador.getContaCorrente();
		txtFav							=	_colaborador.getFavorecido();
		txtEml							=	_colaborador.getEmail();
//	 	txtFranquia						=	_colaborador.getFranquia() + "";
	 	txtFranquia						=	_colaborador.getIdFranquia() + "";
		if ( _colaborador.getPercentualComissao() == 0 )
		{
			txtPercClb					=	UTLUtils.getBranco();
		}
		else
		{
			txtPercClb					=	((int)(_colaborador.getPercentualComissao() * 100)) + "";
		}
		strBtn							=	"Update";
		bExcluir						=	true;
		CADContrato _contrato			=	new CADContrato( 0L, _colaborador.getId(), null, 0, 0, 0, 0, 0, conn );
		if ( _contrato.lidos() > 0 )
		{
			bExcluir					=	false;
//			btnContratos				=	"<br><br><input class=\"btnform\" onclick=\"javascript: Submeter('Ct');\" type=\"button\" name=\"btnAcao\" value=\"Contratos\">";
		}
	}
	if ( txtAcao.equals("excluir") )
	{
		long lCodigo					=	Long.parseLong( txtColaborador );
		CADColaborador _colaborador		=	new CADColaborador( lCodigo, conn );
		try
		{
			_colaborador.delete(conn);
				strMensagem				=	"Coordinator successful updated!";
			}
			catch (SQLException e)
			{
				strMensagem 			= 	"Erro na atualiza\u00E7\u00E3o: " + e;
		}
	}
	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") )
	{
		long lCodigo					=	Long.parseLong( txtColaborador );
		boolean bAtualizar				=	true;
		if ( txtCpf.trim().length() > 2 )
		{
			CADColaborador _busca		=	new CADColaborador( 0, 0, txtCpf, 0, 0, 0, 0, conn );
			if ( _busca.next() )
			{
				if ( lCodigo == 0 || lCodigo != _busca.getId() )
				{
					strMensagem			=	"There is already a Coordinator with this DOCUMENT!";
					bAtualizar			=	false;
				}
			}
		}

		if ( bAtualizar )
		{
			CADColaborador _colaborador		=	new CADColaborador( lCodigo, conn );
			_colaborador.setAcesso					( UTLUtils.getStringToInt(txtCad) );
			_colaborador.setCarteira				( UTLUtils.getStringToInt(txtCrt) );
			_colaborador.setCpf						(txtCpf);
			_colaborador.setNome					(txtNome);
			_colaborador.setIdentidade				(txtIdt);
			_colaborador.setEndereco				(txtEnd);
			_colaborador.setCep						(txtCep);
			_colaborador.setPix						(txtPix);
			_colaborador.setEnderecoCarteira		(txtEnc);
			_colaborador.setBanco					(txtBnc);
			_colaborador.setAgencia					(txtAgn);
			_colaborador.setContaCorrente			(txtCta);
			_colaborador.setFavorecido				(txtFav);
			_colaborador.setEmail					(txtEml);
//			_colaborador.setFranquia				(UTLUtils.getStringToInt(txtFranquia));
			_colaborador.setIdFranquia				(UTLUtils.getStringToLong(txtFranquia));
			if ( txtPercClb.trim().length() == 0 )
			{
				_colaborador.setPercentualComissao	( 0.0D );
			}
			else
			{
				_colaborador.setPercentualComissao	(UTLUtils.getStringToDouble(txtPercClb) / 100	);
			}
			if ( txtAcao.equals("incluir") )
			{
				if ( _colaborador.getEmail().trim().length() == 0 )
				{
					_colaborador.setSenha(_colaborador.getCpf());
				}
				else
				{
					_colaborador.setSenha(_colaborador.getEmail());
				}
			}
			if ( txtReset.equals("reset") )
			{
				if ( txtEml.trim().length() == 0 )
				{
					_colaborador.setSenha(txtCpf);
				}
				else
				{
					_colaborador.setSenha(txtEml);
				}
			}
			try
			{
				_colaborador.atualize( conn );
				strMensagem					=	"Coordinator successful updated!";
			}
			catch (SQLException e)
			{
				strMensagem 				= 	"Erro na atualiza\u00E7\u00E3o: " + e;
				if (txtAcao.equals("incluir"))
				{
					strBtn					=	"Incluir";
				}
			}
			if ( ( txtAcao.equals("incluir") || txtReset.equals("reset") ) && strMensagem.equals("Coordinator successful updated!") )
			{
				try
				{
					String txtFromEmail		=	"Elysium Portal<suporte@servicosespecializados.com.br>";
					String[] arrToEmail		=	new String[1];
					arrToEmail[0]			=	_colaborador.getNome() + "<" + _colaborador.getEmail() + ">";
					String[] arrCCEMail		=	null;
					String[] arrBCCEMail	=	null;
					String	txtAssunto		=	"Your registration of Elysium's Portal";
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
//					strMensagem 			= 	"Senha enviada com sucesso!";
				}

				catch ( MessagingException e )
				{
					strMensagem 			= 	"UTLMail.send(0): " + e;
					e.printStackTrace(System.out);
				}
				catch (Exception e)
				{
					strMensagem 			= 	"UTLMail.send(1): " + e;
					e.printStackTrace(System.out);
				}
			}
		}
	}

	String sBr2							=	"&nbsp;&nbsp;&nbsp;";
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
	}

	strMensagem							=	strMensagem.replace('\'','?').replace('\n',' ');
	UTLCombo acesso						=	new UTLCombo(CADColaborador.CADASTRO);
	UTLCombo carteira					=	new UTLCombo(CADColaborador.CARTEIRA);
	CADFranquias _franquias				=	new CADFranquias( 0L, true, 0, conn );
	UTLCombo franquia					=	_franquias.getCombo();
//	UTLCombo franquia					=	new CADFranquia().getCombo();
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
<title>Elysium Technology</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/javascript" src="inc/js/jquery.js"></script>
    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Coordinator successful updated!") {
			Submeter("V");
			return;
		}
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	// if (document.form1.txtCpf.value!="") {
	// 	document.form1.txtCpf.value = Formatar(document.form1.txtCpf.value);
	// }
	// if ( document.form1.txtColaborador.value == "" || document.form1.txtColaborador.value == "0" ) {
	// 	document.form1.txtCpf.focus();
	// } else {
	// 	document.form1.txtNome.focus();
	// }
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "S") {
		document.form1.action="frmMenu.jsp";
	}
	if (acao == "V") {
		document.form1.action="frmClbCns.jsp";
	}
	if (acao == "Ct") {
		document.form1.txtAcao.value="consultar";
		document.form1.action="frmCntFrq.jsp";
	}
	if (acao == "E") {
		if ( confirm("Do you CONFIRM the EXCLUSION of the Register?") != true ) {
			return;
		}
		document.form1.txtAcao.value="excluir";
	}
	if (acao == "A") {
		if (CampoVazio(document.form1.txtCpf.value)) {
			alert("You need to inform a Document");
			document.form1.txtCpf.focus();
			return;
		} else {
			document.form1.txtCpf.value = Limpa(form1.txtCpf);
		}
		if (CampoVazio(document.form1.txtNome.value)) {
			alert("You need to inform a Name!");
			document.form1.txtNome.focus();
			return;
		}
		if ( document.form1.txtFranquia.selectedIndex < 1 ) {
			alert("You need to inform a Office!");
			document.form1.txtFranquia.focus();
			return;
		}
		if ( ! CampoVazio(document.form1.txtPercClb.value)) {
			if ( valor( document.form1.txtPercClb.value ) > 2 ) {
				alert("You need to inform a % of the Coordinator!");
				document.form1.txtPercClb.focus();
				return;
			}
		}
		if ( document.form1.txtColaborador.value == "" || document.form1.txtColaborador.value == "0" ) {
			document.form1.txtAcao.value = "incluir";
		} else {
			document.form1.txtAcao.value = "atualizar";
		}
		document.form1.action="frmClbCad.jsp";
	}
	varSubmit = true;
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
</script>
<body class="m-0 p-0" onload="javascript: Foco();" style="background-color:#121212;">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-100">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto">
<%@ include file="inc/incSideBar.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form w-100">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table class="col-12 col-lg-6 m-0" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"         id="sWhidt"        value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"       value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"       value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"      value="<%=txtBusca%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"     value="frmClbCad.jsp">
						<input type="hidden" name="txtSss"         id="txtSss"        value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"        value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"        value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"         id="txtFrq"        value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"        value="<%=txtOwn%>">
						<%-- <tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr> --%>
						<tr class="selecF12 col-2" height="40"><td class="col-2 text-center" colspan="2" valign="top">Coordinator Register</td></tr>
						<tr height="26" >
							<td style="color:#fff;">ID:</td>
							<td>
								<div class="flex-nowrap d-flex">
								
								<input class="form-control shadow-sm col-lg-5 col-4 text-center" style="background-color: #e6e6e6;" type="text" name="txtColaborador" id="txtColaborador" size="4" onfocus="javascript: this.blur();" value="<%=txtColaborador%>">
								
<%
	if ( Integer.parseInt(txtAss) != CADColaborador.CADASTRO_CONSULTA )
	{
//		out.write("<img src=\"img/trans1x1.gif\" width=\"120\" height=\"1\" alt=\"\"><label for=\"txtReset\" style=\"cursor:pointer;\" title=\"reiniciar a senha do coordenador\">Reset senha:&nbsp;</label><input type=\"checkbox\" class=\"custom-checkbox \" name=\"txtReset\" id=\"txtReset\" value=\"reset\"></div>");
		out.write("<div class=\" align-items-center d-flex col-6\"><label class=\" m-0\" for=\"txtReset\" style=\"cursor:pointer; color:#fff;\" title=\"reiniciar a senha do coordenador\">Password Reset:</label><input type=\"checkbox\" class=\"custom-checkbox\" name=\"txtReset\" id=\"txtReset\" value=\"reset\"></div>");
	}
%>
								</div>
							</td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Role:</td>
							<td><%=acesso.getCombo("txtCad", "class=\"form-control shadow-sm col-lg-6\" ths=\"1\" prv=\"20\" nxt=\"2\" onkeydown=\"javascript: verTab(event);\" ", txtCad)%></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Document:</td>
							<td><input class="form-control shadow-sm col-lg-6" type="text" name="txtCpf" id="txtCpf" size="14" maxlength="20" ths="2" prv="1" nxt="3" value="<%=txtCpf%>"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Name:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtNome" id="txtNome" size="50" maxlength="60" ths="3" prv="2" nxt="4" onfocus="javascript: this.select();" value="<%=txtNome%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso d-none" height="26" _bgcolor="#f2f2f2">
							<td>Identidade:</td>
							<td><input class="form-control shadow-sm col-lg-6" type="text" name="txtIdt" id="txtIdt" size="18" maxlength="18" ths="4" prv="3" nxt="5" onfocus="javascript: this.select();" value="<%=txtIdt%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Address:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEnd" id="txtEnd" size="50" maxlength="90" ths="5" prv="4" nxt="6" onfocus="javascript: this.select();" value="<%=txtEnd%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Zipcode:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" name="txtCep" id="txtCep" size="8" maxlength="8" ths="6" prv="5" nxt="7" onfocus="javascript: this.select();" value="<%=txtCep%>" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr height="32">
							<td>Office:</td>
							<td><%=franquia.getCombo("txtFranquia", "class=\"form-control shadow-sm col-lg-5\" ths=\"7\" prv=\"6\" nxt=\"8\" onkeydown=\"javascript: verTab(event);\" ", txtFranquia)%></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Network:</td>
							<td><%=carteira.getCombo("txtCrt", "class=\"form-control shadow-sm\" ths=\"7\" prv=\"6\" nxt=\"8\" onkeydown=\"javascript: verTab(event);\" ", txtCrt)%></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Wallet:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEnc" id="txtEnc" size="50" maxlength="50" ths="8" prv="7" nxt="9" onfocus="javascript: this.select();" value="<%=txtEnc%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso d-none" height="26" _bgcolor="#f2f2f2">
							<td>Chave PIX:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtPix" id="txtPix" size="50" maxlength="50" ths="9" prv="8" nxt="10" onfocus="javascript: this.select();" value="<%=txtPix%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso d-none" height="26" _bgcolor="#f2f2f2">
							<td>Banco:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtBnc" id="txtBnc" size="3" maxlength="3" ths="10" prv="9" nxt="11" onfocus="javascript: this.select();" value="<%=txtBnc%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso d-none" height="26" _bgcolor="#f2f2f2">
							<td>Ag&ecirc;ncia:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" name="txtAgn" id="txtAgn" size="4" maxlength="4" ths="11" prv="10" nxt="12" value="<%=txtAgn%>" onfocus="javascript: this.select();" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr class="cabAcesso d-none" height="26" _bgcolor="#f2f2f2">
							<td>Conta:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtCta" id="txtCta" size="20" maxlength="20" ths="12" prv="11" nxt="13" value="<%=txtCta%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso d-none" height="26" _bgcolor="#f2f2f2">
							<td>Favorecido:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtFav" id="txtFav" size="50" maxlength="60" ths="13" prv="12" nxt="14" value="<%=txtFav%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso " height="26" _bgcolor="#f2f2f2">
							<td>% Commission:</td>
							<td><input class="form-control shadow-sm col-lg-2" type="text" name="txtPercClb" id="txtPercClb" size="3" ths="14" prv="12" nxt="15" style="text-align: right;" onchange="javascript: verInformeTaxa();" onfocus="javascript: this.select();" value="<%=txtPercClb%>" onkeydown="javascript:return verNN(event, document.form1.txtFav, document.form1.txtEml);" onkeyup="javascript:verVV(this, 3, 2);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Email:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEml" id="txtEml" size="50" ths="15" prv="14" nxt="20" value="<%=txtEml%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Return" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="<%=strBtn%>" ths="20" prv="12" nxt="21" onkeydown="javascript: return verTab(event);">
									<%=btnContratos%>
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR && bExcluir )
	{
%>
									<br><br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('E');" value="Delete" ths="23" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
								<br>
							</td>
						</tr>
						</form>
						</table>
				</tr>
				</table>
			</div>
			<!--/div-->
			<div class="col-sm text-center"></div>
        </div>
    </div>
<script type="text/Javascript">
function CampoVazio(Campo) {
	r = / /g;
	s = Campo.replace(r, "");
	if (s.length == 0) {
		return true;
	} else {
		return false;
	}
}
function Limpa(Campo) {
	ret = Campo.value;
	ret = ret.replace("/", "");
	ret = ret.replace("-", "");
	ret = ret.replace(".", "");
	ret = ret.replace(".", "");
	ret = ret.replace(".", "");
	ret = ret.replace(",", "");
	return ret
}
function ValidarCGCCPF() {
	if ( CampoVazio(document.form1.txtCpf.value)) return;
	if (!(CheckCC( document.form1.txtCpf ))) {
		alert('CNPJ/CPF inv\341lido!');
		document.form1.txtCpf.value = "";
		document.form1.txtCpf.focus();
	}
//	if ( Limpa(document.form1.txtCpf).length > 11 ) {
//		document.form1.txtPessoaJuridica.checked = true;
//	} else {
//		document.form1.txtPessoaJuridica.checked = false;
//	}
}
var Numeros = ""	;				// Variavel base para calculo CGC/CPF
function Numero ( nn ) {			// Funcao para testar se eh numerico
	var n = "" + nn;
	if (n=="1"||n=="2"||n=="3"||n=="4"||n=="5"||n=="6"||n=="7"||n=="8"||n=="9"||n=="0") {
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
		Texto.value = Formatar(chr);
		return true ;
	} else { 
		return false;
	}
}
function Formatar(Campo) {
	ret = "";
	Mascara = "";
	p   = Campo.length-1;
	if 	(p > 11) {
		Mascara = "00.xxx.xxx/xxxx-xx";
	} else {
		Mascara = "000.xxx.xxx-xx";
	}
	t   = Mascara.length-1;
    for (i=t; i>-1; i--) {
        if (Mascara.charAt(i) == 'x' || Mascara.charAt(i) == '0') {
            if (p>-1) {
                ret = Campo.charAt(p) + ret;
                p--;
            } else {
                if (Mascara.charAt(i) == '0') {
                   ret = Mascara.charAt(i) + ret;
                }
            }
        } else {
           ret = Mascara.charAt(i) + ret;
        }
    }
    return ret;
}
// -------------------- Base Valor/Quantidade ------------------------------- //
var vv = false;		// 	Indica v�rgula do ponto decimal;
var dd = false;		// 	Indica preenchimento das cadas decimais
var tt = false;		//	Indica preenchimento das casas n�o decimais
var xx = false;
function verNN(e, p, n) {
	var e=(typeof event!='undefined')?window.event:e;	// IE : Moz 
	if(e.keyCode==27) {
		tmp = document.form1.txtBuscaProduto.value;
		limpa();
		document.form1.txtBuscaProduto.value = tmp;
		document.form1.txtBuscaProduto.select();
		document.form1.txtBuscaProduto.focus();
		return false;
	}
	if(e.keyCode==13||e.keyCode==39||e.keyCode==41||e.keyCode==9||e.keyCode==34) {
		vv=false; dd = false; tt = false; xx = false;
		n.focus();
		return false; 
	}
	if(e.keyCode==37||e.keyCode==38||e.keyCode==33) {
		vv=false; dd = false; tt = false; xx = false;
		p.focus();
		return false; 
	}
	tc = e.which || e.keyCode
	if (vv && (tc==188||tc==110)) return false;
	if (tc==9||tc==8||tc==109||tc==189) return true;
	if ( xx == false ) {
		dd = false;
		tt = false;
	}
	xx = true;
	if (dd) return false;
	if (tc==188||tc==110) return true;
	if (tt) return false;
	if ( (tc<96||tc>105) && (tc<48||tc>57) ) return false;
	return true;
}
function verVV(campo, v, l) {
	cp = campo.value;
	ps = cp.indexOf(",");
	dd = false;
	tt = false;
	vv = false;
	if (ps > -1) {
		vv = true;
		if ((cp.length - (ps + 1)) == v) {
			dd = true;
		}
	} else {
		vv = false;
		if (cp.length == l) {
			tt = true;
		}
	}
}
// -------------------- Base Valor/Quantidade ------------------------------- //




// -------------------- Change text ------------------------------- //
ordemText = () =>{
	if(txtFranquia.value){
	txtFranquia.options[0].innerText = "Select a Office"
	}
	if(txtCrt.value){
	txtCrt.options[0].innerText = "Select a Network"
	}
	if(txtCad.value){
		txtCad.options[0].innerText = "No Access"
		txtCad.options[1].innerText = "Coordinator"
		txtCad.options[2].innerText = "Executive"
		txtCad.options[3].innerText = "Office"
		txtCad.options[4].innerText = "Financial"
		txtCad.options[5].innerText = "Payment"
		txtCad.options[6].innerText = "Administrative"
	}
}

ordemText()
</script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
