<%@ include file="inc/incCabec.jsp"%><%
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
	int		iAcesso						=	UTLUtils.getStringToInt( txtAss );
	String	txtBtnArq					=	"";

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	long 	lCliente					=	UTLUtils.getStringToLong( request.getParameter("txtCliente") );
	long 	lColaborador				=	UTLUtils.getStringToLong( request.getParameter("txtColaborador") );

	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );
	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	int		intPagina					=	UTLUtils.getStringToInt( request.getParameter("txtPagina") ) ;
	int		intTotal					=	UTLUtils.getStringToInt( request.getParameter("txtTotal") ) ;

	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );
	String	txtMes						=	UTLUtils.getStringToString( request.getParameter("txtMes") );
	String	txtValor					=	UTLUtils.getStringToString( request.getParameter("txtValor") );
	String	txtPercInv					=	UTLUtils.getStringToString( request.getParameter("txtPercInv") );
	String	txtPercClb					=	UTLUtils.getStringToString( request.getParameter("txtPercClb") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	String	txtDataPag					=	UTLUtils.getStringToString( request.getParameter("txtDataPag") );
	String	txtTaxa						=	UTLUtils.getStringToString( request.getParameter("txtTaxa") );
	String	txtInfTax					=	UTLUtils.getStringToString( request.getParameter("txtInfTax") );
	String	txtDtaIni					=	UTLUtils.getStringToString( request.getParameter("txtDtaIni") );
	String	txtCmpPercInv				=	UTLUtils.getStringToString( request.getParameter("txtCmpPercInv") );
	String	txtCmpPercClb				=	UTLUtils.getStringToString( request.getParameter("txtCmpPercClb") );

	String	txtDlrData					=	UTLUtils.getStringToString( request.getParameter("txtDlrData") );
	String	txtDlrBase					=	UTLUtils.getStringToString( request.getParameter("txtDlrBase") );
	String	txtDlrValor					=	UTLUtils.getStringToString( request.getParameter("txtDlrValor") );
	String	txtDolar					=	UTLUtils.getStringToString( request.getParameter("txtDolar") );

	String	strBtn						=	"Incluir";
	String	strMensagem					=	UTLUtils.getBranco();
	boolean bAlterar					=	true;
	
	if ( txtAcao.equals("modificar") || txtAcao.equals("exibir") )
	{
		long lCodigo					=	UTLUtils.getStringToLong( txtCodigo );
		CADContrato _contrato			=	new CADContrato( lCodigo, conn );
		lCliente						=	_contrato.getIdCliente();
		lColaborador					=	_contrato.getIdColaborador();
		txtMes							=	String.valueOf(_contrato.getMeses());
		txtDolar						=	String.valueOf(_contrato.getIdMoeda());
		txtDlrData						=	UTLUtils.getDia(_contrato.getDolar().getDataBase());
		txtValor						=	UTLUtils.getValor(_contrato.getValorInvestido());
		txtDlrValor						=	UTLUtils.getValor(_contrato.getMoedaValor());
		txtPercInv						=	((int)(_contrato.getPercentualInvestido() * 100)) + "";
		txtPercClb						=	((int)(_contrato.getPercentualComissao() * 100)) + "";
	 	txtFranquia						=	String.valueOf(_contrato.getIdFranquia());
		txtDataPag						=	UTLUtils.getDia(_contrato.getDataPagamento());
		txtTaxa							=	String.valueOf(_contrato.getIdTaxa());
		txtInfTax						=	_contrato.isTaxaInformada() ? "S" : "N";
		txtCmpPercInv					=	String.valueOf(_contrato.getTaxa().getRemuneracaoObjetivo());
		txtCmpPercClb					=	String.valueOf(_contrato.getTaxa().getComissaoObjetivo());
		strBtn							=	"Atualizar";
		CADClientePagamento _pgCli		=	new CADClientePagamento( lCodigo, 0L, null, null, 0, conn );
		while ( _pgCli.next() )
		{
			if ( _pgCli.getDataPagamento() != null )
			{
				bAlterar				=	false;
				break;
			}
		}
		txtBtnArq						=	"<div class=\"grupo-coluna-r\"><input class=\"btn btn-dark btn-custom\" onclick=\"javascript: Submeter('Cp');\" type=\"button\" name=\"btnArq\" value=\"Arquivos\"></div>";
	}
	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") )
	{
		long lCodigo					=	UTLUtils.getStringToLong( txtCodigo );
		CADContrato _contrato			=	new CADContrato( lCodigo, conn );
		_contrato.setIdCliente			(lCliente										);
		_contrato.setIdColaborador		(lColaborador									);
		_contrato.setMeses				(UTLUtils.getStringToInt(txtMes)				);
		_contrato.setIdMoeda			(UTLUtils.getStringToLong(txtDolar)	    		);
		_contrato.setMoedaValor			(UTLUtils.getStringToDouble(txtDlrValor)		);
		_contrato.setValorInvestido		(UTLUtils.getStringToDouble(txtValor)			);
		_contrato.setPercentualInvestido(UTLUtils.getStringToDouble(txtPercInv) / 100	);
		_contrato.setPercentualComissao	(UTLUtils.getStringToDouble(txtPercClb) / 100	);
	 	_contrato.setIdFranquia			(UTLUtils.getStringToLong(txtFranquia)			);
		_contrato.setDataPagamento		(UTLUtils.converteData(txtDataPag)				);
		_contrato.setIdTaxa				(UTLUtils.getStringToLong( txtTaxa )			);
		_contrato.setTaxaInformada		(UTLUtils.getStringToBoolean( txtInfTax )		);
		try
		{
			_contrato.atualize( conn );
			String txtAlt				=	UTLUtils.getStringToString( request.getParameter("txtAlt") );
/*     Verificar a exclus�o dos pagamentos do contrato;				*/
			if ( txtAlt.equals("S") )
			{
				CADClientePagamento _eCli		=	new CADClientePagamento( );
				_eCli.deleteContrato( lCodigo, conn );
				CADColaboradorPagamento _eClb	=	new CADColaboradorPagamento(  );
				_eClb.deleteContrato( lCodigo, conn );
				lCodigo					=	0L;
			}
/*     Verificar a exclus�o dos pagamentos do contrato;				*/
			if ( lCodigo == 0 )
			{
				lCodigo							=	_contrato.getId();
				Calendar cDta					=	_contrato.getDataPagamento();
				int iDia						=	cDta.get(Calendar.DAY_OF_MONTH);
				CADClientePagamento 	_pgCli	=	new CADClientePagamento();
				CADColaboradorPagamento _pgClb	=	new CADColaboradorPagamento();
				BigDecimal bInv					=	new BigDecimal(_contrato.getMoedaValor());
				BigDecimal bCms					=	new BigDecimal(_contrato.getMoedaValor());
				bInv							=	bInv.multiply(new BigDecimal(_contrato.getPercentualInvestido()));
				bCms							=	bCms.multiply(new BigDecimal(_contrato.getPercentualComissao()));

				BigDecimal bInvBrl				=	new BigDecimal(_contrato.getValorInvestido());
				BigDecimal bCmsBrl				=	new BigDecimal(_contrato.getValorInvestido());
				bInvBrl							=	bInv.multiply(new BigDecimal(_contrato.getPercentualInvestido()));
				bCmsBrl							=	bCms.multiply(new BigDecimal(_contrato.getPercentualComissao()));
				for (int i=0; i<_contrato.getMeses(); i++)
				{
					if ( cDta.get(Calendar.DAY_OF_MONTH) < iDia)
					{
						cDta.add(Calendar.DAY_OF_MONTH, 1);

						if ( cDta.get(Calendar.DAY_OF_MONTH) == 1)
						{
							cDta.add(Calendar.DAY_OF_MONTH, -1);
						}
					}
					cDta.add(Calendar.MONTH, 1);
					_pgCli.setId				(0L									);
					_pgCli.setIdContrato		(_contrato.getId()					);
					_pgCli.setIdCliente			(_contrato.getIdCliente()			);
					_pgCli.setDataVencimento	(cDta								);
					_pgCli.setIdFranquia		(_contrato.getIdFranquia()			);
//					_pgCli.setValorPagamento	(bInv.doubleValue()					);
					_pgCli.setValorPagamento	(bInvBrl.doubleValue()				);
					_pgCli.setValorMoeda	    (bInv.doubleValue()					);
					_pgCli.setIdMoeda           (_contrato.getIdMoeda()	            );
					_pgCli.atualize(conn);
					if ( _contrato.getIdColaborador() > 0 )
					{
						_pgClb.setId			(0L									);
						_pgClb.setIdContrato	(_contrato.getId()					);
						_pgClb.setIdColaborador	(_contrato.getIdColaborador()		);
						_pgClb.setDataVencimento(cDta								);
						_pgClb.setIdFranquia	(_contrato.getIdFranquia()			);
//						_pgClb.setValorPagamento(bCms.doubleValue()					);
						_pgClb.setValorPagamento(bCmsBrl.doubleValue()				);
						_pgClb.setValorMoeda    (bCms.doubleValue()					);
						_pgClb.setIdMoeda       (_contrato.getIdMoeda()	            );
						_pgClb.atualize(conn);
					}
				}
			}
			strMensagem					=	"Registro atualizado com sucesso!";

			//// e-Mail de aviso
			if ( txtAcao.equals("incluir") )
			{
					String txtFromEmail		=	"PortalInfinity<suporte@servicosespecializados.com.br>";
					String[] arrToEmail		=	new String[1];
					arrToEmail[0]			=	txtFromEmail;
					String[] arrCCEMail		=	null;
					String[] arrBCCEMail	=	null;
					String	txtAssunto		=	"Contrato novo | " + lCodigo;
					String[] files			=	null;
					String	strProps		=	dir_base + "/Intranet/inf/prp/Mailinf.props";
					UTLMail mail 			=	new UTLMail(dir_base);
					mail.postMail(txtFromEmail, arrToEmail, arrCCEMail, arrBCCEMail, txtAssunto, txtAssunto, txtAssunto, strProps, files);
			}
			////
		}
		catch (SQLException e)
		{
			strMensagem 				= 	"Erro na atualiza\u00E7\u00E3o: " + e;
			if (txtAcao.equals("incluir"))
			{
				strBtn					=	"Incluir";
			}
		}
	}
	if ( txtAcao.equals("novo") )
	{
		lColaborador					=	0;
		txtDataPag						=	UTLUtils.getDia(Calendar.getInstance());
	}
	String sBr2							=	"&nbsp;";
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
	}

	strMensagem							=	strMensagem.replace('\'','�').replace('\n',' ');
	CADFranquias _franquias				=	new CADFranquias( 0L, true, 0, conn );
	UTLCombo franquia					=	_franquias.getCombo();
