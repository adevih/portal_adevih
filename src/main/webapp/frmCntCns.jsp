<%@ include file="inc/incCabec.jsp"%><%@ page import="java.util.regex.Matcher.*,java.util.regex.Pattern.*"%><%
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

	if ( txtOrdem.trim().length() == 0 )
	{
		txtOrdem						=	"1";
	}
	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}
	long lFranquia						=	0L;
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
		lFranquia						=	UTLUtils.getStringToLong(txtFrq);
	}

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
	String	txtTitulo					=	"";
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
	if ( iWhidt < 1 )
	{
		sBr2							=	"<br><br>";
		sBr1							=	"<br>&nbsp;";
		sWNome							=	"220";
	}

	String 	strCookie					=	lColaborador + "_ORDCNT";
	if ( txtAcao.equals("cnsClb") || txtAcao.equals("cnsCli") )
	{
		intExibir						=	EXIBIR_CONSULTA;

		int intMaxAge 					= 	60 * 60 * 24 * 365;
		Cookie userCookie 				= 	new Cookie(strCookie, txtOrdem);
		userCookie.setMaxAge(intMaxAge);
		response.addCookie(userCookie);
		if ( txtAcao.equals("cnsClb") )
		{
			CADColaborador _colaborador	=	new CADColaborador(lColaborador, conn);
			txtTitulo					=	" : " + _colaborador.getNome();
		}
		else
		{
			txtTitulo					=	" : Investors";
		}
		
	}
	else
	{
		Cookie[] cookies 				= 	request.getCookies();
		for ( int i=0; i<cookies.length; i++)
		{
			if ( cookies[i].getName().equals(strCookie) )
			{
				txtOrdem				=	cookies[i].getValue();
				break;
			}
		}
	}

//--------------------------------------------------------------Pagina??o: Inicio Parte 1 de 5
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
//--------------------------------------------------------------Pagina??o: Fim Parte 1 de 5
	UTLCombo acesso						=	new UTLCombo(CADColaborador.CADASTRO);
	UTLCombo carteira					=	new UTLCombo(CADColaborador.CARTEIRA);
	UTLCombo ordem						=	new UTLCombo(CADContrato.ORDEM);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- <%=txtOrdem%> -->
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
    <!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/solid.min.js" integrity="sha512-dcTe66qF6q/NW1X64tKXnDDcaVyRowrsVQ9wX6u7KSQpYuAl5COzdMIYDg+HqAXhPpIz1LO9ilUCL4qCbHN5Ng==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js" integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/Javascript">
function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
		carrega();
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
	let sidebar = document.querySelector(".cttNovoCon")
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
	if (acao == "S") {
		document.form1.action="frmMenu.jsp";
	}
	if (acao == "cnsClb") {
		document.form1.txtAcao.value = "cnsClb";
		document.form1.action = "frmCntCns.jsp";
	}
	if (acao == "cnsCli") {
		document.form1.txtAcao.value = "cnsCli";
		document.form1.action = "frmCntCns.jsp";
	}
	if (acao == "V") {
		if ( document.form1.txtOrigem.value == "" ) {
			document.form1.txtAcao.value = "";
			document.form1.action = "frmCntCns.jsp";
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
	varSubmit = true;
	document.getElementById("divBtn").style.display = "none";
	document.getElementById("divBtn").style.visibility = "hidden";
	document.getElementById("divPro").style.display = "block";
	document.getElementById("divPro").style.visibility = "visible";
	document.form1.submit();
}
//--------------------------------------------------------------Pagina??o: Inicio Parte 6
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
//--------------------------------------------------------------Pagina??o: Fim Parte 6
</script>
<body class="m-0 p-0" onload="javascript: Foco();" style="background-color:#121212;">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto" style="background-color:#121212;">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto">
<%@ include file="inc/incSideBar2.jsp"%>
	</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center" style="background-color:#121212;">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form w-100" style="background-color:#121212;">

<%-- <%
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
<%
	}
	else
	{
%>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" class="col-12 col-lg-6 m-auto" >
<%
	}
%> --%>
				<tr style="background-color:#121212;">
					<td width="100%" height="100%" align="center" valign="top" style="background-color:#121212;">
						<table class="col-12 m-0" border="0" cellpadding="0" cellspacing="0" >
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
						<%-- <tr height="1">
							<td width="95%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="5%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr> --%>
						<tr class="selecF12 col-2" height="25"><td class="col-2 text-center" colspan="2" valign="top">INVESTORS' CONTRACT<%=txtTitulo%></td></tr>
