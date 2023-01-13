<%@ include file="inc/incCabec.jsp"%><%
	int 	EXIBIR_PROCURA				=	0;
	int		EXIBIR_CONSULTA				=	1;
	int		intExibir					=	0;
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String 	txtOrdem					=	UTLUtils.getStringToString( request.getParameter("txtOrdem") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	String 	txtCoord					=	UTLUtils.getStringToString( request.getParameter("txtCoord") );
	String 	txtFranquiaTitulo			=	"";
	long lCoord							=	0L;

	if ( txtOrdem.trim().length() == 0 )
	{
		txtOrdem						=	"1";
	}
	if ( txtFranquia.trim().length() == 0 )
	{
		txtFranquia						=	"0";
	}
	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );
	if ( txtOrigem.trim().length() == 0 )
	{
		txtOrigem						=	"frmCntFrqCns.jsp";
	}

	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	String	sWNome						=	"280";

	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );
	String	txtColaborador				=	UTLUtils.getStringToString( request.getParameter("txtColaborador") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtCad						=	UTLUtils.getStringToString( request.getParameter("txtCad") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	long 	lColaborador				=	0L;
	long 	lCliente					=	0L;
	if ( txtCliente.trim().length() > 0 )
	{
		lCliente						=	UTLUtils.getStringToLong( txtCliente );
	}
	if ( txtColaborador.trim().length() > 0 )
	{
		lColaborador					=	UTLUtils.getStringToLong( txtColaborador );
	}
	
	String sBr2							=	"&nbsp;&nbsp;";
	String sBr1							=	"&nbsp;";
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
		sBr1							=	"<br>&nbsp;";
		sWNome							=	"220";
	}

	CADFranquias _franquia				=	new CADFranquias( 0L, true, 0, conn );
	String 	strCookieOrdem				=	lColaborador + "_ORDCNT";
	String 	strCookieFranquia			=	lColaborador + "_FRANQUIA";
	if ( txtAcao.equals("cnsClb") || txtAcao.equals("cnsCli") )
	{
		intExibir						=	EXIBIR_CONSULTA;

		int intMaxAge 					= 	60 * 60 * 24 * 365;
		Cookie userCookie 				= 	new Cookie(strCookieOrdem, txtOrdem);
		userCookie.setMaxAge(intMaxAge);
		response.addCookie(userCookie);
		userCookie 						= 	new Cookie(strCookieFranquia, txtFranquia);
		userCookie.setMaxAge(intMaxAge);
		response.addCookie(userCookie);
		
		if ( txtFranquia.trim().length() > 0 && Integer.parseInt(txtFranquia) > 0 )
		{
//			CADFranquia _titulo			=	new CADFranquia();
//			txtFranquiaTitulo			=	" : " + _titulo.getTitulo( UTLUtils.getStringToInt(txtFranquia) );
			txtFranquiaTitulo			=	" : " + _franquia.getNome( UTLUtils.getStringToLong(txtFranquia) );
			lCoord						=	UTLUtils.getStringToLong( txtCoord );
			if ( lCoord > 0 )
			{
				CADColaborador _coord	=	new CADColaborador( lCoord, conn );
				txtFranquiaTitulo		=	txtFranquiaTitulo + " / " + _coord.getNome();
			}
		}
	}
	else
	{
		Cookie[] cookies 				= 	request.getCookies();
		for ( int i=0; i<cookies.length; i++)
		{
			if ( cookies[i].getName().equals(strCookieOrdem) )
			{
				txtOrdem				=	cookies[i].getValue();
				break;
			}
		}
		for ( int i=0; i<cookies.length; i++)
		{
			if ( cookies[i].getName().equals(strCookieFranquia) )
			{
				txtFranquia				=	cookies[i].getValue();
				break;
			}
		}
	}

//--------------------------------------------------------------Paginação: Inicio Parte 1 de 5
	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	if ( intRegistros == 0 )
	{
		if ( iWhidt > 500 )
		{
			intRegistros				=	12;
		}
		else
		{
			intRegistros				=	8;
		}
	}
	int		intPagina					=	UTLUtils.getStringToInt( request.getParameter("txtPagina") ) ;
	int		intTotal					=	UTLUtils.getStringToInt( request.getParameter("txtTotal") ) ;
	if ( intPagina == 0 )
	{
		intPagina						=	1;
	}
//--------------------------------------------------------------Paginação: Fim Parte 1 de 5

	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
		if ( txtFranquia.equals("0") || txtFranquia.equals("") )
		{
			txtFranquia					=	txtFrq;
		}
	}
	UTLCombo acesso						=	new UTLCombo(CADColaborador.CADASTRO);
	UTLCombo carteira					=	new UTLCombo(CADColaborador.CARTEIRA);
	UTLCombo ordem						=	new UTLCombo(CADContrato.ORDEM);
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
<script type="text/javascript" src="inc/js/jquery.js"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
<script type="text/Javascript">
function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if ( document.form1.txtExibir.value == "0" ) {
		document.form1.txtBusca.focus();
	} else {
		if ( parseInt(document.getElementById("txtLidos").value) > 2 ) {
			document.onkeydown = OnKeyDown;
			document.getElementById("tbPes").getElementsByTagName("tr")[3].click();
			document.getElementById("tbPes").getElementsByTagName("tr")[3].focus();
		}
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "cnsClb") {
		document.form1.txtAcao.value = "cnsClb";
		document.form1.action = "frmCntFrqCns.jsp";
	}
	if (acao == "cnsCli") {
		document.form1.txtAcao.value = "cnsCli";
		document.form1.action = "frmCntFrqCns.jsp";
	}
	if (acao == "V") {
		document.form1.txtPagina.value = "0";
		document.form1.txtRegistros.value = "0";
		document.form1.txtTotal.value = "0";
		if ( document.form1.txtOrigem.value == "" ) {
			document.form1.txtAcao.value = "";
			document.form1.action = "frmCntFrqCns.jsp";
		} else {
			document.form1.txtAcao.value = "modificar";
			document.form1.action = document.form1.txtOrigem.value;
		}
	}
	if (acao == "N") {
		document.form1.txtCodigo.value = "0";
		document.form1.txtAcao.value = "novo";
		document.form1.action = "frmCntCad.jsp";
	}
	if (acao == "M") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmCntCad.jsp";
	}
	if (acao == "X") {
		document.form1.txtAcao.value = "exibir";
		document.form1.action = "frmCntCad.jsp";
	}
	varSubmit = true;
	document.form1.submit();
}
//--------------------------------------------------------------Paginação: Inicio Parte 6
function getPage(p, r, t) {
	document.form1.txtPagina.value = p;
	document.form1.txtRegistros.value = r;
	document.form1.txtTotal.value = t;
	if ( document.form1.txtAcao.value == "cnsCli" ) {
		Submeter("cnsCli");
	} else {
		Submeter("cnsClb");
	}
}
//--------------------------------------------------------------Paginação: Fim Parte 6
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
    <div class="wrapper">
        <!-- Sidebar  -->
