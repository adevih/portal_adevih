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

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	String	txtDataPag					=	UTLUtils.getStringToString( request.getParameter("txtDataPag") );
	String	txtDataFin					=	UTLUtils.getStringToString( request.getParameter("txtDataFin") );
//	String	txtDolar					=	UTLUtils.getStringToString( request.getParameter("txtDolar") );
	long 	lCliente					=	UTLUtils.getStringToLong( request.getParameter("txtCliente") );
	long 	lColaborador				=	UTLUtils.getStringToLong( request.getParameter("txtColaborador") );
	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );
	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	int		intPagina					=	UTLUtils.getStringToInt( request.getParameter("txtPagina") ) ;
	int		intTotal					=	UTLUtils.getStringToInt( request.getParameter("txtTotal") ) ;

	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );

	String	strBtn						=	"Pay";
	String	strMensagem					=	UTLUtils.getBranco();
	long lCodigo						=	UTLUtils.getStringToLong( txtCodigo );
	
	Calendar cDtaIni					=	null;
	Calendar cDtaFin					=	null;
	CADDolar _dolar						=	null;
	String sBr2							=	"&nbsp;&nbsp;";
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
	}
	if ( txtDataPag.trim().length() == 0 )
	{
		txtDataPag						=	UTLUtils.getDia( Calendar.getInstance() );
	}

	if ( cDtaIni == null )
	{
		_dolar							=	new CADDolar( Calendar.getInstance(), null, 1, conn );
	}
	else
	{
		_dolar							=	new CADDolar( cDtaIni, null, 1, conn );
	}
	BigDecimal bDlr						=	new BigDecimal( _dolar.getValor() );
	String	txtDolar					=	_dolar.getId() + "";

	if ( txtAcao.equals("pagar") )
	{
		txtAcao							=	"data";
		String txtPagar[]				=	request.getParameterValues("txtPagar");
		String txtReg[]					=	request.getParameterValues("txtReg");
		String txtTax[]					=	request.getParameterValues("txtTax");
		String txtValor[]				=	request.getParameterValues("txtValor");
		String txtVlrDlr[]				=	request.getParameterValues("txtVlrDlr");
		String txtVlrTax[]				=	request.getParameterValues("txtVlrTax");
		if ( txtPagar != null )
		{
			try
			{
				for (int i=0;i<txtPagar.length; i++)
				{
					int r				=	UTLUtils.getStringToInt(txtPagar[i]);
					long lPagar			=	UTLUtils.getStringToLong(txtReg[r]);
					CADClientePagamento _pag	=	new CADClientePagamento( lPagar, conn );
					if ( _pag.getDataPagamento() == null )
					{
						_pag.setDataPagamento	(Calendar.getInstance()					 );
						_pag.setIdMoeda   		(UTLUtils.getStringToLong(txtDolar)		 );
						_pag.setValorPagamento	(UTLUtils.getStringToDouble(txtValor[r]) );
						_pag.setValorMoeda		(UTLUtils.getStringToDouble(txtVlrDlr[r]));
						_pag.setValorBase		(UTLUtils.getStringToDouble(txtVlrTax[r]));
						_pag.setIdTaxa   		(UTLUtils.getStringToLong(txtTax[r])	 );
						_pag.atualize(conn);
					}
				}
				strMensagem				=	"Registro atualizado com sucesso!";
			}
			catch (SQLException e)
			{
				strMensagem				=	"Erro: " + e;
			}
		}
	}
	if ( txtAcao.equals("data") )
	{
		cDtaIni							=	UTLUtils.converteData(txtDataPag);
		cDtaFin							=	UTLUtils.converteData(txtDataFin);
		lCodigo							=	0L;
		lCliente						=	0L;
	}

	strMensagem							=	strMensagem.replace('\'','?').replace('\n',' ');
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
<link rel="stylesheet" href="css/style1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
<link type="text/css" href="css/calendar-win2k-cold-2.css" rel="stylesheet" media="all" title="win2k-cold-2" />
<script type="text/javascript" src="inc/js/calendar-js.js"></script>
<script type="text/javascript" src="inc/js/calendar-br.js"></script>
<script type="text/javascript" src="inc/js/calendar-setup.js"></script>
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
//			Submeter("V");
			return;
		}
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		if ( document.form1.txtOrigem.value == "" ) {
			document.form1.txtAcao.value = "";
			document.form1.action="frmCipCns.jsp";
		} else {
			document.form1.txtAcao.value = "modificar";
			document.form1.action = document.form1.txtOrigem.value;
		}
	}
	if (acao == "A") {
		var	selecionado = false;
		if ( typeof(document.form1.txtPagar) == "object" ) {
			if ( typeof(document.form1.txtPagar.length) == "undefined" ) {
				selecionado = document.form1.txtPagar.checked;
			} else {
				for (i=0; i < document.form1.txtPagar.length; i++ ) {
					if ( document.form1.txtPagar[i].checked ) {
						selecionado = true;
						break;
					}
				}
			}
		}
		if ( ! selecionado ) {
			alert('N\343o h\341 documentos selecionados para pagamento!');
			return;
		} else {
			if ( confirm("Confirma o pagamento dos registros selecionados?") == true ) {
				document.form1.txtAcao.value = "pagar";
			} else {
				return
			}
		}
		document.form1.action="frmCipCad.jsp";
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
<body leftmargin="0" topmargin="0" style="background-color:#121212;" onload="javascript: Foco();">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto">
        <!-- Sidebar  -->
		<div class="p-0 m-0 h-100 w-auto" style="background-color:#080808;" >
			<%@ include file="inc/incSideBar2.jsp"%>
		</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form justify-content-center" style="background-color:#121212;">

				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" class="col-12">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="50%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"    value="<%=txtOrigem%>">
						<input type="hidden" name="txtCliente"     id="txtCliente"   value="<%=lCliente%>">
						<input type="hidden" name="txtColaborador" id="lColaborador" value="<%=lColaborador%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
						<input type="hidden" name="txtDataPag"     id="txtDataPag"   value="<%=txtDataPag%>">
						<input type="hidden" name="txtDataFin"     id="txtDataFin"   value="<%=txtDataFin%>">
						<input type="hidden" name="txtDolar"       id="txtDolar"     value="<%=txtDolar%>">
<!-- --------------------------------------------------------------Pagina??o: Inicio Parte 2 de 5 -->
						<input type="hidden" name="txtRegistros"   id="txtRegistros" value="<%=intRegistros%>">
						<input type="hidden" name="txtPagina"      id="txtPagina"    value="<%=intPagina%>">
						<input type="hidden" name="txtTotal"       id="txtTotal"     value="<%=intTotal%>">
<!-- --------------------------------------------------------------Pagina??o: Fim Parte 1 de 5 -->
						<%-- <tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr> --%>
						<tr class="selecF12"><td colspan="2" class="col-2 text-center" valign="top">INVESTORS PAYMENT</td></tr>
						<tr >
							<td colspan="2" >
<%
	if ( txtDataPag.equals(txtDataFin) )
	{
		out.write("Data base: ");
		out.write(txtDataPag);
	}
	else
	{
		out.write("Per&iacute;odo: ");
		out.write(txtDataPag);
		out.write(" &agrave; ");
		out.write(txtDataFin);
	}
%>
<%
		if ( iWhidt > 500 )
		{
%>
							<table class="col-12" border="0" cellpadding="0" cellspacing="0">
							<tr><td width="100%">
							<div name="divProg" class="col-12" id="divProg" style="height:240; overflow: auto; display:block; overflow-y: scroll;">
								<table  border="0" cellpadding="0" cellspacing="1" name="tbCab" id="tbCab">
									<tr style="background-color:#3d3d3d; color:#000; font-size:10pt; font-weight: bolder;">
										<td align="center">Contract</td>
										<td align="center">Office</td>
										<td align="center">Contract</td>
										<td align="center">Date</td>
										<td align="center">Payd</td>
										<td align="center">Monetized</td>
									</tr>
									<tr bgcolor="#ffffff">
										<td width="37%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
										<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
										<td width="15%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
										<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
										<td width="15%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
										<td width="3%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									</tr>
<%
		}
		else
		{
%>
							<table class="col-12" border="0" cellpadding="0" cellspacing="0">
							<tr><td>
							<div name="divProg" id="divProg" style="height: 240; overflow: auto; display:block; overflow-y: scroll;">
								<table border="0" cellpadding="0" cellspacing="1" name="tbCab" id="tbCab">
									<tr style="background-color:#3d3d3d; color:#fff; font-size:10pt; font-weight: bolder;">
										<td width="64%">Investor</td>
										<td width="8%" align="center">Contract</td>
										<td width="8%" align="center">Date</td>
										<td width="8%" align="center">Payd</td>
										<td width="3%" align="center">Monetized</td>
									</tr>
<%
	}
	int	iLidos							=	1;
	long lIdTaxa						=	0L;
	String strCor1						= 	"#525252";
	String strCor2						= 	"#3d3d3d";
	String	strCor 						= 	strCor2;
	BigDecimal bTot						=	new BigDecimal(0);
	BigDecimal bPag						=	new BigDecimal(0);
	BigDecimal bSld						=	new BigDecimal(0);

	BigDecimal bsVal					=	new BigDecimal(0);
	BigDecimal bsUSd					=	new BigDecimal(0);
	BigDecimal bsTax					=	new BigDecimal(0);

	Calendar cDtaRef					=	Calendar.getInstance();
	CADFranquias _franquias				=	new CADFranquias( 0L, true, 0, conn );
	CADClientePagamento _pagamento		=	new CADClientePagamento( lCodigo, lCliente, cDtaIni, cDtaFin, 0, conn);
	while ( _pagamento.next() )
	{
		if ( strCor.equals(strCor1) )
		{
			strCor 						= 	strCor2;
		}
		else
		{
			strCor 						= 	strCor1;
		}
		iLidos++;
		out.write("<tr class=\"selecF12c\" height=\"32\"");
		out.write( " title=\"click para selecionar o registro\" onmouseover=\"javascript: OnOver(event);\" onmouseout=\"javascript: OnOut(event);\" onclick=\"javascript: OnClick(event);\" _ondblclick=\"javascript: OnDblClick(event);\" " );
		out.write( " onkeydown=\"javascript: OnKeyDown(event);\"  " );
		out.write( " tab=\"" + iLidos + "\" " );
		out.write( " txtNome=\"" + _pagamento.getCliente().getNome() + "\" " );
		out.write( " txtCpf=\"" + UTLUtils.formatCnpjCpf(_pagamento.getCliente().getCpf() )+ "\" " );
		out.write( " txtIdt=\"" + _pagamento.getCliente().getIdentidade() + "\" " );
		out.write( " txtBnc=\"" + _pagamento.getCliente().getBanco() + "\" " );
		out.write( " txtAge=\"" + _pagamento.getCliente().getAgencia() + "\" " );
		out.write( " txtCta=\"" + _pagamento.getCliente().getContaCorrente() + "\" " );
		out.write( " txtMss=\"" + _pagamento.getContrato().getMeses() + "\" " );
		out.write( " txtFnq=\"" + _franquias.getNome(_pagamento.getContrato().getIdFranquia()) + "\" " );
		out.write( " txtFav=\"" + _pagamento.getCliente().getFavorecido() + "\" " );
		out.write( " txtCrt=\"" + _pagamento.getCliente().getCarteiraTitulo() + "\" " );
		out.write( " txtPix=\"" + _pagamento.getCliente().getPix() + "\" " );
		out.write( " txtEnc=\"" + _pagamento.getCliente().getEnderecoCarteira() + "\" " );
		if ( _pagamento.getDataPagamento() != null )
		{
			if ( _pagamento.getIdMoeda() == 0 )
			{
				bsVal					=	new BigDecimal( _pagamento.getValorPagamento() );
				_dolar					=	new CADDolar( _pagamento.getDataPagamento(), _pagamento.getDataVencimento(), 0, conn );
				_dolar.next();
				if ( _dolar.getValor() == 0 )
				{
					bsUSd				=	new BigDecimal( 0 );
					
				}
				else
				{
					bsUSd				=	new BigDecimal( _pagamento.getValorPagamento() / _dolar.getValor() );
					
				}
			}
			else
			{
				if ( _pagamento.getValorMoeda() > 0 )
				{
					bsVal				=	new BigDecimal( _pagamento.getValorPagamento() );
					bsUSd				=	new BigDecimal( _pagamento.getValorMoeda() );
				}
				else
				{
					bsUSd				=	new BigDecimal( _pagamento.getValorPagamento() );
					_dolar				=	new CADDolar( _pagamento.getIdMoeda(), conn );
					bsVal				=	new BigDecimal( _pagamento.getValorPagamento() * _dolar.getValor() );
				}
			}
		}
		else
		{
	// ------------------------------------------------------------------------------------------------------------------
	// Determinar a taxa - In?cio
			if ( _pagamento.getContrato().isTaxaInformada() )
			{
				bsTax					=	new BigDecimal( _pagamento.getContrato().getPercentualInvestido() );
			}
			else
			{
				CADTaxa _taxa			=	new CADTaxa( _pagamento.getCliente().getIdPais(), _pagamento.getIdFranquia(), cDtaRef, 0, conn );
				_taxa.isFind( _pagamento.getCliente().getIdPais(), _pagamento.getIdFranquia() );
				lIdTaxa					=	_taxa.getId();
				bsTax					=	new BigDecimal( _taxa.getRemuneracaoEfetivo() / 100 );
			}
	// Determinar a taxa - fim
	// ------------------------------------------------------------------------------------------------------------------
	// Calcular os valores em reais e dolar - In?cio		
			if ( _pagamento.getIdMoeda() == 0 )
			{
				bsVal					=	new BigDecimal( _pagamento.getContrato().getValorInvestido() * bsTax.doubleValue() );
				if ( bDlr.doubleValue() > 0 )
				{
					bsUSd				=	new BigDecimal( _pagamento.getContrato().getMoedaValor() * bsTax.doubleValue() );
				}
			}
			else
			{
				bsUSd					=	new BigDecimal( _pagamento.getContrato().getMoedaValor() * bsTax.doubleValue() );
				bsVal					=	new BigDecimal( bsUSd.doubleValue() * bDlr.doubleValue() );
			}
	// Calcular os valores em reais e dolar - fim
	// ------------------------------------------------------------------------------------------------------------------
		}
		out.write( " txtVal=\"" + bsVal.doubleValue() + "\" " );
		out.write( " txtUsd=\"" + bsUSd.doubleValue() + "\" " );
		out.write( " txtCpy=\"" + UTLUtils.getCampoDecimal( bsUSd.doubleValue(), 2) + "\" " );
		out.write( " bgcolor=\"" );
		out.write( strCor );
		out.write( "\" cor=\"" );
		out.write( strCor );
		out.write( "\" codigo=\"" + _pagamento.getId() + "\"><td>" );
		out.write( _pagamento.getCliente().getNome() );
		out.write( "</td><td align=\"center\">" );
		out.write(_franquias.getNome(_pagamento.getContrato().getIdFranquia()));
		out.write( "</span></td><td align=\"center\">" + _pagamento.getIdContrato() );
		if ( _pagamento.getContrato().getIdColaborador() > 0 )
		{
			out.write( ".");
		}
		
		out.write( "</td><td align=\"center\">" );
		out.write( UTLUtils.getDia(_pagamento.getDataVencimento()) );
		out.write( "</td><td align=\"center\">" );
		out.write( UTLUtils.getValor( bsUSd.doubleValue() ) );
		out.write( "&nbsp;</td><td align=\"left\">" );
		if ( _pagamento.getDataPagamento() == null )
		{
			out.write( "" );
			out.write("<input type=\"checkbox\" name=\"txtPagar\" value=\"" + (iLidos - 2) + "\" id=\"pgt" + iLidos + "\" title=\"confirmar pagamento\">");
		}
		else
		{
			out.write( "<img src=\"img/visto.gif\" alt=\"parcela paga\">" );
		}

		out.write("<input type=\"hidden\" name=\"txtReg\" value=\"" + _pagamento.getId() + "\" id=\"reg" + iLidos + "\" >");
		out.write("<input type=\"hidden\" name=\"txtTax\" value=\"" + lIdTaxa + "\" id=\"tax" + iLidos + "\" >");
		out.write("<input type=\"hidden\" name=\"txtValor\" value=\"" + UTLUtils.getCampoDecimal( bsVal.doubleValue(), 2) + "\" id=\"vlr" + iLidos + "\" >");
		out.write("<input type=\"hidden\" name=\"txtVlrDlr\" value=\"" + UTLUtils.getCampoDecimal( bsUSd.doubleValue(), 2) + "\" id=\"dlr" + iLidos + "\" >");
		out.write("<input type=\"hidden\" name=\"txtVlrTax\" value=\"" + UTLUtils.getCampoDecimal( bsTax.doubleValue(), 2) + "\" id=\"tax" + iLidos + "\" >");

		out.write( "</td></tr>\n" );
		bTot							=	bTot.add(new BigDecimal( bsUSd.doubleValue()  ));
		if ( _pagamento.getDataPagamento() != null )
		{
			bPag						=	bPag.add(new BigDecimal( bsUSd.doubleValue() ));
		}
		bSld							=	new BigDecimal(bTot.doubleValue());
		bSld							=	bSld.subtract(bPag);
	}
	
%>									
								</table>
								</div>
							</td></tr>
							<tr><td>
								<table border="0" cellpadding="0" cellspacing="1" class="col-12 mb-3">
									<tr   height="26" style="background-color:#464646; color:#fff; font-size:10pt; font-weight: bolder;">
										<td class="col-3 text-center">Total</td>
										<td class="col-3 text-center">Payed</td>
										<td class="col-2 text-center d-none">Saldo&nbsp;</td>
										<%-- <td class="col-2 text-center">Pagar</td> --%>
										<td class="col-2 text-center">Total Selected</td>
									</tr>
									<tr bgcolor="#161616" class="selecF12c">
										<td class="col-2 text-center"><%=UTLUtils.getValor(bTot.doubleValue())%>&nbsp;</td>
										<td class="col-2 text-center"><%=UTLUtils.getValor(bPag.doubleValue())%>&nbsp;</td>
										<td class="col-2 text-center d-none"><%=UTLUtils.getValor(bSld.doubleValue())%>&nbsp;</td>
										<td class="col-2 text-center d-none"><span id="txtPagando">0,00</span>&nbsp;<br><%=txtDataPag%>&nbsp;</td>
										<td class="col-2 text-center"><span id="txtPagandoUSD">0,00</span>&nbsp;<br>&nbsp;</td> 
										<%-- <%=UTLUtils.getCampoDecimal(bDlr.doubleValue(), 4)%> --%>
									</tr>
								</table>
							</td></tr>
							</table>
							</td>
						</tr>
					<div class="justify-content-center  m-auto">
						<tr class="cabAcesso text-center ">
							<td>Investor:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtNome" id="txtNome" size="50" onfocus="javascript: this.blur();" value="" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center ">
							<td>Document:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtCpf" id="txtCpf" size="15" onfocus="javascript: this.blur();" value="" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center d-none">
							<td>Identidade</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtIdt" id="txtIdt" size="15" onfocus="javascript: this.blur();" value="" onkeydown="javascript: return false;"></td>
						</tr>
						<%-- CONTA Investidor --%>
						<tr class="cabAcesso text-center d-none">
							<td>Banco:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;"  type="text" name="txtBnc" id="txtBnc" size="12" onfocus="javascript: this.blur();" value="" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center  d-none">
							<td>Agencia:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtAge" id="txtAge" size="4" value="" onfocus="javascript: this.blur();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center  d-none">
							<td>Conta:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtCta" id="txtCta" size="12" value="" onfocus="javascript: copyToClipboard(this.value); this.select();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center  d-none">
							<td>Favorecido:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtFav" id="txtFav" size="50" value="" onfocus="javascript: this.blur();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center ">
							<td>Network:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtCrt" id="txtCrt" size="11" value="" onfocus="javascript: this.blur();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center ">
							<td>Period:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtMss" id="txtMss" size="4" value="" onfocus="javascript: this.blur();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center ">
							<td>Office:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" style="background-color: #e6e6e6;" type="text" name="txtFnq" id="txtFnq" size="12" value="" onfocus="javascript: this.blur();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center d-none">
							<td>Chave PIX:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" type="text" name="txtPix" id="txtPix" size="50" onfocus="javascript: copyToClipboard(this.value); this.select();" value="" txt="" onkeydown="javascript: return false;"></td>
						</tr>
						<tr class="cabAcesso text-center ">
							<td>Wallet Address:</td>
							<td class="col-12"><input class="form-control shadow-sm mb-2" type="text" name="txtEnc" id="txtEnc" size="50" onfocus="javascript: copyToClipboard(this.value); this.select();" value="" txt="" onkeydown="javascript: return false;"></td>
						</tr>
					</div>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Return" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	int iAcesso							=	Integer.parseInt(txtAss);
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_PAGAMENTOS )
	{
%>
									<%=sBr2%>
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="<%=strBtn%>" ths="20" prv="12" nxt="21" onkeydown="javascript: return verTab(event);">
<%
	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;">  <div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
								<br>
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

</body>
<script type="text/Javascript">

// $(window).on("load", function(){
// 	alert("N�o esque�a de verificar a REDE!")
// })

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

var valPag = 0.00;
var valUsd = 0.00;
var posicaoAnterior = null;
function OnOver(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	tr.style.cursor = "pointer";
	tr.style.background = "#323232";
}
function OnOut(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	tr.style.cursor = "default";
	tr.style.background = tr.getAttribute("cor");
}
function OnClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	if ( tr.nodeName == "INPUT" ) {
		if ( tr.checked ) {
			tr.checked = false;
		} else {
			tr.checked = true;
		}
	}
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	if (posicaoAnterior != null) {
		posicaoAnterior.className = "linha";
	}
	tr.className = "selecF12c";
//	document.form1.txtCodigo.value = tr.getAttribute("codigo");
	obj = document.getElementById("pgt" + tr.getAttribute("tab"));
	val = parseFloat(tr.getAttribute("txtVal"));
	usd = parseFloat(tr.getAttribute("txtUsd"));
	if ( obj != null ) {
		if ( obj.checked ) {
			obj.checked = false;
			valPag = valPag - val;
			valUsd = valUsd - usd;
		} else {
			obj.checked = true;
			valPag = valPag + val;
			valUsd = valUsd + usd;
		}
	}
	document.form1.txtNome.value = tr.getAttribute("txtNome");
	document.form1.txtCpf.value = tr.getAttribute("txtCpf");
	document.form1.txtIdt.value = tr.getAttribute("txtIdt");
	document.form1.txtBnc.value = tr.getAttribute("txtBnc");
	document.form1.txtAge.value = tr.getAttribute("txtAge");
	document.form1.txtCta.value = tr.getAttribute("txtCta");
	document.form1.txtFav.value = tr.getAttribute("txtFav");
	document.form1.txtCrt.value = tr.getAttribute("txtCrt");
	document.form1.txtMss.value = tr.getAttribute("txtMss");
	document.form1.txtFnq.value = tr.getAttribute("txtFnq");
	document.form1.txtPix.value = tr.getAttribute("txtPix");
	document.form1.txtPix.setAttribute("txt", tr.getAttribute("txtPix"));
	document.form1.txtEnc.value = tr.getAttribute("txtEnc");
	document.form1.txtEnc.setAttribute("txt", tr.getAttribute("txtEnc"));
	document.getElementById("txtPagando").innerHTML = valUsd.toLocaleString('pt-BR', {minimumFractionDigits: 2});
	document.getElementById("txtPagandoUSD").innerHTML = valUsd.toLocaleString('pt-BR', {minimumFractionDigits: 2});
	posicaoAnterior = tr;
	copyToClipboard(tr.getAttribute("txtCpy"));
}

// -------------------- Base Valor/Quantidade ------------------------------- //
var vv = false;		// 	Indica v?rgula do ponto decimal;
var dd = false;		// 	Indica preenchimento das cadas decimais
var tt = false;		//	Indica preenchimento das casas n?o decimais
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
function copyToClipboard(text) {
    if (window.clipboardData && window.clipboardData.setData) {
        // IE specific code path to prevent textarea being shown while dialog is visible.
        return clipboardData.setData("Text", text); 
    } else if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
        var textarea = document.createElement("textarea");
        textarea.textContent = text;
        textarea.style.position = "fixed";  // Prevent scrolling to bottom of page in MS Edge.
        document.body.appendChild(textarea);
        textarea.select();
        try {
            return document.execCommand("copy");  // Security exception may be thrown by some browsers.
        } catch (ex) {
            console.warn("Copy to clipboard failed.", ex);
            return false;
        } finally {
            document.body.removeChild(textarea);
        }
    }
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