<%
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
						<tr class="w-100 m-0 p-0 d-flex row col-12 justify-content-center">
							<td class="justify-content-center d-inline-flex">
								<select class="form-control text-center" style="width:40vh;" name="txtOrdem" id="txtOrdem" _style="background-color: #f0f8ff" ths="3" prv="2" nxt="2" onkeydown="javascript: return verEnter(event);">
									<%=ordem.getLista(txtOrdem)%>
								</select>
							</td>
						</tr>

						<tr>
							<td class="w-100 m-0 p-0 d-flex flex-column row col-12 align-items-center justify-content-center">
								<select class="form-control shadow-sm col-5 col-lg-1 m-1 text-center mb-2" style="width:40vh;" name="txtColaborador" id="txtColaborador" _style="width:210px; background-color: #f0f8ff" ths="2" prv="1" nxt="1" onkeydown="javascript: return verEnter(event);">
<%
		CADColaborador _colaborador		=	new CADColaborador( CADColaborador.BUSCA_CONTRATO, lFranquia, null, 0, 0, 0, 0, conn );
		int iAcesso						=	Integer.parseInt(txtAss);
		long lCoordenador				=	Long.parseLong(txtUid);
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
					out.write("-- Contracts without Coordinators --");
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

						</tr>
						<tr>
							<td class="w-100 m-0 p-0 d-flex row justify-content-center">
								<input class="form-control shadow-sm mb-2 text-center" style="width:40vh;" type="search" name="txtBusca" id="txtBusca" placeholder=" Search for investor" _size="38" ths="1" prv="2" nxt="20" onfocus="javascript: this.select();" value="<%=txtBusca%>" onkeydown="javascript: return verEnter(event);">
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="bottom" class="w-100 m-0 p-0 d-flex flex-column align-items-center">
							<input type="button" class="btn btn-dark btn-custom m-1" value="Search for coordinator" title="Search for coordinator" onclick="javascript: Submeter('cnsClb');">
							<input type="button" class="btn btn-dark btn-custom m-1" value="Search for investor" title="Search for investor" onclick="javascript: Submeter('cnsCli');">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>



<%
		if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
		{
%>
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="New Contract" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
<%
		}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;">
								<div class="spinner-border text-light" role="status"></div>
								</div>
							</td>
						</tr>

<%
	}
	else
	{
%>
						<tr class="selecF12 w-100" style="">
							<td class="w-100" colspan="2" bgcolor="#fff" valign="top" style="background-color:#121212;">
								<table class="w-100" border="0" cellpadding="0" cellspacing="1" bgcolor="#fff" name="tbPes" id="tbPes">
<%
		if ( iWhidt > 1 )
		{
%>

								<tr height="26" class="w-100" style="background-color:#323232; color:#fff; font-size:1vh; font-weight: bolder;">
									<td class="col-2 text-center">Investor</td>
									<%-- <td class="col-1 text-center">Contrato</td> --%>
								
								<%-- JSP Acesso - Contrato --%>
								<%
								int iAcesso						=	Integer.parseInt(txtAss);
								if (iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == 4)
									{
								%>
									<td class="col-1 text-center">Contract</td>
								<%
									}
								%>
									<%-- <td class="col-1 text-center">Taxa</td> --%>
									<td class="col-1 text-center">Date</td>
									<td class="col-1 text-center">Invested</td>
									<td class="col-1 text-center bg-primary" style="font-size:1.4em;">Monetized</td> 
									
									<%-- <td class="col-2 text-center">Pago</td>
									<td class="col-1 text-center">Comiss&atilde;o</td> --%>
								</tr>
<%
		}
		else
		{
%>
								<tr class="d-flex row col-12 flex-nowrap text-center" style="background-color:#3d3d3d; color:#fff; font-size:10pt; font-weight: bolder;">
									<td>Investor</td>
									<td align="center">Contract</td>
								</tr>
<%
		}
		String strCor1					= 	"#525252";
		String strCor2					= 	"#3d3d3d";
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
		if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )
		{
			lCoordenador				=	Long.parseLong(txtUid);
		}
		else
		{
			if ( txtAcao.equals("cnsClb") )
			{
				lCoordenador			=	lColaborador;
			}
		}
		if ( txtAcao.equals("cnsCli"))
		{
			lCliente					=	0L;
		}
		else
		{
			txtBusca					=	"";
		}
		if ( bTTot.doubleValue() == 0 && bTCms.doubleValue() == 0 )
		{
//			_contrato					=	new CADContrato( lCliente, lCoordenador, txtBusca, lFranquia, 0, 0, 0, 0, conn );
			_contrato					=	new CADContrato( lCliente, lCoordenador, txtBusca, 0, 0, 0, 0, 0, conn );
			while ( _contrato.next() )
			{
				bTTot					=	bTTot.add(new BigDecimal(_contrato.getMoedaValor()));
				bTCms					=	bTCms.add(new BigDecimal(_contrato.getValorInvestido() * _contrato.getPercentualComissao()));
			}
		}
