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
	String  txtContrato					=	UTLUtils.getStringToString( request.getParameter("txtContrato") );
	String 	txtOrdem					=	UTLUtils.getStringToString( request.getParameter("txtOrdem") );
	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtColaborador				=	UTLUtils.getStringToString( request.getParameter("txtColaborador") );
	long lContrato						=	UTLUtils.getStringToLong( txtContrato );

	String	txtMotivo					=	UTLUtils.getStringToString( request.getParameter("txtMotivo") );
	String	txtDataEvt					=	UTLUtils.getStringToString( request.getParameter("txtDataEvt") );
	String	txtObs						=	UTLUtils.getStringToString( request.getParameter("txtObs") );

	if ( (! txtSss.equals(session.getId())) || ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA ) )
	{
		txtSss							=	"...";
	}

	String	strMensagem					=	UTLUtils.getBranco();
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	String	sWNome						=	"280";
	String sBr2							=	"&nbsp;&nbsp;";
	String sBr1							=	"&nbsp;";
	if ( iWhidt < 1 )
	{
		sBr2							=	"<br><br>";
		sBr1							=	"<br>&nbsp;";
		sWNome							=	"220";
	}

	if ( txtAcao.equals("consultar") )
	{
		intExibir						=	EXIBIR_CONSULTA;
	}
	CADContrato _contrato				=	new CADContrato( lContrato, conn );
	String txtDlrValor					=	UTLUtils.getValor(_contrato.getMoedaValor());
	String txtDlrData					=	UTLUtils.getDia(_contrato.getDolar().getDataBase());
	String txtMes						=	String.valueOf(_contrato.getMeses());
	String txtFranquia					=	String.valueOf(_contrato.getIdFranquia());
	String txtPercInv					=	((int)(_contrato.getPercentualInvestido() * 100)) + "";
	String txtPercClb					=	((int)(_contrato.getPercentualComissao() * 100)) + "";
	String txtDataPag					=	UTLUtils.getDia(_contrato.getDataPagamento());

	if ( txtAcao.equals("modificar") )
	{
		txtMotivo						=	_contrato.getCodigoMotivo() + "";
		txtDataEvt						=	UTLUtils.getDia(_contrato.getDataMotivo());
		txtObs							=	_contrato.getObservacaoMotivo();
	}

	if ( txtAcao.equals("cancelar") )
	{
		CADClientePagamento _cliPag		=	new CADClientePagamento( _contrato.getId(), 0L, null, null, 0, conn );
		while ( _cliPag.next() )
		{
			if ( _cliPag.getDataPagamento() == null )
			{
				_cliPag.delete( conn );
			}
		}
		CADColaboradorPagamento _clbPag	=	new	CADColaboradorPagamento( _contrato.getId(), 0L, 0L, null, null, 0, conn );
		while ( _clbPag.next() )
		{
			if ( _clbPag.getDataPagamento() == null )
			{
				_clbPag.delete( conn );
			}
		}
		_contrato.setCodigoMotivo(UTLUtils.getStringToInt(txtMotivo));
		_contrato.setDataMotivo(UTLUtils.converteData(txtDataEvt));
		_contrato.setObservacaoMotivo(txtObs);
		_contrato.setIdColaboradorMotivo(UTLUtils.getStringToLong(txtUid));
		_contrato.atualize(conn);
		strMensagem					=	"Registro atualizado com sucesso!";
	}

	long 	lColaborador				=	0L;
	long 	lCliente					=	0L;
	UTLCombo meses						=	new UTLCombo("6|6 meses,12|12 meses,18|18 meses,24|24 meses,30|30 meses,36|36 meses,48|48 meses,60|60 meses");
	CADFranquias _franquias				=	new CADFranquias( 0L, true, 0, conn );
	UTLCombo franquia					=	_franquias.getCombo();
	UTLCombo motivo						=	new UTLCombo("0|Ativo,1|Cancelado,2|Rescindido,3|Encerrado");
	strMensagem							=	strMensagem.replace('\'','´').replace('\n',' ');
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
			Submeter("V");
			return;
		}
	}

    Calendar.setup({ inputField : "txtDataEvt", ifFormat : "dd/mm/y", button : "imgDataEvt", align : "Bl", singleClick :true });
	
	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

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
if (acao == "Ext") {
	document.form1.txtAcao.value = "";
	document.form1.action = "/";
}
//===============================================//
	if (acao == "A") {
		if ( parseInt(document.form1.txtMotivo[document.form1.txtMotivo.selectedIndex].value) == 0 ) {
			alert("Falta selecionar o Motivo!");
			document.form1.txtMotivo.focus();
			return;
		}
		if (CampoVazio(document.form1.txtDataEvt.value)) {
			alert("Falta informar a data do Envento!");
			document.form1.txtDataEvt.focus();
			return;
		}
		if ( confirm("Confirma o Envento do Contrato?") == true ) {
			document.form1.txtAcao.value = "cancelar";
			document.form1.action = "frmCntReg.jsp";
		} else {
			return;
		}
	}
	if (acao == "C") {
		document.form1.txtAcao.value = "consultar";
		document.form1.action = "frmCntCnc.jsp";
	}
	if (acao == "V") {
		document.form1.txtAcao.value = "";
		document.form1.action = "frmCntCnc.jsp";
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
<div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto" style="background-color:#121212;">
	<!-- Sidebar  -->
	<div class="p-0 m-0 w-auto">
		<nav id="sidebar" class="d-none d-lg-block h-100">
			<div class="sidebar-header d-flex flex-column align-content-center justify-content-center col-12">
				<img class="m-auto col-8" src="img/logo_responsiva.png">
			</div>
			<ul class="list-unstyled components">
				<li>
					<a  title="sair do sistema" onclick="javascript: Submeter('Ext'); return false;"><img class="g-2 me-1" src="img/sair.png" width="25"/> SAIR</a>
				</li>
			</ul>
		</nav>
	</div>

    <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">

		<nav class="navbar d-inline-flex row col-12 m-0 p-0 text-center h-auto justify-content-evenly">
			<span class="col-6 col-lg-12 m-0 p-0 text-center" style="font-size:100%; color:#fff;">User: <%=txtOwn%></span>
            <button class="btn btn-dark d-block d-lg-none m-1 col-2" type="button" data-bs-toggle="offcanvas" data-target="#navbarSupportedContent" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-align-justify"></i>
            </button>
		</nav>

		<div class="panel-form col-12">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" class="col-12">
				<tr>
					<td class="w-100 text-center" valign="top">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<form class="panel panel-form" name="form1" id="form1" method="post">
						
						<input type="hidden" name="sWhidt"     id="sWhidt"     value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"    id="sHeight"    value="<%=sHeight%>">
						<input type="hidden" name="txtContrato" id="txtContrato" value="<%=txtContrato%>">
						<input type="hidden" name="txtAcao"    id="txtAcao"    value="<%=txtAcao%>">
						<input type="hidden" name="txtExibir"  id="txtExibir"  value="<%=intExibir%>">
						<input type="hidden" name="txtSss"     id="txtSss"     value="<%=txtSss%>">
						<input type="hidden" name="txtAss"     id="txtAss"     value="<%=txtAss%>">
						<input type="hidden" name="txtUid"     id="txtUid"     value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"     id="txtFrq"     value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"     id="txtOwn"     value="<%=txtOwn%>">
						<tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>

						<tr class="selecF12 text-center" height="50"><td colspan="2" valign="top">CONTRATO CADASTRO :: CANCELAR</td></tr>
						<div style="color:#fff;" height="32">
							<td>Contrato:</td>
							<td>
								<div class="grupo-coluna row col-12 flex-nowrap m-0">
									<div class="btn-custom">
										<input class="form-control shadow-sm" type="text" name="txtContrato" id="txtContrato" size="4" maxlength="4" style="text-align: center;background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtContrato%>" onkeydown="javascript: return false;">
									</div>
								</div>
							</td>
						</tr>
						<tr height="32" >
							<td style="color:#fff;">Investidor:</td>
							<td>
								<select class="form-control shadow-sm col-lg-2 col-12 text-center" name="txtCliente" id="txtCliente" style="background-color: #e6e6e6" onfocus="this.blur();" >
<%
	CADCliente _cliente					=	new CADCliente(_contrato.getIdCliente(), conn);
	out.write("<option value='" + _cliente.getId() );
	out.write("' selected>");
	out.write(_cliente.getNome());
	out.write("</option>");
%>								
								</select>
							</td>
						</tr>
						<tr class="m-0 " style="color:#fff;" height="32">
							<td>Coordenador:</td>
							<td>
								<select class="form-control shadow-sm col-lg-8 col-12 text-center" name="txtColaborador" id="txtColaborador" style="background-color: #e6e6e6" onfocus="this.blur();" >
									<option value="0"> -- sem coordenador --- </option>
<%
	if ( _contrato.getIdColaborador() > 0 )
	{
		CADColaborador _colaborador			=	new CADColaborador( _contrato.getIdColaborador(), conn );
		out.write("<option value='" + _colaborador.getId() );
		out.write("' selected>");
		out.write(_colaborador.getNome());
		out.write("</option>\n");
	}
%>
								</select>
							</td>
						</tr>
						<tr>
							<td>Celular: </td>
							<td><input class="form-control shadow-sm " style="background-color: #e6e6e6" onfocus="this.blur();" value="<%=_contrato.getCliente().getTelegram()%>"></td>
						</tr>
						<tr>
							<td>Email: </td>
							<td><input class="form-control shadow-sm " style="background-color: #e6e6e6" onfocus="this.blur();" value="<%=_contrato.getCliente().getEmail()%>"></td>
						</tr>
						<tr style="color:#fff;" height="32">
							<td>Prazo:</td>
							<td><%=meses.getCombo("txtMes", "class=\"form-control shadow-sm col-lg-3 text-center\" style=\"background-color: #e6e6e6\"  onfocus=\"javascript: this.blur();\" ", txtMes)%></td>
						</tr>
						<tr style="color:#fff;" height="32">
							<td>Franquia:</td>
							<td><%=franquia.getCombo("txtFranquia", " class=\"form-control shadow-sm  col-lg-5 col-12 text-center\" style=\"background-color: #e6e6e6\"  onfocus=\"javascript: this.blur();\"  ", txtFranquia)%></td>
						</tr>
						<tr class="d-none" style="color:#fff;" height="32">
							<td>% Investidor:</td>
							<td>
								<table style="color:#fff;" border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="d-none" width="30%"><input class="form-control shadow-sm col-lg-6" type="text" name="txtPercInv" id="txtPercInv" size="3" maxlength="6" style="text-align: right;" onfocus="this.blur();" value="<%=txtPercInv%>"></td>
								</tr>
								</table>
							</td>
						</tr>
						<tr style="color:#fff;" height="32">
							<td>Data contrato:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="100%"><input class="form-control shadow-sm col-lg-3 col-12" title="data de pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" type="text" value="<%=txtDataPag%>"  id="txtDataPag" name="txtDataPag" style="background-color: #e6e6e6"  size="11" maxlength="10"></td>
									<td class="d-none" width="59%">&nbsp;</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr style="color:#fff;" height="32">
							<td>Val. Investido USD:</td>
							<td>
								<table border="0" style="color:#fff;" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="100%" align="left"><input class="form-control shadow-sm col-lg-8 col-12 " type="text" name="txtDlrValor" id="txtDlrValor" size="10" maxlength="12" style="background-color: #e6e6e6"  onfocus="javascript: this.blur();" value="<%=txtDlrValor%>" ></td>
									
									<td class="d-none" width="24%" align="center">Dt.Cot.:<input class="form-control shadow-sm col-lg-9" type="text" name="txtDlrData" id="txtDlrData" size="8" maxlength="2" tabindex="-1" style="text-align: right; background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtDlrData%>"></td>
								</tr>
								</table>
							</td>
						</tr>

						<tr style="color:#fff;" height="32">
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

						<tr style="color:#fff;" height="32">
							<td>Motivo:</td>
							<td><%=motivo.getCombo("txtMotivo", " class=\"form-control shadow-sm  col-lg-5 col-12 text-center\" onfocus=\"javascript: this.select();\"  ", txtMotivo)%></td>
						</tr>
						<tr style="color:#fff;" height="32">
							<td>Data evento:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="30%">
										<div class="btn-custom">
											<input class="form-control" title="data do evento" onfocus="javascript: window.status=this.title; this.select();" type="text" value="<%=txtDataEvt%>" id="txtDataEvt" name="txtDataEvt" onblur="javascript: if (this.value != '') { check_date(this);}" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">
										</div>
									</td>
									<td width="70%">
										<div class="btn-custom">
											<img src="img/calendario.gif" border="0" style="cursor: pointer;" id="imgDataEvt" alt="data do evento" align="absmiddle" onMouseOver="javascript: window.status='Data do evento';return true;" onMouseOut="javascript: window.status='';return true;">
										</div>
									</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>Observa&ccedil;&atilde;o: </td>
							<td><input class="form-control shadow-sm " onfocus="this.select();" id="txtObs" name="txtObs" value="<%=txtObs%>"></td>
						</tr>

						<tr style="color:#fff;" height="30">
							<td colspan="2" valign="bottom">
								<br>
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<input class="btn btn-dark btn-custom col-2" type="button" name="btnVoltar" id="V" onclick="javascript: Submeter('V');" value="Voltar">
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" id="btnAcao" value="Confimar">
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
			<div class="col-sm text-center"></div>
        </div>
    </div>

<script type="text/Javascript">
function tab(e) {
	e = window.event || e;
	o = e.target || e.srcElement;
	kc  = e.which || e.keyCode;
	ret = null;
	if (o.tagName == "INPUT" && (o.type == "button" || o.type == "BUTTON") && kc == 13) {
		o.click();
		return ;
	}
	if ( (o.tagName != "SELECT" && (kc == 40 || kc == 38 || kc == 13 || kc == 9)) || (o.tagName == "SELECT" && (kc == 37 || kc == 39 || kc == 13 || kc == 9)) ) {
		prv = o.getAttribute("prv");
		nxt = o.getAttribute("nxt");
		for (i=0;i<form1.length; i++) {
			if (o.tagName == "SELECT") {
				if (kc == 37) {
					if (form1[i].getAttribute("ths") == prv) {
						ret = form1[i];
						break;
					}
				} else {
					if (form1[i].getAttribute("ths") == nxt) {
						ret = form1[i];
						break;
					}
				}
			} else {
				if (kc == 38) {
					if (form1[i].getAttribute("ths") == prv) {
						ret = form1[i];
						break;
					}
				} else {
					if (form1[i].getAttribute("ths") == nxt) {
						ret = form1[i];
						break;
					}
				}
			}
		}
	}
	if (ret != null) {
		if (ret.style.display == "none") {
			tab(ret);
		} else {
			ret.focus();
		}
	}
}

function OnOver(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	tr.style.cursor = "pointer";
	tr.style.background = "#323232";	// "#fafad2";
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
	document.form1.txtCliente.value = tr.getAttribute("codigo");
	posicaoAnterior = tr;
}

function OnDblClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	document.form1.txtCliente.value = tr.getAttribute("codigo");
	Submeter("M");	
}
</script>
</body>
</html>

