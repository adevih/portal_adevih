<%@ include file="inc/incCabec.jsp"%><%
	int 	EXIBIR_PROCURA				=	0;
	int		EXIBIR_CONSULTA				=	1;
	int		intExibir					=	0;
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
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
	String	sWNome						=	"280";

	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );
	String	txtColaborador				=	UTLUtils.getStringToString( request.getParameter("txtColaborador") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtCad						=	UTLUtils.getStringToString( request.getParameter("txtCad") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	long	lFranquiaCoordenador		=	UTLUtils.getStringToLong( txtFrq );
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
	if ( iWhidt < 1 )
	{
		sBr2							=	"<br><br>";
		sWNome							=	"220";
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

//--------------------------------------------------------------Pagina��o: Inicio Parte 1 de 5
	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	if ( intRegistros == 0 )
	{
		if ( iWhidt > 1 )
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
//--------------------------------------------------------------Pagina��o: Fim Parte 1 de 5

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
<link rel="icon" href="img/favIcon.png">
<link rel="stylesheet" href="css/style1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/solid.min.js" integrity="sha512-dcTe66qF6q/NW1X64tKXnDDcaVyRowrsVQ9wX6u7KSQpYuAl5COzdMIYDg+HqAXhPpIz1LO9ilUCL4qCbHN5Ng==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js" integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
		document.form1.txtDataPag.focus();
	} else {
		if ( parseInt(document.getElementById("txtLidos").value) > 2 ) {
			document.onkeydown = OnKeyDown;
			document.getElementById("tbPes").getElementsByTagName("tr")[3].click();
			document.getElementById("tbPes").getElementsByTagName("tr")[3].focus();
		}
	}

	let sidebar = document.querySelector(".cttNovoPag")
	sidebar.style.background = "#0b7fab";
	if ( document.form1.txtExibir.value == "0" ) {
		document.form1.txtBusca.focus();
	} else {
		if ( parseInt(document.getElementById("txtLidos").value) > 0 ) {
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
		document.form1.action = "frmCbpCns.jsp";
	}
	if (acao == "D") {
		if ( CampoVazio(document.form1.txtDataPag.value) ) {
			alert("Infotme a data base de pagamento para consulta!");
			return;
		}
		document.form1.txtColaborador.selectedIndex = 0;
		document.form1.txtCodigo.value = "0";
		document.form1.txtAcao.value = "data";
		document.form1.action = "frmCbpCad.jsp";
	}
	if (acao == "V") {
		document.form1.txtPagina.value = "0";
		document.form1.txtRegistros.value = "0";
		document.form1.txtTotal.value = "0";
		if ( document.form1.txtOrigem.value == "" ) {
			if ( document.form1.txtAcao.value == "" ) {
				if ( document.form1.txtExibir.value == "1" ) {
					document.form1.txtExibir.value = "0";
					document.form1.action = "frmCbpCns.jsp";
				} else {
					document.form1.action="frmMenu.jsp";
				}
			} else {
				document.form1.txtAcao.value = "";
				document.form1.action = "frmCbpCns.jsp";
			}
		} else {
			document.form1.txtAcao.value = "modificar";
			document.form1.action = document.form1.txtOrigem.value;
		}
	}
	if (acao == "M") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmCbpCad.jsp";
	}
	varSubmit = true;
	document.getElementById("divBtn").style.display = "none";
	document.getElementById("divBtn").style.visibility = "hidden";
	document.getElementById("divPro").style.display = "block";
	document.getElementById("divPro").style.visibility = "visible";
	document.form1.submit();
}
//--------------------------------------------------------------Pagina��o: Inicio Parte 6
function getPage(p, r, t) {
	document.form1.txtPagina.value = p;
	document.form1.txtRegistros.value = r;
	document.form1.txtTotal.value = t;
	Submeter("C");
}
//--------------------------------------------------------------Pagina��o: Fim Parte 6
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
<body style="background-color:#121212;" onload="javascript: Foco();">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto">
<%@ include file="inc/incSideBar2.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form w-100">
<%-- <%
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
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
<%
		}
		else
		{
%>
				<table border="0" cellpadding="0" cellspacing="0" width="110%" height="70%" align="center">
<%
		}
	}
