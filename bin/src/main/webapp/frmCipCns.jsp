<%@ include file="inc/incCabec.jsp"%><%
	int 	EXIBIR_PROCURA				=	0;
	int		EXIBIR_CONSULTA				=	1;
	int		intExibir					=	0;
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
	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );
	
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	String	sWNome						=	"100";

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
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
		sWNome							=	"100";
	}
	if ( txtAcao.equals("consultar") )
	{
		intExibir						=	EXIBIR_CONSULTA;
	}
	if ( txtDataPag.trim().length() == 0 )
	{
		txtDataPag						=	UTLUtils.getDia(Calendar.getInstance());
		txtDataFin						=	UTLUtils.getDia(Calendar.getInstance());
	}

	UTLCombo acesso						=	new UTLCombo(CADColaborador.CADASTRO);
	UTLCombo carteira					=	new UTLCombo(CADColaborador.CARTEIRA);
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
    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
<link type="text/css" href="css/calendar-win2k-cold-2.css" rel="stylesheet" media="all" title="win2k-cold-2" />
<script type="text/javascript" src="inc/js/calendar-js.js"></script>
<script type="text/javascript" src="inc/js/calendar-br.js"></script>
<script type="text/javascript" src="inc/js/calendar-setup.js"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
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
		Calendar.setup({ inputField : "txtDataPag", ifFormat : "dd/mm/y", button : "imgDataCadastro", align : "Bl", singleClick :true });
		Calendar.setup({ inputField : "txtDataFin", ifFormat : "dd/mm/y", button : "imgDataFin",      align : "Bl", singleClick :true });
		document.form1.txtBusca.focus();
	} else {
		if ( parseInt(document.getElementById("txtLidos").value) > 1 ) {
			document.onkeydown = OnKeyDown;
			document.getElementById("tbPes").getElementsByTagName("tr")[1].click();
			document.getElementById("tbPes").getElementsByTagName("tr")[1].focus();
		}
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "C") {
		document.form1.txtAcao.value = "consultar";
		document.form1.action = "frmCipCns.jsp";
	}
	if (acao == "D") {
		if ( CampoVazio(document.form1.txtDataPag.value) ) {
			alert("Infotme a data base de pagamento para consulta!");
			return;
		}
		document.form1.txtAcao.value = "data";
		document.form1.action = "frmCipCad.jsp";
	}
	if (acao == "V") {
		if ( document.form1.txtOrigem.value == "" ) {
			if ( document.form1.txtAcao.value == "" ) {
				if ( document.form1.txtExibir.value == "1" ) {
					document.form1.txtExibir.value = "0";
					document.form1.action = "frmCipCns.jsp";
				} else {
					document.form1.action="frmMenu.jsp";
				}
			} else {
				document.form1.txtAcao.value = "";
				document.form1.action = "frmCipCns.jsp";
			}
		} else {
			document.form1.txtAcao.value = "modificar";
			document.form1.action = document.form1.txtOrigem.value;
		}
	}
	if (acao == "N") {
		document.form1.txtCodigo.value = "0";
		document.form1.txtAcao.value = "novo";
		document.form1.action = "frmCipCad.jsp";
	}
	if (acao == "M") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmCipCad.jsp";
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
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"    id="sWhidt"    value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"   id="sHeight"   value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"   id="txtAcao"   value="">
						<input type="hidden" name="txtCodigo" id="txtCodigo" value="<%=txtCodigo%>">
						<input type="hidden" name="txtExibir" id="txtExibir" value="<%=intExibir%>">
						<input type="hidden" name="txtSss"    id="txtSss"    value="<%=txtSss%>">
						<input type="hidden" name="txtAss"    id="txtAss"    value="<%=txtAss%>">
						<input type="hidden" name="txtUid"    id="txtUid"    value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"    id="txtOwn"    value="<%=txtOwn%>">
						<tr>
							<td width="95%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="5%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan=2" valign="top">PAGAMENTOS CLIENTE CONSULTA</td></tr>
<%
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
						<tr height="32">
							<td>
								<select class="form-control shadow-sm" name="txtColaborador" id="txtColaborador" ths="1" prv="20" nxt="2" onkeydown="javascript: return verEnter(event);">
<%
	CADColaborador _colaborador			=	new CADColaborador( CADColaborador.BUSCA_CONTRATO, 0L, null, 0, 0, 0, 0, conn );
	int iAcesso							=	Integer.parseInt(txtAss);
	long lCoordenador					=	Long.parseLong(txtUid);
	while ( _colaborador.next() )
	{
		if ( iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO || _colaborador.getId() == lCoordenador )
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
				out.write("-- contratos sem colaborador --");
			}
			else
			{
				out.write(_colaborador.getNome());
			}
			out.write(" [ " + _colaborador.getNumeroContratos());
			out.write(" ]</option>\n");
		}
	}