//	UTLCombo franquia					=	new CADFranquia().getCombo();
	UTLCombo meses						=	new UTLCombo("6|6 meses,12|12 meses,18|18 meses,24|24 meses,30|30 meses,36|36 meses,48|48 meses,60|60 meses");
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
    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
<link type="text/css" href="css/calendar-win2k-cold-2.css" rel="stylesheet" media="all" title="win2k-cold-2" />
<script type="text/javascript" src="inc/js/calendar-js.js"></script>
<script type="text/javascript" src="inc/js/calendar-br.js"></script>
<script type="text/javascript" src="inc/js/calendar-setup.js"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/javascript" src="inc/js/net.js"></script>
<script type="text/javascript" src="inc/cad/CADDlr.js"></script>
<script type="text/javascript" src="inc/cad/CADTax.js"></script>
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
			if ( document.form1.txtAcao.value == "incluir" && confirm("Deseja incluir o comprovante agora?") == true ) {
				Submeter("Ca");
			} else {
				Submeter("V");
			}
			return;
		}
	}
    Calendar.setup({ inputField : "txtDataPag", ifFormat : "dd/mm/y", button : "imgDataCadastro", align : "Bl", singleClick :true });

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if ( document.form1.txtCodigo.value == "" || document.form1.txtCodigo.value == "0" ) {
		document.form1.txtCliente.focus();
	} else {
		document.form1.txtMes.focus();
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "S") {
		document.form1.action="frmMenu.jsp";
	}
	if (acao == "V") {
		if ( document.form1.txtAcao.value == "exibir" ) {
			document.form1.txtAcao.value = "";
			document.form1.action="frmCntFrqCns.jsp";
		} else {
			if ( document.form1.txtOrigem.value == "" ) {
				document.form1.txtAcao.value = "";
				document.form1.action="frmCntCns.jsp";
			} else {
				document.form1.txtAcao.value = "modificar";
				document.form1.action = document.form1.txtOrigem.value;
			}
		}
	}
	if (acao == "A") {
		if ( document.form1.txtCliente.selectedIndex < 1 ) {
			alert("Falta selecionar o investidor!");
			document.form1.txtCliente.focus();
			return;
		}
		if ( document.form1.txtFranquia.selectedIndex < 1 ) {
			alert("Falta selecionar a franquia!");
			document.form1.txtFranquia.focus();
			return;
		}
		if ( valor( document.form1.txtDlrValor.value ) == 0 ) {
			alert("Falta informar o valor investidor!");
			document.form1.txtDlrValor.focus();
			return;
		}
		if ( valor( document.form1.txtPercInv.value ) == 0 ) {
			alert("Falta informar o percentual do Investidor!");
			document.form1.txtPercInv.focus();
			return;
		}
		if ( valor( document.form1.txtPercClb.value ) > 2 ) {
			alert("Verifique o percentual do coordenador!");
			document.form1.txtPercClb.focus();
			return;
		}
		if ( document.form1.txtCodigo.value != "" && document.form1.txtCodigo.value != "0" ) {
			if ( valor(document.form1.txtAltVal.value) != (document.form1.txtDlrValor.value) ) {
				if ( document.form1.txtAlt.value == "N" ) {
					alert("N\343o pode alterar o valor do contrato!\n\nJ341 houve pagamento!");
					document.form1.txtDlrValor.select();
					document.form1.txtDlrValor.focus();
					return;
				} else {
					document.form1.txtCalc.value = "S";
				}
			}
			if ( document.form1.txtAltDta.value != document.form1.txtDataPag.value ) {
				if ( document.form1.txtAlt.value == "N" ) {
					alert("N\343o pode alterar a data do contrato!\n\nJ341 houve pagamento!");
					document.form1.txtDataPag.select();
					document.form1.txtDataPag.focus();
					return;
				} else {
					document.form1.txtCalc.value = "S";
				}
			}
			if ( document.form1.txtAltPrz.value != document.form1.txtMes[document.form1.txtMes.selectedIndex].value ) {
				if ( document.form1.txtAlt.value == "N" ) {
					alert("N\343o pode alterar o prazo do contrato!\n\nJ\341 houve pagamento!");
					document.form1.txtMes.focus();
					return;
				} else {
					document.form1.txtCalc.value = "S";
				}
			}
		}
		if ( document.form1.txtCodigo.value == "" || document.form1.txtCodigo.value == "0" ) {
			if ( confirm("Confirma a inclus\343o do Contrato?\n\n" + document.form1.txtMes[document.form1.txtMes.selectedIndex].text + " meses, em " + document.form1.txtDataPag.value + "\nNo valor de " + document.form1.txtDlrValor.value+"\n\nTaxa: " + document.form1.txtPercInv.value + "\nComiss�o: " + document.form1.txtPercClb.value) == true ) {
				document.form1.txtAcao.value = "incluir";
			} else {
				return;
			}
		} else {
			if ( confirm("Confirma a Altera\347\343o do Contrato?\n\n" + document.form1.txtMes[document.form1.txtMes.selectedIndex].text + " meses, em " + document.form1.txtDataPag.value + "\nNo valor de " + document.form1.txtDlrValor.value+"\n\nTaxa: " + document.form1.txtPercInv.value + "\nComiss�o: " + document.form1.txtPercClb.value) == true ) {
				document.form1.txtAcao.value = "atualizar";
			} else {
				return;
			}
		}
		document.form1.action="frmCntCad.jsp";
	}
	if (acao == "Cp") {
		document.form1.action="frmCtaCns.jsp";
	}
	if (acao == "Ca") {
		document.form1.txtAcao.value = "novo";
		document.form1.action="frmCtaCad.jsp";
	}
	varSubmit = true;
	document.form1.submit();
}