%> --%>
				<!--table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center"-->
				<tr>
					<td class="w-100 text-center"  valign="top">
						<table class="w-100" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"    		id="sWhidt"    		value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"   		id="sHeight"   		value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"   		id="txtAcao"   		value="<%=txtAcao%>">
						<input type="hidden" name="txtCodigo" 		id="txtCodigo" 		value="<%=txtCodigo%>">
						<input type="hidden" name="txtExibir" 		id="txtExibir" 		value="<%=intExibir%>">
						<input type="hidden" name="txtSss"    		id="txtSss"    		value="<%=txtSss%>">
						<input type="hidden" name="txtAss"    		id="txtAss"    		value="<%=txtAss%>">
						<input type="hidden" name="txtUid"    		id="txtUid"    		value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"    		id="txtFrq"    		value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"    		id="txtOwn"    		value="<%=txtOwn%>">
<!-- --------------------------------------------------------------Pagina��o: Inicio Parte 2 de 5 -->
						<input type="hidden" name="txtRegistros" 	id="txtRegistros"	value="<%=intRegistros%>">
						<input type="hidden" name="txtPagina" 		id="txtPagina" 		value="<%=intPagina%>">
						<input type="hidden" name="txtTotal" 		id="txtTotal" 		value="<%=intTotal%>">
<!-- --------------------------------------------------------------Pagina��o: Fim Parte 1 de 5 -->
						<tr class="selecF12 col-2" height="25"><td class="col-2 text-center" colspan="2" valign="top">COORDINATOR'S REMUNERATION</td></tr>
<%
	int iAcesso							=	Integer.parseInt(txtAss);
	long lCoordenador					=	Long.parseLong(txtUid);
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
						<tr class="w-100 m-0 p-0 d-flex row col-12 justify-content-center">
							<td class="justify-content-center d-inline-flex">
								<select class="form-control text-center" style="width:40vh;" name="txtColaborador" id="txtColaborador" _style="background-color: #f0f8ff" ths="1" prv="20" nxt="2" onkeydown="javascript: return verEnter(event);">