<%@ include file="inc/incSideBar.jsp"%>
        <!-- Page Content  -->
        <div id="content">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form">
<%
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
<%
	}
	else
	{
		if ( iWhidt > 500 )
		{

%>
				<table border="0" cellpadding="0" cellspacing="0" width="160%" height="70%" align="center">
<%
		}
		else
		{
%>
				<table border="0" cellpadding="0" cellspacing="0" width="110%" height="70%" align="center">
<%
		}
	}
%>
				<!--table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center"-->
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"    id="sWhidt"    value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"   id="sHeight"   value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"   id="txtAcao"   value="<%=txtAcao%>">
						<input type="hidden" name="txtCodigo" id="txtCodigo" value="<%=txtCodigo%>">
						<input type="hidden" name="txtExibir" id="txtExibir" value="<%=intExibir%>">
						<input type="hidden" name="txtSss"    id="txtSss"    value="<%=txtSss%>">
						<input type="hidden" name="txtAss"    id="txtAss"    value="<%=txtAss%>">
						<input type="hidden" name="txtUid"    id="txtUid"    value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"    id="txtFrq"    value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"    id="txtOwn"    value="<%=txtOwn%>">
						<tr>
							<td width="95%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="5%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan=2" valign="top">CONTRATOS / FRANQUIA CONSULTA<%=txtFranquiaTitulo%></td></tr>
<%
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
						<tr>
							<td>
								<select class="form-control shadow-sm" name="txtOrdem" id="txtOrdem" _style="background-color: #f0f8ff" ths="3" prv="4" nxt="4" onkeydown="javascript: return verEnter(event);">
									<%=ordem.getLista(txtOrdem)%>
								</select>
							</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>
								<select class="form-control shadow-sm" name="txtFranquia" id="txtFranquia" _style="background-color: #f0f8ff" ths="4" prv="2" nxt="2" onkeydown="javascript: return verEnter(event);">
