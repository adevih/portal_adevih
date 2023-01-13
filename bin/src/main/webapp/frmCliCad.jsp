<%@ include file="inc/incCabec.jsp"%><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);

	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	boolean bExcluir					=	false;

	if ( (! txtSss.equals(session.getId())) || ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA ) )
	{
		txtSss							=	"...";
	}

	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	int		intPagina					=	UTLUtils.getStringToInt( request.getParameter("txtPagina") ) ;
	int		intTotal					=	UTLUtils.getStringToInt( request.getParameter("txtTotal") ) ;
	String	txtPais						=	UTLUtils.getStringToString( request.getParameter("txtPais") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	String	txtCpf						=	UTLUtils.getStringToString( request.getParameter("txtCpf") );
	String	txtNome						=	UTLUtils.getStringToString( request.getParameter("txtNome") );
	String	txtIdt						=	UTLUtils.getStringToString( request.getParameter("txtIdt") );
	String 	txtEnd						=	UTLUtils.getStringToString( request.getParameter("txtEnd") );
	String	txtCep						=	UTLUtils.getStringToString( request.getParameter("txtCep") );
	String	txtPix						=	UTLUtils.getStringToString( request.getParameter("txtPix") );
	String	txtEnc						=	UTLUtils.getStringToString( request.getParameter("txtEnc") );
	String	txtCal						=	UTLUtils.getStringToString( request.getParameter("txtCal") );
	String	txtBnc						=	UTLUtils.getStringToString( request.getParameter("txtBnc") );
	String	txtAgn						=	UTLUtils.getStringToString( request.getParameter("txtAgn") );
	String	txtCta						=	UTLUtils.getStringToString( request.getParameter("txtCta") );
	String	txtFav						=	UTLUtils.getStringToString( request.getParameter("txtFav") );
	String	txtTlg						=	UTLUtils.getStringToString( request.getParameter("txtTlg") );
	String	txtEml						=	UTLUtils.getStringToString( request.getParameter("txtEml") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	String	strBtn						=	"Incluir";
	String	strMensagem					=	UTLUtils.getBranco();
	String	btnContratos				=	UTLUtils.getBranco();

	if ( txtPais.trim().length() == 0 )
	{
		txtPais							=	"0124";		//	Sele��o default pa�s 0124 = BRASIL
	}
	long lPais							=	UTLUtils.getStringToLong( txtPais );

	if ( txtAcao.equals("modificar") )
	{
		long lCodigo					=	Long.parseLong( txtCliente );
		CADCliente _cliente				=	new CADCliente( lCodigo, conn );
		txtCrt							=	_cliente.getCarteira() + "";
		txtCpf							=	_cliente.getCpf();
		txtNome							=	_cliente.getNome();
		txtIdt							=	_cliente.getIdentidade();
		txtEnd							=	_cliente.getEndereco();
		txtCep							=	_cliente.getCep();
		txtPix							=	_cliente.getPix();
		txtEnc							=	_cliente.getEnderecoCarteira();
		txtCal							=	_cliente.getEnderecoAlternativo();
		txtBnc							=	_cliente.getBanco();
		txtAgn							=	_cliente.getAgencia();
		txtCta							=	_cliente.getContaCorrente();
		txtFav							=	_cliente.getFavorecido();
		txtEml							=	_cliente.getEmail();
		txtTlg							=	_cliente.getTelegram();
//	 	txtFranquia						=	_cliente.getFranquia() + "";
	 	txtFranquia						=	_cliente.getIdFranquia() + "";
		lPais							=	_cliente.getIdPais();
		txtPais							=	_cliente.getIdPais() + "";
		strBtn							=	"Atualizar";
		bExcluir						=	true;
		CADContrato _contrato			=	new CADContrato( _cliente.getId(), 0L, null, 0, 0, 0, 0, 0, conn );
		if ( _contrato.lidos() > 0 )
		{
			bExcluir					=	false;
//			btnContratos				=	"&nbsp;<input class=\"btnform\" onclick=\"javascript: Submeter('Ct');\" type=\"button\" name=\"btnAcao\" value=\"Contratos\">";
		}
	}
	if ( txtAcao.equals("excluir") )
	{
		long lCodigo					=	Long.parseLong( txtCliente );
		CADCliente _cliente				=	new CADCliente( lCodigo, conn );
		try
		{
			_cliente.delete(conn);
			strMensagem					=	"Registro atualizado com sucesso!";
		}
		catch (SQLException e)
		{
			strMensagem 				= 	"Erro na atualiza\u00E7\u00E3o: " + e;
		}
	}
	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") )
	{
		long lCodigo					=	Long.parseLong( txtCliente );
		boolean bAtualizar				=	true;
		if ( txtCpf.trim().length() > 2 )
		{
			CADCliente _busca			=	new CADCliente( 0, 0L, txtCpf, 0, 0, 0, 0, conn );
			if ( _busca.next() )
			{
				if ( lCodigo == 0 || lCodigo != _busca.getId() )
				{
					strMensagem			=	"Existe um registro com este CPF!";
					bAtualizar			=	false;
				}
			}
		}
		
		if ( bAtualizar )
		{
			CADCliente _cliente			=	new CADCliente( lCodigo, conn );
			_cliente.setCarteira( UTLUtils.getStringToInt(txtCrt) );
			_cliente.setCpf(txtCpf);
			_cliente.setNome(txtNome);
			_cliente.setIdentidade(txtIdt);
			_cliente.setEndereco(txtEnd);
			_cliente.setCep(txtCep);
			_cliente.setPix(txtPix);
			_cliente.setEnderecoCarteira(txtEnc);
			_cliente.setEnderecoAlternativo(txtCal);
			_cliente.setBanco(txtBnc);
			_cliente.setAgencia(txtAgn);
			_cliente.setContaCorrente(txtCta);
			_cliente.setFavorecido(txtFav);
			_cliente.setEmail(txtEml);
			_cliente.setTelegram(txtTlg);
//			_cliente.setFranquia(UTLUtils.getStringToInt(txtFranquia));
			_cliente.setIdFranquia(UTLUtils.getStringToLong(txtFranquia));
			try
			{
				_cliente.atualize( conn );
				strMensagem				=	"Registro atualizado com sucesso!";
			}
			catch (SQLException e)
			{
				strMensagem 			= 	"Erro na atualiza\u00E7\u00E3o: " + e;
				if (txtAcao.equals("incluir"))
				{
					strBtn				=	"Incluir";
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

	strMensagem							=	strMensagem.replace('\'','�').replace('\n',' ');
	UTLCombo acesso						=	new UTLCombo(CADColaborador.CADASTRO);
	UTLCombo carteira					=	new UTLCombo(CADColaborador.CARTEIRA);
//	CADFranquia _franquia				=	new CADFranquia();
	CADFranquias _franquia				=	new CADFranquias( 0L, true, 0, conn );
	UTLCombo franquia					=	_franquia.getCombo();
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
<title>Elysium Technology</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/javascript" src="inc/js/jquery.js"></script>
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
			Submeter("V");
			return;
		}
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if (document.form1.txtCpf.value!="") {
		document.form1.txtCpf.value = Formatar(document.form1.txtCpf.value);
	}
	if ( document.form1.txtCliente.value == "" || document.form1.txtCliente.value == "0" ) {
		document.form1.txtCpf.focus();
	} else {
		document.form1.txtNome.focus();
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		document.form1.action="frmCliCns.jsp";
	}
	if (acao == "Ct") {
		document.form1.txtAcao.value="consultar";
		document.form1.action="frmCntCns.jsp";
	}
	if (acao == "E") {
		if ( confirm("Confirma a eclus\343o do registro?") != true ) {
			return;
		}
		document.form1.txtAcao.value="excluir";
	}
	if (acao == "A") {
		if (CampoVazio(document.form1.txtCpf.value)) {
			alert("You need to inform a Document!");
			document.form1.txtCpf.focus();
			return;
		} else {
			document.form1.txtCpf.value = Limpa(form1.txtCpf);
		}
		if (CampoVazio(document.form1.txtNome.value)) {
			alert("You need to inform the Name!");
			document.form1.txtNome.focus();
			return;
		}
		if (CampoVazio(document.form1.txtIdt.value)) {
			alert("You need to inform a Document!");
			document.form1.txtIdt.focus();
			return;
		}
		if (CampoVazio(document.form1.txtEnd.value)) {
			alert("You need to inform a Address!");
			document.form1.txtEnd.focus();
			return;
		}
		if ( document.form1.txtCrt.selectedIndex == 0 ) {
			alert("You need to inform a Network!");
			document.form1.txtCrt.focus();
			return;
		}
		if ( document.form1.txtFranquia.selectedIndex < 1 ) {
			alert("You need to inform a Office!");
			document.form1.txtFranquia.focus();
			return;
		}
		if (CampoVazio(document.form1.txtEnc.value)) {
			alert("You need to inform a Wallet Address!");
			document.form1.txtEnc.focus();
			return;
		}
		if ( document.form1.txtCliente.value == "" || document.form1.txtCliente.value == "0" ) {
			document.form1.txtAcao.value = "incluir";
		} else {
			document.form1.txtAcao.value = "atualizar";
		}
		document.form1.action="frmCliCad.jsp";
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
function changeDocument(){
	docto = "CPF";
	if ( document.form1.txtPais[document.form1.txtPais.selectedIndex].value != 124 ) {
		docto = "Passport";
	}
	document.getElementById('cabDoc').innerText = docto;
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
   <div class="wrapper" style="background-color:#121212;">
        <!-- Sidebar  -->
<%@ include file="inc/incSideBar.jsp"%>
        <!-- Page Content  -->
        <div id="content">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="98%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"    id="sWhidt"    value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"   id="sHeight"   value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"   id="txtAcao"   value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"  id="txtBusca"  value="<%=txtBusca%>">
						<input type="hidden" name="txtOrigem" id="txtOrigem" value="frmCliCad.jsp">
						<input type="hidden" name="txtSss"    id="txtSss"    value="<%=txtSss%>">
						<input type="hidden" name="txtAss"    id="txtAss"    value="<%=txtAss%>">
						<input type="hidden" name="txtUid"    id="txtUid"    value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"    id="txtOwn"    value="<%=txtOwn%>">
						<tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="30"><td colspan="2" valign="top">CLIENTE CADASTRO</td></tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>ID:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" style="background-color: #e6e6e6;text-align:center" name="txtCliente" id="txtCliente" size="5" onfocus="javascript: this.blur();" value="<%=txtCliente%>"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Country:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtPais" id="txtPais" _style="width:280px; background-color: #f0f8ff" ths="1" prv="20" nxt="2" onkeydown="javascript: return verTab(event);" onchange="javascript: changeDocument();">
									
<%
	CADPais _pais						=	new CADPais(conn);
	while ( _pais.next() )
	{
		out.write("<option value='" + _pais.getId() );
		if ( _pais.getId() == lPais )
		{
			out.write("' selected>");
		}
		else
		{
			out.write("'>");
		}
		out.write(_pais.getNome());
		out.write("</option>");
	}
%>								
								</select>
							</td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td><span name="cabDoc" id="cabDoc">CPF</span>:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtCpf" id="txtCpf" size="14" maxlength="11" ths="2" prv="1" nxt="3" value="<%=txtCpf%>" onkeydown="javascript: return numeroValido(event);" onfocus="javascript: this.value = Limpa(this); this.select();" onblur="javascript: ValidarCGCCPF();"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Nome:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtNome" id="txtNome" size="50" maxlength="60" ths="3" prv="2" nxt="4" onfocus="javascript: this.select();" value="<%=txtNome%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Identidade:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtIdt" id="txtIdt" size="18" maxlength="18" ths="4" prv="3" nxt="5" onfocus="javascript: this.select();" value="<%=txtIdt%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Endere&ccedil;o:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEnd" id="txtEnd" size="50" maxlength="90" ths="5" prv="4" nxt="6" onfocus="javascript: this.select();" value="<%=txtEnd%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>CEP:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" name="txtCep" id="txtCep" size="8" maxlength="8"  ths="6" prv="5" nxt="7" onfocus="javascript: this.select();" value="<%=txtCep%>" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr height="32">
							<td>Franquia:</td>
							<td><%=franquia.getCombo("txtFranquia", "class=\"form-control shadow-sm col-lg-5\" ths=\"7\" prv=\"6\" nxt=\"8\" onkeydown=\"javascript: verTab(event);\" ", txtFranquia)%></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Carteira:</td>
							<td><%=carteira.getCombo("txtCrt", "class=\"form-control shadow-sm\" ths=\"7\" prv=\"6\" nxt=\"8\" onkeydown=\"javascript: verTab(event);\" ", txtCrt)%></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>End.Carteira:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEnc" id="txtEnc" size="50" maxlength="50" ths="8" prv="7" nxt="9" onfocus="javascript: this.select();" value="<%=txtEnc%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>E.Alternativo:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtCal" id="txtCal" size="50" maxlength="50" ths="9" prv="8" nxt="10" onfocus="javascript: this.select();" value="<%=txtCal%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Chave PIX:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtPix" id="txtPix" size="50" maxlength="50" ths="10" prv="9" nxt="11" onfocus="javascript: this.select();" value="<%=txtPix%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Banco:</td>
							<td><input class="form-control shadow-sm col-lg-4" type="text" name="txtBnc" id="txtBnc" size="15" maxlength="15" ths="11" prv="10" nxt="12" onfocus="javascript: this.select();" value="<%=txtBnc%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Ag&ecirc;ncia:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" name="txtAgn" id="txtAgn" size="5" maxlength="5" ths="12" prv="11" nxt="13" value="<%=txtAgn%>" onfocus="javascript: this.select();" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Conta:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtCta" id="txtCta" size="20" maxlength="20" ths="13" prv="12" nxt="14" value="<%=txtCta%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Favorecido:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtFav" id="txtFav" size="50" maxlength="60" ths="14" prv="13" nxt="15" value="<%=txtFav%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>Telegram:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtTlg" id="txtTlg" size="50" maxlength="60" ths="15" prv="14" nxt="16" value="<%=txtTlg%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26" _bgcolor="#f2f2f2">
							<td>e-Mail:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEml" id="txtEml" size="50" maxlength="60" ths="16" prv="15" nxt="20" value="<%=txtEml%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="<%=strBtn%>" ths="20" prv="12" nxt="21" onkeydown="javascript: return verTab(event);">
									<%=btnContratos%>
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR && bExcluir )
	{
%>
									<br><br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('E');" value="Excluir" ths="23" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
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
	if ( document.form1.txtPais[document.form1.txtPais.selectedIndex].value != 124 ) return;
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
</script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