//		_contrato						=	new CADContrato( lCliente, lCoordenador, txtBusca, lFranquia, UTLUtils.getStringToInt(txtOrdem), intRegistros, intPagina, intTotal, conn );
		_contrato						=	new CADContrato( lCliente, lCoordenador, txtBusca, 0, UTLUtils.getStringToInt(txtOrdem), intRegistros, intPagina, intTotal, conn );
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
			if ( iWhidt > 1 )
			{
				out.write("<tr class=\"selecF12c\" height=\"32\"");
			}
			else
			{
				out.write("<tr class=\"selecF12c\" height=\"36\" ");
			}
			out.write( " title=\"duplo click para selecionar o registro\" onmouseover=\"javascript: OnOver(event);\" onmouseout=\"javascript: OnOut(event);\" onclick=\"javascript: OnClick(event);\" ondblclick=\"javascript: OnDblClick(event);\" " );
			out.write( " onkeydown=\"javascript: OnKeyDown(event);\"  " );
			out.write( " tab=\"" + ++iLidos + "\" " );
			out.write( " bgcolor=\"" );
			out.write( strCor );
			out.write( "\" cor=\"" );
			out.write( strCor );
			out.write( "\" codigo=\"" + _contrato.getId() + "\"><td align=\"left\" class=\"tdChange\" id=\"nmChange\">" );
			out.write(_contrato.getCliente().getNome());
			CADClientePagamento _pag	=	new CADClientePagamento( _contrato.getId(), 0L, null, null, 0, conn );
			bCms						=	new BigDecimal(_contrato.getValorInvestido() * _contrato.getPercentualComissao());
			bTot						=	new BigDecimal(_contrato.getMoedaValor());
//			bTot						=	new BigDecimal(_contrato.getMoedaValor()); VALOR DOLAR INVESTIDO
			bPag						=	new BigDecimal(0);
			while ( _pag.next() )
			{
				if ( _pag.getDataPagamento() != null )
				{
					bPag				=	bPag.add(new BigDecimal(_pag.getValorMoeda()));
				}
			}
			
			String bPagUsd = UTLUtils.getValor(bPag.doubleValue());
			System.out.println(bPagUsd);
//			bTTot						=	bTTot.add(bTot);
//			bTCms						=	bTCms.add(bCms);

			if ( iWhidt > 1 )
			{
		//		

//				out.write("</td><td align=\"center\">");
//				out.write(UTLUtils.getValor(_contrato.getPercentualInvestido() * 100) );
		if (iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == 4)
		{
			out.write("</td><td align=\"center\" class=\"tdChange\">" + _contrato.getId() );

		}
				out.write("</td><td align=\"center\" class=\"tdChange\">");
				out.write(UTLUtils.getDia(_contrato.getDataPagamento()) );
				out.write("&nbsp;</td><td align=\"center\" class=\"tdChange\">");
				out.write("$ " + UTLUtils.getValor(bTot.doubleValue()));
				//valor pago total usd
				out.write("</td><td align=\"center\" class=\"tdChange tdchangepag\">");
				out.write("$ " + bPagUsd);



				//
//				out.write("&nbsp;</td><td align=\"right\">");
//				out.write(UTLUtils.getValor(bPag.doubleValue()));
//				out.write("&nbsp;</td><td align=\"right\">");
//				out.write(UTLUtils.getValor(bCms.doubleValue()));
//				out.write("&nbsp;");
			}