function valor(a) {
	pt = /\./g;
	b = "0";
	if (a.length > 0) {
		b = a.replace(pt, "").replace(",", ".");
	}
	r = parseFloat(b)
	return r;
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
    <div class="wrapper">
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
						<form                name="form1"          id="form1"        method="post" action="">
						<input type="hidden" name="sWhidt"         id="sWhidt"        value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"       value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"       value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"      value="<%=txtBusca%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"     value="<%=txtOrigem%>">
						<input type="hidden" name="txtSss"         id="txtSss"        value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"        value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"        value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"         id="txtFrq"        value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"        value="<%=txtOwn%>">
						<input type="hidden" name="txtAlt"         id="txtAlt"        value="<%=(bAlterar ? "S" : "N")%>">
						<input type="hidden" name="txtAltCalc"     id="txtCalc"       value="N">
						<input type="hidden" name="txtAltDta"      id="txtAltDta"     value="<%=txtDataPag%>">
						<input type="hidden" name="txtDolar"       id="txtDolar"      value="<%=txtDolar%>">
						<input type="hidden" name="txtDlrBase"     id="txtDlrBase"    value="<%=txtDlrBase%>">
						<input type="hidden" name="txtAltVal"      id="txtAltVal"     value="<%=txtDlrValor%>">
						<input type="hidden" name="txtAltPrz"      id="txtAltPrz"     value="<%=txtMes%>">
						<input type="hidden" name="txtTaxa"        id="txtTaxa"       value="<%=txtTaxa%>">
<!-- --------------------------------------------------------------Pagina��o: Inicio Parte 2 de 5 -->
						<input type="hidden" name="txtRegistros"   id="txtRegistros"  value="<%=intRegistros%>">
						<input type="hidden" name="txtPagina"      id="txtPagina"     value="<%=intPagina%>">
						<input type="hidden" name="txtTotal"       id="txtTotal"      value="<%=intTotal%>">
<!-- --------------------------------------------------------------Pagina��o: Fim Parte 1 de 5 -->
						<input type="hidden" name="txtCmpPercInv"  id="txtCmpPercInv" value="<%=txtCmpPercInv%>">
						<input type="hidden" name="txtCmpPercClb"  id="txtCmpPercClb" value="<%=txtCmpPercClb%>">
						<tr>
							<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="80%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan=2" valign="top">CONTRATO CADASTRO</td></tr>
						<tr height="32">
							<td>N&uacute;mero:</td>
							<td>
								<div class="grupo-coluna">
									<div class="grupo-coluna-l">
										<input class="form-control shadow-sm col-lg-5" type="text" name="txtCodigo" id="txtCodigo" size="4" maxlength="4" style="text-align: center;background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtCodigo%>" onkeydown="javascript: return false;">
									</div>
								<%=txtBtnArq%>
								</div>
							</td>
						</tr>
						<tr height="32" >
							<td>Investidor:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtCliente" id="txtCliente" _style="width:280px; background-color: #f0f8ff" ths="1" prv="20" nxt="2" onchange="javascript: buscarTaxa();" onkeydown="javascript: return verTab(event);">
									<option value="0"> -- selecione o investidor --- </option>
<%
	long lClb							=	lColaborador;
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
		lClb							=	0L;
	}
	CADCliente _cliente					=	new CADCliente(0, lClb, "", 0, 0, 0, 0, conn);
	while ( _cliente.next() )
	{
		out.write("<option value='" + _cliente.getId() );
		if ( _cliente.getId() == lCliente )
		{
			out.write("' selected>");
		}
		else
		{
			out.write("'>");
		}
		out.write(_cliente.getNome());
		out.write("</option>");
	}