<%
	int iAcesso							=	Integer.parseInt(txtAss);
//	CADFranquia _franquia				=	new CADFranquia();
	_franquia.start();
	while ( _franquia.next() )
	{
		if ( iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO || (iAcesso == CADColaborador.CADASTRO_FRANQUIA && _franquia.getId() == UTLUtils.getStringToLong(txtFrq)) )
		{
			out.write("<option value=\"" + _franquia.getId());
			out.write((_franquia.getId() == UTLUtils.getStringToLong(txtFranquia)) ? "\" selected>" : "\">");
			out.write(_franquia.getNome());
			out.write("</option>\n");
		}
	}
%>
								</select>
							</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>
								<select class="form-control shadow-sm" name="txtCoord" id="txtCoord" _style="background-color: #f0f8ff" ths="5" prv="2" nxt="2" onkeydown="javascript: return verEnter(event);">
									<option value="0"> --- coordenador --- </option>
<%
	long lFranquia						=	UTLUtils.getStringToLong(txtFrq);
	if ( iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO )
	{
		lFranquia						=	0L;
	}
	String sBusca						=	null;
	CADColaborador _colaborador			=	new CADColaborador( CADColaborador.BUSCA_CADASTRO, lFranquia, sBusca, 0, 0, 0, 0, conn );
	while ( _colaborador.next() )
	{
		out.write("<option value=\"" + _colaborador.getId());
		out.write("\">");
		out.write(_colaborador.getNome());
		out.write("</option>\n");
	}
%>
								</select>
							</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td><input class="form-control shadow-sm" type="search" name="txtBusca" id="txtBusca" placeholder="Buscar" _size="38" ths="1" prv="2" nxt="20" onfocus="javascript: this.select();" value="<%=txtBusca%>" onkeydown="javascript: return verEnter(event);"></td>
							<td><input type="button" class="btn btn-dark" value="..." title="consultar cliente" onclick="javascript: Submeter('cnsCli');"></td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('S');" value="Menu" ths="21" prv="20" nxt="1" onkeydown="javascript: return verTab(event);">
<!-- <%
		if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
		{
%>
									&nbsp;&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="Novo" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
<%
		}
%> -->
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
							</td>
						</tr>

