<%@ include file="inc/incCabec.jsp"%>
<%
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtDolar					=	UTLUtils.getStringToString( request.getParameter("txtDolar") );

	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	String	sWNome						=	"280";

	String	txtAnoMes					=	UTLUtils.getStringToString( request.getParameter("txtAnoMes") );
	
	String sBr2							=	"&nbsp;&nbsp;&nbsp;";
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
		sWNome							=	"220";
	}
	Calendar cDataInicial				=	Calendar.getInstance();
	Calendar cDataFinal					=	Calendar.getInstance();
	int iAno							=	0;
	int iMes							=	0;
	if ( txtAnoMes.length() == 0 )
	{
		iAno							=	cDataInicial.get(Calendar.YEAR);
		iMes							=	cDataInicial.get(Calendar.MONTH);
	}
	else
	{
		iAno							=	UTLUtils.getStringToInt(txtAnoMes.substring(0, 4));
		iMes							=	UTLUtils.getStringToInt(txtAnoMes.substring(4, 6)) - 1;
	}
		
	cDataInicial.set( iAno, iMes, 1 );
	iMes++;
	if ( iMes == 12 )
	{
		iMes							=	0;
		iAno++;
	}
	cDataFinal.set( iAno, iMes, 1 );
	cDataFinal.add( Calendar.DATE, -1 );
	long lSelecionado					=	0L;
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

	document.onkeydown = OnKeyDown;
		if ( parseInt(document.getElementById("txtLidos").value) > 1 ) {
			document.getElementById("tbPes").getElementsByTagName("tr")[2].click();
		}
	
		document.form1.txtAnoMes.focus();
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		document.form1.txtAcao.value = "";
		document.form1.action = "frmCliCns.jsp";
	}
	if (acao == "N") {
		document.form1.txtDolar.value = "0";
		document.form1.txtAcao.value = "novo";
		document.form1.action = "frmDlrCad.jsp";
	}
	if (acao == "M") {
		if ( document.form1.txtDolar.value == "0" ) {
			if ( parseInt(document.getElementById("txtLidos").value) > 1 ) {
				document.onkeydown = OnKeyDown;
				document.getElementById("tbPes").getElementsByTagName("tr")[2].click();
				document.getElementById("tbPes").getElementsByTagName("tr")[2].focus();
			}
		}
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmDlrCad.jsp";
	}
	varSubmit = true;
	document.form1.submit();
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
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"     id="sWhidt"     value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"    id="sHeight"    value="<%=sHeight%>">
						<input type="hidden" name="txtDolar"   id="txtDolar"   value="<%=txtDolar%>">
						<input type="hidden" name="txtAcao"    id="txtAcao"    value="">
						<input type="hidden" name="txtSss"     id="txtSss"     value="<%=txtSss%>">
						<input type="hidden" name="txtAss"     id="txtAss"     value="<%=txtAss%>">
						<input type="hidden" name="txtUid"     id="txtUid"     value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"     id="txtFrq"     value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"     id="txtOwn"     value="<%=txtOwn%>">
						<tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan="2" valign="top">DOLAR CONSULTA</td></tr>
						<tr class="selecF12">
							<td colspan="2" >
							
								<table width="100%" border="0" cellpadding="0" cellspacing="0" >
								<tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="80%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr >
									<td >Ano/Mes base:</td>
									<td >
										<select class="form-control shadow-sm" name="txtAnoMes" id="txtAnoMes" _style="background-color: #f0f8ff" onchange="javascript: Submeter('C');">