<%
	if ( iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_FRANQUIA || iAcesso == CADColaborador.CADASTRO_EXECUTIVO )
	{
		out.write("<option value=\"-2\">WITHOUT COORDINATORS</option>");
	}
	CADColaborador _colaborador			=	new CADColaborador( CADColaborador.BUSCA_CONTRATO, 0L, null, 0, 0, 0, 0, conn );
	while ( _colaborador.next() )
	{
		if ( iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO || _colaborador.getId() == lCoordenador || (iAcesso == CADColaborador.CADASTRO_FRANQUIA && _colaborador.getIdFranquia() == lFranquiaCoordenador) )
		{
			if ( _colaborador.getId() > 0 )
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
				if ( _colaborador.getId() == 0 && (iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO) )
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
	}
%>
								</select>
							
							</td>
						</tr>


							<td class="w-100 m-0 p-0 d-flex flex-column row col-12 align-items-center justify-content-center">
									<span class="col-12 m-2 p-0 w-auto" style="color:#fff;">DATE FROM</span>
									<input class="form-control col-5 col-lg-1 m-1 text-center" style="width:40vh;" type="text" title="data base de pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" value="<%=txtDataPag%>" ths="3" prv="2" nxt="4" id="txtDataPag" name="txtDataPag" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verEnter(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">
									<%-- <img class="m-0 col-1 p-0 w-auto" src="img/calendario.gif" width="22" height="21" border="0" style="cursor: pointer; align:left; valign:middle;" id="imgDataCadastro" alt="data base in&iacute;cio para pagamento da comiss&atilde;o" align="absmiddle" onMouseOver="javascript: window.status='Data base de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;"> --%>
									<span class="col-12 m-2 p-0 w-auto" style="color:#fff;">DATE TO</span>
									<input class="form-control col-5 col-lg-1 m-1 text-center" style="width:40vh;" type="text" title="data base fim para pagamento da comiss&atilde;o" onfocus="javascript: window.status=this.title; this.select();" value="<%=txtDataFin%>" ths="4" prv="3" nxt="1" id="txtDataFin" name="txtDataFin" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verEnter(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">
									<%-- <img class="m-0 col-1 p-0 w-auto" src="img/calendario.gif" width="22" height="21" border="0" style="cursor: pointer; align:left; valign:middle;" id="imgDataFin" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data base de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;"> --%>
							</td>
							<!--<td>input type="button" class="btn btn-dark" value="..." title="consultar data base" onclick="javascript: Submeter('D');"</td>-->


						<%-- <tr class="w-100 m-0 p-0 d-flex row justify-content-center">
							<td>
								<table class="col-12" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<span class="col-3 m-1" style="color:#fff;">Data fim:</span><input class="form-control-30 col-6 col-lg-1 m-1 text-center" type="text" title="data base fim para pagamento da comiss&atilde;o" onfocus="javascript: window.status=this.title; this.select();" value="<%=txtDataFin%>" ths="4" prv="3" nxt="1" id="txtDataFin" name="txtDataFin" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verEnter(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">
									<img class="m-1" src="img/calendario.gif" width="22" height="21" border="0" style="cursor: pointer; align:left; valign:middle;" id="imgDataFin" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data base de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;">
								</tr>
								</table>
							</td>
						</tr> --%>
						<td class="w-100 m-0 p-0 d-flex flex-column align-items-center">
							<input type="button" class="btn btn-dark col-5 col-lg-2 m-1" value="CONSULT DATE" title="CONSULT USING THE DATE" onclick="javascript: Submeter('D');">
							<input type="button" class="btn btn-dark col-5 col-lg-2 m-1 d-none" value="Consulta Geral" title="consultar coordenador" onclick="javascript: Submeter('C');">
						</td>


						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
							</td>
						</tr>

<%
	}
	else
	{
%>
						<tr class="selecF12 w-100 col-12 d-flex justify-content-center">
							<td colspan="2" class="w-100 d-flex flex-wrap m-0 col-12 justify-content-center  container">
								<table class="w-100 col-12" cellpadding="0" cellspacing="1" name="tbPes" id="tbPes" >
<%
		if ( iWhidt > 1 )
		{
%>
								<tr class="w-25 col-12" style="background-color:#3d3d3d; color:#000; font-size:1vh; font-weight: bolder;">
									<td class="col-2 text-center">Coordinator</td>
									<!--td>&nbsp;Cliente</td-->
									<td class="col-2 text-center">Contract</td>
									<td class="col-2 text-center">Date</td>
									<%-- <td class="col-2 text-center">Comiss&atilde;o</td> --%>
									<td class="col-2 text-center">Invested</td>
									<%-- <td class="col-2 text-center">Pago</td> --%>
								</tr>
<%
		}
		else
		{
%>
								<tr style="background-color:#3d3d3d; color:#000; font-size:10pt; font-weight: bolder;">
									<td>Coordenador</td>
									<td align="center">Contrato</td>
								</tr>
								<%-- <tr>
									<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
<%
		}
		String strCor1					= 	"#525252";
		String strCor2					= 	"#3d3d3d";
		String	strCor 					= 	strCor2;
		BigDecimal bTot					=	null;
		BigDecimal bPag					=	null;
		int	iLidos						=	2;
		if ( txtBusca.trim().length() > 0 || lCliente > 0)
		{
			lColaborador				=	-1;
		}
		CADContrato _contrato			=	null;
//		if ( lCliente > 0 )
//		{
//			_contrato					=	new CADContrato( lCliente, 0L, null, 0, 1, intRegistros, intPagina, intTotal, conn );
//		}
//		else
//		{
//			_contrato					=	new CADContrato( 0L, lColaborador, txtBusca, 0, 1, intRegistros, intPagina, intTotal, conn );
//		}
		if ( iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO )
		{
			_contrato					=	new CADContrato( 0L, -1, null, 0, 1, intRegistros, intPagina, intTotal, conn );
		}
		else
		{
			if ( iAcesso == CADColaborador.CADASTRO_FRANQUIA )
			{
				_contrato				=	new CADContrato( 0L, -1, null, lFranquiaCoordenador, 1, intRegistros, intPagina, intTotal, conn );
			}
			else
			{
				_contrato				=	new CADContrato( 0L, lColaborador, null, 0L, 1, intRegistros, intPagina, intTotal, conn );
			}
		}
		UTLPage pager					=	(UTLPage)_contrato;
		while ( _contrato.next() )
		{
//			if ( _contrato.getIdColaborador() > 0 && (iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_EXECUTIVO  || _contrato.getIdColaborador() == lCoordenador || (iAcesso == CADColaborador.CADASTRO_FRANQUIA && _contrato.getIdFranquia() == lFranquiaCoordenador))  )
//			{
				if ( strCor.equals(strCor1) )
				{
					strCor 					= 	strCor2;
				}
				else
				{
					strCor 					= 	strCor1;
				}
				if ( iWhidt > 1 )
				{
					out.write("<tr class=\"selecF12c\" _height=\"30\"");
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
				out.write( "\" codigo=\"" + _contrato.getId() + "\"><td align=\"center\">" );
				bTot						=	new BigDecimal(_contrato.getMoedaValor());
				bPag						=	new BigDecimal(0);
				CADColaboradorPagamento _pag=	new CADColaboradorPagamento( _contrato.getId(), 0L, lColaborador, null, null, 0, conn );
				
				
				// PAGINA��O //
				while ( _pag.next() )
				{
					if ( _pag.getDataPagamento() != null )
					{
						bPag				=	bPag.add(new BigDecimal(_pag.getValorPagamento()));
					}
				}
				out.write(_contrato.getColaborador().getNome());
				if ( iWhidt > 1 )
				{
//					out.write("</td><td>&nbsp;");
//					out.write(_contrato.getCliente().getNome());
					out.write("</td><td align=\"center\">" + _contrato.getId() );
					out.write("</td><td align=\"center\">");
					out.write(UTLUtils.getDia(_contrato.getDataPagamento()) );
					out.write("</td><td align=\"center\">");
//					out.write(UTLUtils.getValor(_contrato.getPercentualComissao() * 100) );
//					out.write("</td><td align=\"right\">");
					out.write(UTLUtils.getValor(bTot.doubleValue()));
//					out.write("&nbsp;</td><td align=\"right\">");
//					out.write(UTLUtils.getValor(bPag.doubleValue()));
				}
				else
				{
//					out.write("<br>");
//					out.write(_contrato.getCliente().getNome());
					out.write("<br><span class=\"linha\">Total: ");
					out.write(UTLUtils.getValor(bTot.doubleValue()));
					out.write("</span>&nbsp;&nbsp;&nbsp;<span class=\"linha\">Pago: ");
					out.write(UTLUtils.getValor(bPag.doubleValue()));
					out.write("</span>");
					if ( iWhidt < 1 )
					{
						out.write("<br>");
					}
					out.write("</td><td align=\"center\">" + _contrato.getId() );
				}
				out.write("</td></tr>\n");
//			}
		}
//--------------------------------------------------------------Pagina��o: Inicio Parte 4 de 5
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
//--------------------------------------------------------------Pagina��o: Fim Parte 4 de 5
%>
								</table>
<!-- --------------------------------------------------------------Pagina��o: Inicio Parte 5 de 5 -->
								<table border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" class="w-100 col-12">
									<tr class="linhaP text-center"><td class="text-center" height="20"><div class="pagination"><%=_sb.toString()%></div></td></tr>
								</table>
<!-- --------------------------------------------------------------Pagina��o: Fim Parte 5 de 5 -->
							</td>
						</tr>
						<tr class="h-auto">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom w-25 col-6" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom w-25 col-6" onclick="javascript: Submeter('M');" type="button" name="btnAcao" value="Listar" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
<%
//		int iAcesso							=	Integer.parseInt(txtAss);
//		if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
//		{
%>
<!--
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="Novo" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
-->
<%
//		}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
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