<%
	}
	else
	{
%>
						<tr class="cabAcesso">
							<td colspan="2" bgcolor="#ffffff">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" name="tbPes" id="tbPes" >
<%
		if ( iWhidt > 500 )
		{
%>
								<tr height="1">
									<td width="36%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="12%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="7%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="14%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="12%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="11%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr height="26" style="background-color:#d7d7d7; color:#000; font-size:10pt; font-weight: bolder;">
									<td width="36%">Cliente</td>
									<td width="8%" align="center">Contrato</td>
									<td width="12%" align="center">Data</td>
									<td width="7%" align="center">Taxa</td>
									<td width="14%" align="right">Investido&nbsp;</td>
									<td width="12%" align="right">Pago&nbsp;</td>
									<td width="11%" align="right">Comiss&atilde;o</td>
								</tr>
								<tr height="1">
									<td width="36%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="12%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="7%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="14%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="12%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="11%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
<%
		}
		else
		{
%>
								<tr>
									<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr style="background-color:#d7d7d7; color:#000; font-size:10pt; font-weight: bolder;">
									<td>Cliente</td>
									<td align="center">Contrato</td>
								</tr>
								<tr>
									<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
<%
		}
		String strCor1					= 	"#e9e9e9";
		String strCor2					= 	"#d7d7d7";
		String	strCor 					= 	strCor2;
		BigDecimal bTot					=	null;
		BigDecimal bCms					=	null;
		BigDecimal bPag					=	null;

		BigDecimal bTTot				=	new BigDecimal(UTLUtils.getStringToDouble( request.getParameter("txtTotInv") ));
		BigDecimal bTCms				=	new BigDecimal(UTLUtils.getStringToDouble( request.getParameter("txtTotCms") ));

		int	iLidos						=	2;
		CADContrato _contrato			=	null;
		int iAcesso						=	Integer.parseInt(txtAss);
		long lCoordenador				=	-1;
		if ( lCoord > 0 )
		{
			lCoordenador				=	lCoord;
		}
//		if ( iAcesso == CADColaborador.CADASTRO_CADASTRO_ADMINISTRADOR )
//		{
//			lCoordenador				=	Long.parseLong(txtUid);
//		}
//		else
//		{
//			if ( txtAcao.equals("cnsClb") )
//			{
//				lCoordenador			=	lColaborador;
//			}
//		}
		if ( txtAcao.equals("cnsCli"))
		{
			txtBusca					=	"";
		}
		else
		{
			lCliente					=	0L;
		}
		if ( bTTot.doubleValue() == 0 && bTCms.doubleValue() == 0 )
		{
			_contrato					=	new CADContrato( lCliente, lCoordenador, txtBusca, UTLUtils.getStringToLong(txtFranquia), UTLUtils.getStringToInt(txtOrdem), 0, 0, 0, conn );
			while ( _contrato.next() )
			{
				if ( lCoord == 0 || _contrato.getIdColaborador() == lCoord )
				{
					bTTot				=	bTTot.add(new BigDecimal(_contrato.getValorInvestido()));
					bTCms				=	bTCms.add(new BigDecimal(_contrato.getValorInvestido() * _contrato.getPercentualComissao()));
				}
			}
		}
		_contrato						=	new CADContrato( lCliente, lCoordenador, txtBusca, UTLUtils.getStringToLong(txtFranquia), UTLUtils.getStringToInt(txtOrdem), intRegistros, intPagina, intTotal, conn );
		UTLPage pager					=	(UTLPage)_contrato;
		while ( _contrato.next() )
		{
			if ( lCoord == 0 || _contrato.getIdColaborador() == lCoord )
			{
				if ( strCor.equals(strCor1) )
				{
					strCor 				= 	strCor2;
				}
				else
				{
					strCor 				= 	strCor1;
				}
				if ( iWhidt > 500 )
				{
					out.write("<tr class=\"selecF12c\" height=\"32\"");
				}
				else
				{
					out.write("<tr class=\"selecF12c\" height=\"90\"");
				}
				out.write( " title=\"duplo click para selecionar o registro\" onmouseover=\"javascript: OnOver(event);\" onmouseout=\"javascript: OnOut(event);\" onclick=\"javascript: OnClick(event);\" ondblclick=\"javascript: OnDblClick(event);\" " );
				out.write( " onkeydown=\"javascript: OnKeyDown(event);\"  " );
				out.write( " tab=\"" + ++iLidos + "\" " );
				out.write( " bgcolor=\"" );
				out.write( strCor );
				out.write( "\" cor=\"" );
				out.write( strCor );
				out.write( "\" codigo=\"" + _contrato.getId() + "\"><td>" );
				out.write(_contrato.getCliente().getNome());
				CADClientePagamento _pag=	new CADClientePagamento( _contrato.getId(), 0L, null, null, 0, conn );
				bCms					=	new BigDecimal(_contrato.getValorInvestido() * _contrato.getPercentualComissao());
				bTot					=	new BigDecimal(_contrato.getValorInvestido());
				bPag					=	new BigDecimal(0);
				while ( _pag.next() )
				{
					if ( _pag.getDataPagamento() != null )
					{
						bPag			=	bPag.add(new BigDecimal(_pag.getValorPagamento()));
					}
				}
	//			bTTot					=	bTTot.add(bTot);
	//			bTCms					=	bTCms.add(bCms);

				if ( iWhidt > 500 )
				{
					out.write("</td><td align=\"center\">" + _contrato.getId() );
					out.write("</td><td align=\"center\">");
					out.write(UTLUtils.getDia(_contrato.getDataPagamento()) );
					out.write("</td><td align=\"center\">");
					out.write(UTLUtils.getValor(_contrato.getPercentualInvestido() * 100) );
					out.write("&nbsp;</td><td align=\"right\">");
					out.write(UTLUtils.getValor(bTot.doubleValue()));
					out.write("&nbsp;</td><td align=\"right\">");
					out.write(UTLUtils.getValor(bPag.doubleValue()));
					out.write("&nbsp;</td><td align=\"right\">");
					out.write(UTLUtils.getValor(bCms.doubleValue()));
					out.write("&nbsp;");
				}
				else
				{
					out.write("<br><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">");
					out.write(UTLUtils.getDia(_contrato.getDataPagamento()) );
					out.write("&nbsp;</span><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">&nbsp;V: ");
					out.write(UTLUtils.getValor(bTot.doubleValue()));
					out.write("&nbsp;</span><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">&nbsp;P: ");
					out.write(UTLUtils.getValor(bPag.doubleValue()));
					out.write("&nbsp;</span>");

	//				out.write("<br><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">&nbsp;Total: ");
	//				out.write(UTLUtils.getValor(bTot.doubleValue()));
	//				out.write("&nbsp;</span><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">&nbsp;Pago: ");
	//				out.write(UTLUtils.getValor(bPag.doubleValue()));
	//				out.write("&nbsp;</span>");
					if ( iWhidt < 500 )
					{
						out.write("<br>");
					}
					out.write("</td><td align=\"center\">" + _contrato.getId() );
				}
				out.write("</td></tr>\n");
			}
		}
//--------------------------------------------------------------Paginação: Inicio Parte 4 de 5
		StringBuilder _sb					=	new StringBuilder();
		int _p                              = 	pager.getRegistrosTotal() / pager.getRegistrosPorPagina();
		if ( (pager.getRegistrosTotal() % pager.getRegistrosPorPagina()) > 0 )
		{
			_p++;
		}
		_sb.append("<span class=\"paginar\">[R=");
		_sb.append(pager.getRegistrosTotal());
		_sb.append(", P=");
		_sb.append(_p);
		_sb.append("]&nbsp;</span>");
		if ( pager.getPaginaAtual() > 1 )
		{
			_sb.append( "<span style=\"cursor:pointer;\" onclick=\"javascript: getPage(");
			_sb.append( pager.getPaginaAtual() - 1 );
			_sb.append( "," );
			_sb.append( pager.getRegistrosPorPagina() );
			_sb.append( "," );
			_sb.append( pager.getRegistrosTotal() );
			_sb.append( ");\">" );
		}
		_sb.append("<<");
		if ( pager.getPaginaAtual() > 1 )
		{
			_sb.append("</span>");
		}
		int _fm								=	3;	//6;  	// Meio da faixa
		int _fl								=	6;	//12; 	// Limite da faixa
		int _fi 							= 	1;		// Faixa Inicial
		int _ff 							= 	_fl; 	// Faixa Final
		int _s								=	1;
		if ( _p > _fl )
		{
			if ( pager.getPaginaAtual() < _fm )
			{
				_fi 						= 	1;
			}
			else
			{
				_fi 						= 	pager.getPaginaAtual() - _fm + 1;
				if ( _fi > (_p - _fl) )
				{
					_fi 					=	_p - _fl;
					_s						=	0;
				}
			}
			_ff 							= 	(_fi + _fl) - _s;
		}
		for (int i=1; i<=_p; i++)
		{
			if ( i != pager.getPaginaAtual() )
			{
				if ( i >= _fi && i <= _ff )
				{
					_sb.append( "<span style=\"cursor:pointer;\" onclick=\"javascript: getPage(" );
					_sb.append( i );
					_sb.append( "," );
					_sb.append( pager.getRegistrosPorPagina() );
					_sb.append( "," );
					_sb.append( pager.getRegistrosTotal() );
					_sb.append( ");\">" );
					if ( i < 10 )
					{
						_sb.append( "&nbsp;" );
					}
					_sb.append( i );
					_sb.append( "</span>" );
				}
			}
			else
			{
				_sb.append("<span class=\"disabled\">");
				if ( i < 10 )
				{
					_sb.append( "&nbsp;" );
				}
				_sb.append( i );
				_sb.append("</span>");
			}
		}
		if ( pager.getPaginaAtual() < _p )
		{
			_sb.append( "<span style=\"cursor:pointer;\" onclick=\"javascript: getPage(" );
			_sb.append( pager.getPaginaAtual() + 1 );
			_sb.append( "," );
			_sb.append( pager.getRegistrosPorPagina() );
			_sb.append( "," );
			_sb.append( pager.getRegistrosTotal() );
			_sb.append( ");\">" );
		}
		_sb.append(">>");
		if ( pager.getPaginaAtual() < _p )
		{
			_sb.append("</span>");
		}
		String sSpan					=	"2";
		if ( iWhidt > 500 )
		{
			sSpan						=	"7";
		}
//--------------------------------------------------------------Paginação: Fim Parte 4 de 5
%>
								<tr height="1">
									<td colspan="<%=sSpan%>" width="100%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								</table>
<%
//		if ( iWhidt > 500 && iLidos > 1 )
		if ( iLidos > 1 )
		{
%>
								<table border="0" cellpadding="0" cellspacing="1" width="100%">
									<tr bgcolor="#bfbfbf" class="selecF12c">
										<td width="50%">Total inventimentos:<%=sBr1%>&nbsp;<%=UTLUtils.getValor(bTTot.doubleValue())%></td>
										<td width="50%">Total comiss&otilde;es:<%=sBr1%>&nbsp;<%=UTLUtils.getValor(bTCms.doubleValue())%></td>
									</tr>
									<tr height="1"><td colspan="2" width="100%" bgcolor="#fff"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td></tr>
								</table>
<%
		}
%>
<!-- --------------------------------------------------------------Paginação: Inicio Parte 5 de 5 -->
								<table border="0" cellpadding="0" cellspacing="0" bgcolor="#d9d9d9" width="100%">
								<tr class="linhaP"><td align="center" height="20" valign="middle"><div class="pagination"><%=_sb.toString()%></div></td></tr>
								</table>
<!-- --------------------------------------------------------------Paginação: Fim Parte 5 de 5 -->
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('X');" type="button" name="btnAcao" value="Exibir" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
								<input type="hidden" name="txtLidos" id="txtLidos" value="<%=iLidos%>">
								<input type="hidden" name="txtCliente" id="txtCliente" value="<%=txtCliente%>">
								<input type="hidden" name="txtColaborador" id="txtColaborador" value="<%=txtColaborador%>">
								<input type="hidden" name="txtBusca" id="txtBusca" value="<%=txtBusca%>">
								<input type="hidden" name="txtOrigem" id="txtOrigem" value="<%=txtOrigem%>">
								<input type="hidden" name="txtOrdem"  id="txtOrdem"  value="<%=txtOrdem%>">
								<input type="hidden" name="txtFranquia" id="txtFranquia" value="<%=txtFranquia%>">

								<input type="hidden" name="txtTotInv" id="txtTotInv" value="<%=UTLUtils.getValor(bTTot.doubleValue())%>">
								<input type="hidden" name="txtTotCms" id="txtTotCms" value="<%=UTLUtils.getValor(bTCms.doubleValue())%>">

<!-- --------------------------------------------------------------Paginação: Inicio Parte 2 de 5 -->
								<input type="hidden" name="txtRegistros" id="txtRegistros" value="<%=intRegistros%>">
								<input type="hidden" name="txtPagina" id="txtPagina" value="<%=intPagina%>">
								<input type="hidden" name="txtTotal" id="txtTotal" value="<%=intTotal%>">
<!-- --------------------------------------------------------------Paginação: Fim Parte 1 de 5 -->
								<br>
							</td>
						</tr>
<%
	}
%>
						</form>
						</table>

</body>
<script type="text/Javascript">
function verEnter(e) {
	o = window.event || e;
	tc = o.which || o.keyCode
	o = e.target || e.srcElement;
	if ( tc==27 ) {
		Submeter('V');
		return false;
	}
	if ( tc==13 ) {
		if ( o.getAttribute("ths") == "1" ) {
			Submeter('Cli');
		} else {
			Submeter('Clb');
		}
		return false;
	}
	if ( o.tagName == "BUTTON" && tc == 13 ) return true;
	if ( tc == 9 || tc == 13 || tc == 38 || tc == 40 || tc == 37 || tc == 39 ) tab(e);
	if (tc==8||tc==109||tc==189) return true;
	if (tc==9 || tc==13) return false;
	return true;
}
function OnOver(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	tr.style.cursor = "pointer";
	tr.style.background = "#ffffff";
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

function OnKeyDown(e) {
	e = window.event || e;
    k = e.which || e.keyCode;
	if ( k == 13 ) {
		document.form1.txtCodigo.value = posicaoAnterior.getAttribute("codigo");
		Submeter("M");	
	} else {
		if ( k == 40 || k == 38 ) {
			l = parseInt(document.getElementById("txtLidos").value);
			t = parseInt(posicaoAnterior.getAttribute("tab"));
			if ( k == 40 ) {	// 40-Down		
				t++;
				if ( t > l ) {
					t = 3;
				}
			} else {	// 38-Up
				t--;
				if ( t == 2 ) {
					t = l;
				}
			}
			document.getElementById("tbPes").getElementsByTagName("tr")[t].click();
			document.getElementById("tbPes").getElementsByTagName("tr")[t].focus();
		}
	}
	return true;
}

var posicaoAnterior = null;
function OnClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	if (posicaoAnterior != null) {
		posicaoAnterior.className = tr.className;
	}
	if ( tr.className == "selecF12c" ) {
		tr.className = "linhaBold";
	} else {
		tr.className = "selecF12c";
	}
	document.form1.txtCodigo.value = tr.getAttribute("codigo");
	posicaoAnterior = tr;
}

function OnDblClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	document.form1.txtCodigo.value = tr.getAttribute("codigo");
	Submeter("X");	
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