<%
	long lAnoMes						=	UTLUtils.getStringToLong(txtAnoMes);
	UTLParametro _parametro				=	new UTLParametro( 1, lAnoMes, 0L, 0L, null );
	out.println( CADDolar.getMeses( _parametro, conn ) );
	if ( lAnoMes == 0 )
	{
		lAnoMes							=	_parametro.getParametro_2();
		if ( lAnoMes > 0 )
		{
			txtAnoMes					=	_parametro.getParametro_5();
			iAno						=	UTLUtils.getStringToInt(txtAnoMes.substring(0, 4));
			iMes						=	UTLUtils.getStringToInt(txtAnoMes.substring(4, 6)) - 1;
			cDataInicial.set( iAno, iMes, 1 );
			iMes++;
			if ( iMes == 12 )
			{
				iMes						=	0;
				iAno++;
			}
			cDataFinal.set( iAno, iMes, 1 );
			cDataFinal.add( Calendar.DATE, -1 );
		}
	}
%>
										</select>
									</td>
								</tr>
								</tr>
								</table>
								<div name="divProg" id="divProg" style="height: 200; width: 100%; overflow: auto; display:block; overflow-y: scroll;">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" name="tbPes" id="tbPes" >
								<tr>
									<td width="30%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="30%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="40%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr style="background-color:#d7d7d7; color:#000; font-size:10pt; font-weight: bolder;">
									<td>Data</td>
									<td>Dia</td>
									<td align="right">Valor</td>
								</tr>
<%
	String strCor1					= 	"#e9e9e9";
	String strCor2					= 	"#d7d7d7";
	String	strCor 					= 	strCor2;
	int	iLidos						=	1;
	
	CADDolar _dolar					=	new CADDolar( cDataInicial, cDataFinal, 1, conn );
	String sDia[]					=	{ "", "Domingo", "Segunda", "Ter\347a", "Quarta", "Quinta", "Sexta", "S\341bado" };

		while ( _dolar.next() )
		{
			if ( strCor.equals(strCor1) )
			{
				strCor 					= 	strCor2;
			}
			else
			{
				strCor 					= 	strCor1;
			}
			out.write("<tr class=\"selecF12c\" height=\"32\"");
			out.write( " title=\"duplo click para selecionar o registro\" onmouseover=\"javascript: OnOver(event);\" onmouseout=\"javascript: OnOut(event);\" onclick=\"javascript: OnClick(event);\" ondblclick=\"javascript: OnDblClick(event);\" " );
			out.write( " onkeydown=\"javascript: OnKeyDown(event);\"  " );
			out.write( " tab=\"" + ++iLidos + "\" " );
			out.write( " bgcolor=\"" );
			out.write( strCor );
			out.write( "\" cor=\"" );
			out.write( strCor );
			out.write( "\" codigo=\"" + _dolar.getId() + "\"><td>" );
			out.write(UTLUtils.getDia(_dolar.getDataBase()));
			out.write("</td><td>" );
			out.write( sDia[_dolar.getDataBase().get(Calendar.DAY_OF_WEEK)] );
			out.write("</td><td align=\"right\">" );
			out.write(UTLUtils.getCampoDecimal(_dolar.getValor(), 4));
			out.write("</td></tr>\n");
		}
%>
								</table>
								</div>
							</td>
						</tr>

						<tr><td colspan="2" >&nbsp;</td></tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
<%
	int iAcesso							=	Integer.parseInt(txtAss);
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('M');" type="button" name="btnAcao" value="Modificar" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="Novo" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
<%
	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
								<input type="hidden" name="txtLidos" id="txtLidos" value="<%=iLidos%>">
								<input type="hidden" name="txtBusca" id="txtBusca" value="<%=txtBusca%>">
								<br>
							</td>
						</tr>
						</form>
						</table>
					</td>
				</tr>
				</table>

			</div>
			<div class="col-sm text-center"></div>
        </div>
    </div>

</body>
<script type="text/Javascript">
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
		document.form1.txtCliente.value = posicaoAnterior.getAttribute("codigo");
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
				if ( t == 1 ) {
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
	document.form1.txtDolar.value = tr.getAttribute("codigo");
	posicaoAnterior = tr;
}

function OnDblClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	document.form1.txtDolar.value = tr.getAttribute("codigo");
	Submeter("M");	
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