//			else
//			{
//				out.write("<br><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">");
//				out.write(UTLUtils.getDia(_contrato.getDataPagamento()) );
//				out.write("&nbsp;</span><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">&nbsp;V: ");
//				out.write(UTLUtils.getValor(bTot.doubleValue()));
//				out.write("&nbsp;</span><span class=\"linha\" style=\"border-right:#ffffff 1px outset;border-top:#6699ff 1px outset;align:center;width:100px;\">&nbsp;P: ");
//				out.write(UTLUtils.getValor(bPag.doubleValue()));
//				out.write("&nbsp;</span>");
//				if ( iWhidt < 500 )
//				{
//					out.write("<br>");
//				}
//				out.write("</td><td align=\"center\">" + _contrato.getId() );
//			}
			out.write("</td></tr>\n");
		}
//--------------------------------------------------------------Pagina??o: Inicio Parte 4 de 5
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
		if ( iWhidt > 1 )
		{
			sSpan						=	"7";
		}
//--------------------------------------------------------------Pagina??o: Fim Parte 4 de 5
%>
								<%-- <tr height="1">
									<td colspan="<%=sSpan%>" width="100%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
								</table>
<%
		if ( iLidos > 1 )
		{
%>
								<table cellpadding="0" cellspacing="1" class="w-100">
									<tr bgcolor="#323232" style="color:#fff;" class="selecF12c">
										<td class="col-6 text-center">Total investiment:<%=sBr1%>&nbsp;<%=UTLUtils.getValor(bTTot.doubleValue())%></td>
										<%-- <td class="col-6 text-center">Total comiss&otilde;es:<%=sBr1%>&nbsp;<%=UTLUtils.getValor(bTCms.doubleValue())%></td> --%>
									</tr>
								</table>
<%
		}
%>
<!-- --------------------------------------------------------------Pagina??o: Inicio Parte 5 de 5 -->
								<table border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" width="100%">
								<tr class="linhaP"><td align="center" _height="20" valign="middle"><div class="pagination"><%=_sb.toString()%></div></td></tr>
								</table>
<!-- --------------------------------------------------------------Pagina??o: Fim Parte 5 de 5 -->
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
<%
		if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
		{
%>
									<input class="btn btn-dark btn-custom-3" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Return" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom-3" onclick="javascript: Submeter('M');" type="button" name="btnAcao" value="Modify" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom-3" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="New" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
<%
		}
		else
		{
%>
								<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Return" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
		}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><div class="spinner-border text-light" role="status"></div></div>
								<input type="hidden" name="txtLidos" id="txtLidos" value="<%=iLidos%>">
								<input type="hidden" name="txtCliente" id="txtCliente" value="<%=txtCliente%>">
								<input type="hidden" name="txtColaborador" id="txtColaborador" value="<%=txtColaborador%>">
								<input type="hidden" name="txtBusca" id="txtBusca" value="<%=txtBusca%>">
								<input type="hidden" name="txtOrigem" id="txtOrigem" value="<%=txtOrigem%>">
								<input type="hidden" name="txtOrdem"  id="txtOrdem"  value="<%=txtOrdem%>">

								<input type="hidden" name="txtTotInv" id="txtTotInv" value="<%=UTLUtils.getValor(bTTot.doubleValue())%>">
								<input type="hidden" name="txtTotCms" id="txtTotCms" value="<%=UTLUtils.getValor(bTCms.doubleValue())%>">

<!-- --------------------------------------------------------------Pagina??o: Inicio Parte 2 de 5 -->
								<input type="hidden" name="txtRegistros" id="txtRegistros" value="<%=intRegistros%>">
								<input type="hidden" name="txtPagina" id="txtPagina" value="<%=intPagina%>">
								<input type="hidden" name="txtTotal" id="txtTotal" value="<%=intTotal%>">
<!-- --------------------------------------------------------------Pagina??o: Fim Parte 1 de 5 -->
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
			Submeter('cnsCli');
		} else {
			Submeter('cnsClb');
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
	Submeter("M");	
}

//

// const re = /\w* /g;
// var n = "aa A"
// n = n.match(re)

// let nome = document.querySelector("#nmChange")
// let cliente = nome.innerText
// cliente = cliente.match(re)




// -------------------- Change text ------------------------------- //
ordemText = () =>{
	if(txtOrdem.value){
	txtOrdem.options[0].innerText = "Alfabetic"
	txtOrdem.options[1].innerText = "Contract Date [Older]"
	txtOrdem.options[2].innerText = "Contract Date [Newer]"
	txtOrdem.options[3].innerText = "Contract Number [Newer]"
	txtOrdem.options[4].innerText = "Contract Number [Older]"
	}
}

ordemText()



</script>
<script src="inc/js/jquery.js"></script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