%>								
								</select>
							</td>
						</tr>
						<tr height="32">
							<td>Coordenador:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtColaborador" id="txtColaborador" _style="background-color: #f0f8ff" ths="2" prv="1" nxt="3" onkeydown="javascript: return verTab(event);">
									<option value="0">SEM COORDENADOR</option>
<%
	CADColaborador _colaborador			=	new CADColaborador( CADColaborador.BUSCA_CADASTRO, 0, "", 0, 0, 0, 0, conn );
	while ( _colaborador.next() )
	{
		out.write("<option value='" + _colaborador.getId() );
		if ( _colaborador.getId() == lColaborador )
		{
			out.write("' selected>");
		}
		else
		{
			out.write("'>");
		}
		if ( _colaborador.getId() == 0 )
		{
			out.write("-- contrato sem colaborador --");
		}
		else
		{
			out.write(_colaborador.getNome());
		}
		out.write("</option>\n");
	}
%>
								</select>
							</td>
						</tr>
						<tr height="32">
							<td>Prazo:</td>
							<td><%=meses.getCombo("txtMes", "class=\"form-control shadow-sm col-lg-3\" ths=\"3\" prv=\"2\" nxt=\"4\" onkeydown=\"javascript: verTab(event);\" ", txtMes)%></td>
						</tr>
						<tr height="32">
							<td>Valor investido:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="26%" align="right"><input class="form-control shadow-sm col-lg-12" type="text" name="txtDlrValor" id="txtDlrValor" size="10" maxlength="12" ths="20" prv="17" nxt="23" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtDlrValor%>" onkeydown="javascript:return verNN(event, document.form1.txtMes, document.form1.txtFranquia);" onkeyup="javascript:verVV(this, 2, 7);" onblur="javascript: findDolar();"></td>
									<td width="3%">USD</td>
									<td width="24%" align="center">Dt.Cot.:<input class="form-control shadow-sm col-lg-9" type="text" name="txtDlrData" id="txtDlrData" size="8" maxlength="2" tabindex="-1" style="text-align: right; background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtDlrData%>"></td>
									<td width="25%" align="right"><input class="form-control shadow-sm col-lg-11" type="text" name="txtValor" id="txtValor" size="6" maxlength="2" tabindex="-1" style="text-align: right;" onfocus="javascript: this.blur();" value="<%=txtValor%>"></td>
									<td width="3%">BRL</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="32">
							<td>Franquia:</td>
							<td><%=franquia.getCombo("txtFranquia", " class=\"form-control shadow-sm col-lg-5\" ths=\"7\" prv=\"6\" nxt=\"8\" onchange=\"javascript: buscarTaxa();\"  onkeydown=\"javascript: verTab(event);\" ", txtFranquia)%></td>
						</tr>
						<tr height="32">
							<td>% Investidor:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="30%"><input class="form-control shadow-sm col-lg-6" type="text" name="txtPercInv" id="txtPercInv" size="3" maxlength="6" ths="5" prv="4" nxt="6" style="text-align: right;" onchange="javascript: verInformeTaxa();" onfocus="javascript: this.select();" value="<%=txtPercInv%>" onkeydown="javascript:return verNN(event, document.form1.txtFranquia, document.form1.txtPercInv);" onkeyup="javascript:verVV(this, 3, 2);"></td>
									<td width="30%">Data refer&ecirc;ncia: </td>
									<td width="40%"><input class="form-control shadow-sm col-lg-7" type="text" name="txtDtaIni" id="txtDtaIni" size="6" style="background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtDtaIni%>"></td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="32">
							<td>% Coordenador:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="30%"><input class="form-control shadow-sm col-lg-6" type="text" name="txtPercClb" id="txtPercClb" size="3" maxlength="2" ths="6" prv="5" nxt="7" style="text-align: right;" onchange="javascript: verInformeTaxa();" onfocus="javascript: this.select();" value="<%=txtPercClb%>" onkeydown="javascript:return verNN(event, document.form1.txtPercInv, document.form1.btnAcao);" onkeyup="javascript:verVV(this, 3, 2);"></td>
									<td width="30%">Taxas informadas: </td>
									<td width="40%">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="txtInfTax" id="txtInfTax" <%=(txtInfTax.equals("S") ? "checked" : " ")%> onfocus="javascript: this.blur();" value="S">
											<label class="form-check-label" for="txtInfTax">Sim</label>
										</div>
									</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="32">
							<td>Data contrato:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="40%"><input class="form-control shadow-sm col-lg-7" title="data de pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" class="form-control shadow-sm col-lg-6" type="text" value="<%=txtDataPag%>" ths="8" prv="7" nxt="20" id="txtDataPag" name="txtDataPag" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verTab(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10"></td>
									<td width="1%">&nbsp;</td>
									<td width="59%"><img src="img/calendario.gif" border="0" style="cursor: pointer;" id="imgDataCadastro" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;"></td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<br>
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<input class="btn btn-dark btn-custom" type="button" name="btnVoltar" id="V" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
		if ( ! txtAcao.equals("exibir") )
		{
%>
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" id="btnAcao" value="<%=strBtn%>" ths="20" prv="12" nxt="21" onkeydown="javascript: return verTab(event);">
<%
		}
	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
							</td>
						</tr>
						</form>
						</table>
					</td>
				</tr>
				</table>
			</div>
			<!--/div-->
			<div class="col-sm text-center"></div>
        </div>
    </div>
<script type="text/Javascript">
// -------------------------- Taxa de Remunera��o/Comiss�o do novo contrato  --------------------------------- //
function buscarTaxa() {
//	alert("cli: " + document.form1.txtCliente.selectedIndex + "\nfrq: " + document.form1.txtFranquia.selectedIndex);
	if ( document.form1.txtCliente.selectedIndex < 1 ) {
		alert('Falta selecionar o investidor!');
		document.form1.txtCliente.focus();
		return;
	}
	if ( document.form1.txtFranquia.selectedIndex < 1 ) {
		if ( document.form1.txtColaborador.selectedIndex < 1 ) {
			document.form1.txtColaborador.focus();
			return;
		}
		alert('Falta selecionar a Franquia!');
		document.form1.txtFranquia.focus();
		return;
	}
	txtCli = document.form1.txtCliente[document.form1.txtCliente.selectedIndex].value;
	txtfrq = document.form1.txtFranquia[document.form1.txtFranquia.selectedIndex].value;
	variaveis = "cli=" + txtCli + "&frq=" + txtfrq;
//	prompt( "Taxa", "frmCnsTax.jsp?" + variaveis );
	loadAval = new net.ContentLoader("frmCnsTax.jsp", showTaxa, null, "POST", variaveis);
}
function showTaxa(){
	_tax = eval("new CADTax.classe(" + this.req.responseText + ")");
//	alert(this.req.responseText);
	if ( _tax.getMensagem() != "" ) {
		alert(_tax.getMensagem());
	} else {
		document.form1.txtPercInv.value = _tax.getFormRemuneracaoObjetivo();
		document.form1.txtPercClb.value = _tax.getFormComissaoObjetivo();
		document.form1.txtCmpPercInv.value = _tax.getFormRemuneracaoObjetivo();
		document.form1.txtCmpPercClb.value = _tax.getFormComissaoObjetivo();
		document.form1.txtDtaIni.value = _tax.getDataInicio();
	}
}
function verInformeTaxa(){
	if ( valor(document.form1.txtPercInv.value) != valor(document.form1.txtCmpPercClb.value) || valor(document.form1.txtPercClb.value) != valor(document.form1.txtCmpPercClb.value) ){
		document.form1.txtInfTax.checked = true;
	} else {
		document.form1.txtInfTax.checked = false;
	}
}
// -------------------------- Taxa de Remunera��o/Comiss�o do novo contrato  --------------------------------- //

// -------------------------- C�lculo do Dolar do novo contrato  --------------------------------------------- //
function findDolar() {
// Campos:
// 	data = data base para pesquisa, se igual branco, busca a data atual;
// 	dias = dias anteriores � "data", se n�o informar, busca at� 4 dias;
//  valor = valor a ser convertido
	if ( valor(document.form1.txtDlrValor.value) == 0 || CampoVazio(document.form1.txtDlrValor.value) ) {
		document.form1.txtValor.value = "0,00";
		return;
	}
	if ( CampoVazio(document.form1.txtDlrData.value) || document.form1.txtDlrData.value == "00/00/0000" ) {
		document.form1.txtDlrData.value = document.form1.txtDataPag.value;
	}
//	alert("Valor: " + document.form1.txtValor.value + "\n\n" + document.form1.txtValor.value.length + "\n\nVazio: " + CampoVazio(document.form1.txtValor.value) + "\n\nValor: " + valor(document.form1.txtValor.value) );
	cData = "";
	if ( ! CampoVazio(document.form1.txtDataPag.value) ) {
		cData = document.form1.txtDataPag.value;
	}
//	cValor = document.form1.txtValor.value;
	cValor = document.form1.txtDlrValor.value;
	variaveis = "data=" + cData + "&conv=BRL&valor=" + cValor;
//	prompt( "Dolar", "frmCnsDlr.jsp?" + variaveis );
	loadAval = new net.ContentLoader("frmCnsDlr.jsp", calcDolar, null, "POST", variaveis);
}

function calcDolar() {
	prompt( "Dolar", this.req.responseText );
	_dlr = eval("new CADDlr.classe(" + this.req.responseText + ")");
	if ( ! _dlr.isExiste() ) {
		alert(_dlr.getMensagem());
	} else {
		alert("Calulado: " + _dlr.getUsdForm() + " = " + _dlr.getRealForm());
		document.form1.txtDolar.value = _dlr.getId();
		document.form1.txtDlrBase.value = _dlr.getValor();
		document.form1.txtDlrData.value =  _dlr.getDataBase();
		document.form1.txtDlrValor.value =  _dlr.getUsdForm();
		document.form1.txtValor.value = _dlr.getRealForm();
	}
}
// -------------------------- C�lculo do Dolar do novo contrato  --------------------------------------------- //
function CampoVazio(Campo) {
	r = / /g;
	s = Campo.replace(r, "");
	if (s.length == 0) {
		return true;
	} else {
		return false;
	}
}

function formataData(e, pCampo) {
	o = window.event || e;
var wTecla  = o.which || o.keyCode;
var pTamMax = 16;
var	wVr = pCampo.value;
	wVr = wVr.replace( "/", "" );
	wVr = wVr.replace( "/", "" );
var	wTam = wVr.length;
	if ( wTecla == 8 || wTecla >= 48 && wTecla <= 57 || wTecla >= 96 && wTecla <= 105 ){
		if (wTam <= 2) {	pCampo.value = wVr ; }
		if ( (wTam > 2) && (wTam <= 4) ) { pCampo.value = wVr.substr( 0, 2) + '/' + wVr.substr( 2, wTam ) ; }
		if ( wTam > 4)  { pCampo.value = wVr.substr( 0, 2) + '/' + wVr.substr( 2, 2 ) + '/' + wVr.substr( 4, wTam ) ; }
	}		
}
function check_date(field){
var checkstr = "0123456789";
var DateField = field;
var DateValue = "";
var DateTemp = "";
var seperator = "/";
var day;
var month;
var year;
var leap = 0;
var err = 0;
var i;
   err = 0;
   DateValue = DateField.value;
   for (i = 0; i < DateValue.length; i++) {
	  if (checkstr.indexOf(DateValue.substr(i,1)) >= 0) {
	     DateTemp = DateTemp + DateValue.substr(i,1);
	  }
   }
   DateValue = DateTemp;
   if (DateValue.length == 6)  {
   	  if (parseInt(DateValue.substr(4,2)) > 50) {
   		  DateValue = DateValue.substr(0,4) + '19' + DateValue.substr(4,2);
	  } else {
   		  DateValue = DateValue.substr(0,4) + '20' + DateValue.substr(4,2);
	  }
   }
   if (DateValue.length != 8) {	err = 19;}
   year = DateValue.substr(4,4);
   if (year == 0) {	err = 20;	 }
   month = DateValue.substr(2,2);
   if ((month < 1) || (month > 12)) {	err = 21;	 }
   day = DateValue.substr(0,2);
   if (day < 1) {	err = 22;	 }
   if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {	 leap = 1;	  }
   if ((month == 2) && (leap == 1) && (day > 29)) {	     err = 23;	  }
   if ((month == 2) && (leap != 1) && (day > 28)) {	     err = 24;	  }
   if ((day > 31) && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {	     err = 25;	  }
   if ((day > 30) && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {	    err = 26;	  }
   if ((day == 0) && (month == 0) && (year == 00)) {	 DateField.value = "";		 }
   if (err != 0) {
   		return false;
   } else {
		field.value = DateValue.substr(0,2) + "/" + DateValue.substr(2,2) + "/" + DateValue.substr(4,4);
   		return true;
   }
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
</script>
<script src="inc/js/jquery.js"></script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