%>
								</select>
							</td>
							<td align="center"><input type="button" class="btn btn-dark" value="..." title="consultar coordenador" onclick="javascript: Submeter('C');"></td>
						</tr>
						<tr height="32">
							<td><input class="form-control shadow-sm" type="search" name="txtBusca" id="txtBusca" placeholder="Buscar cliente" _size="38" ths="2" prv="1" nxt="3" onfocus="javascript: this.select();" value="<%=txtBusca%>" onkeydown="javascript: return verEnter(event);"></td>
							<td align="center"><input type="button" class="btn btn-dark" value="..." title="consultar cliente" onclick="javascript: Submeter('C');"></td>
						</tr>
						<tr height="32">
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr width="100%">
									<td width="40%">
										Data in&iacute;cio:&nbsp;<input class="form-control-30" type="text" title="data base de in&iacute;cio para pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" value="<%=txtDataPag%>" ths="3" prv="2" nxt="4" id="txtDataPag" name="txtDataPag" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verEnter(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">
									</td>
									<td width="60%" valign="middle">
										&nbsp;<img src="img/calendario.gif" width="22" height="21" border="0" style="cursor: pointer; align:left; valign:middle;" id="imgDataCadastro" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data base de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;">
									</td>
								</tr>
								</table>
							</td>
							<td align="center"><!--input type="button" class="btn btn-dark" value="..." title="consultar data base" onclick="javascript: Submeter('D');"--></td>
						</tr>
						<tr height="32">
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr width="100%">
									<td width="40%">
										Data fim&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<input class="form-control-30" type="text" title="data base final para pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" value="<%=txtDataFin%>" ths="4" prv="3" nxt="1" id="txtDataFin" name="txtDataFin" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verEnter(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">
									</td>
									<td width="60%" valign="middle">
										&nbsp;<img src="img/calendario.gif" width="22" height="21" border="0" style="cursor: pointer; align:left; valign:middle;" id="imgDataFin" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data base de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;">
									</td>
								</tr>
								</table>
							</td>
							<td align="center"><input type="button" class="btn btn-dark" value="..." title="consultar data base" onclick="javascript: Submeter('D');"></td>
						</tr>
						<tr height="30"  _bgcolor="#bfbfbf">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
							</td>
						</tr>
<%
	}
	else
	{
%>
						<tr>
							<td colspan="2" bgcolor="#fff" align="center">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#fff" name="tbCab" id="tbCab" >
<%
		if ( iWhidt > 500 )
		{
%>
								<tr>
									<td width="50%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="11%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="11%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="2%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr height="26" style="background-color:#d7d7d7; color:#000; font-size:10pt; font-weight: bolder;">
									<td width="50%">Cliente</td>
									<td width="8%" align="center">Contrato</td>
									<td width="11%" align="center">Data</td>
									<td width="8%" align="center">Taxa</td>
									<td width="11%" align="right">Investido&nbsp;</td>
									<td width="10%" align="right">Pago</td>
									<td width="2%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr>
									<td width="50%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="11%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="11%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="2%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
<%
		}
		else
		{
%>
								<tr>
									<td width="86%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="4%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr style="background-color:#d7d7d7; color:#000; font-size:10pt; font-weight: bolder;">
									<td>Cliente</td>
									<td align="center">Contrato</td>
									<td align="center"></td>
								</tr>
								<tr>
									<td width="86%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="4%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
<%
		}
%>
								</table>
							<div name="divProg" id="divProg" style="height: 300; width: 100%; overflow: auto; display:block; overflow-y: scroll;">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" name="tbPes" id="tbPes" >
<%
		if ( iWhidt > 500 )
		{
%>
								<tr>
									<td width="54%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="8%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
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
<%
		}
		String strCor1					= 	"#e9e9e9";
		String strCor2					= 	"#d7d7d7";
		String strCor 					= 	strCor2;
		BigDecimal bTot					=	null;
		BigDecimal bPag					=	null;
		int	iLidos						=	0;
		if ( txtBusca.trim().length() > 0 || lCliente > 0)
		{
			lColaborador				=	-1;
		}
		CADContrato _contrato			=	null;
		if ( lCliente > 0 )
		{
//			_contrato					=	new CADContrato( lCliente, 0L, null, 0, 0, intRegistros, intPagina, intTotal, conn );
			_contrato					=	new CADContrato( lCliente, 0L, null, 0, 0, 0, 0, 0, conn );
		}
		else
		{
//			_contrato					=	new CADContrato( 0L, lColaborador, txtBusca, 0, 0, intRegistros, intPagina, intTotal, conn );
			_contrato					=	new CADContrato( 0L, lColaborador, txtBusca, 0, 0, 0, 0, 0, conn );
		}
		UTLPage pager					=	(UTLPage)_contrato;
		while ( _contrato.next() )
		{
			if ( strCor.equals(strCor1) )
			{
				strCor 					= 	strCor2;
			}
			else
			{
				strCor 					= 	strCor1;
			}
			
			if ( iWhidt > 500 )
			{
				out.write("<tr class=\"selecF12c\" height=\"36\"");
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
			out.write( "\" codigo=\"" + _contrato.getId() + "\"><td>&nbsp;" );
			out.write(_contrato.getCliente().getNome());
			bTot						=	new BigDecimal(_contrato.getValorInvestido());
			bPag						=	new BigDecimal(0);
			CADClientePagamento _pag	=	new CADClientePagamento( _contrato.getId(), 0L, null, null, 0, conn );
			while ( _pag.next() )
			{
				if ( _pag.getDataPagamento() != null )
				{
					bPag				=	bPag.add(new BigDecimal(_pag.getValorPagamento()));
				}
			}
			
			if ( iWhidt > 500 )
			{
				out.write("</td><td align=\"center\">" + _contrato.getId() );
				out.write("</td><td align=\"center\">");
				out.write(UTLUtils.getDia(_contrato.getDataPagamento()) );
				out.write("</td><td align=\"center\">");
				out.write(UTLUtils.getValor(_contrato.getPercentualInvestido() * 100) );
				out.write("</td><td align=\"right\">");
				out.write(UTLUtils.getValor(bTot.doubleValue()));
				out.write("&nbsp;</td><td align=\"right\">");
				out.write(UTLUtils.getValor(bPag.doubleValue()));
				out.write("&nbsp;");
			}
			else
			{
				out.write("<br><span class=\"linha\">Total: ");
				out.write(UTLUtils.getValor(bTot.doubleValue()));
				out.write("</span>&nbsp;&nbsp;&nbsp;<span class=\"linha\">Pago: ");
				out.write(UTLUtils.getValor(bPag.doubleValue()));
				out.write("</span>");
				out.write("</td><td align=\"center\">" + _contrato.getId() );
			}
			out.write("</td></tr>\n");
		}
//--------------------------------------------------------------Paginação: Inicio Parte 4 de 5
		String sSpan					=	"2";
		if ( iWhidt > 500 )
		{
			sSpan						=	"6";
		}
//--------------------------------------------------------------Paginação: Fim Parte 4 de 5
%>
								<tr height="1">
									<td colspan="<%=sSpan%>" width="100%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								</table>
								</div>
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom" width="100%" align="center">
								<div name="divBtn" id="divBtn" width="100%" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('M');" type="button" name="btnAcao" value="Listar" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
<%
//	int iAcesso							=	Integer.parseInt(txtAss);
//	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
//	{
%>
<!--
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="Novo" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
-->
<%
//	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
								<input type="hidden" name="txtLidos" id="txtLidos" value="<%=iLidos%>">
								<input type="hidden" name="txtCliente" id="txtCliente" value="<%=txtCliente%>">
								<input type="hidden" name="txtColaborador" id="txtColaborador" value="<%=txtColaborador%>">
								<input type="hidden" name="txtBusca" id="txtBusca" value="<%=txtBusca%>">
								<input type="hidden" name="txtOrigem" id="txtOrigem" value="<%=txtOrigem%>">
								<br>
							</td>
						</tr>
<%
	}
%>
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
function verEnter(e) {
	o = window.event || e;
	tc = o.which || o.keyCode
	o = e.target || e.srcElement;
	if ( tc==27 ) {
		Submeter('V');
		return false;
	}
	if ( tc==13 ) {
		if ( o.getAttribute("ths") == "3" ) {
			Submeter('D');
		} else {
			Submeter('C');
		}
		return false;
	}
	if ( o.tagName == "BUTTON" && tc == 13 ) return true;
	if ( tc == 9 || tc == 13 || tc == 38 || tc == 40 || tc == 37 || tc == 39 ) tab(e);
	if (tc==8||tc==109||tc==189) return true;
	if (tc==9 || tc==13) return false;
	return true;
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
					t = 2;
				}
			} else {	// 38-Up
				t--;
				if ( t == 0 ) {
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
	Submeter("M");	
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
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
