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

	long 	lTaxa					    =	UTLUtils.getStringToLong( request.getParameter("txtTaxa") );
	long 	lPais						=	UTLUtils.getStringToLong( request.getParameter("txtPais") );
	long 	lFranquia					=	UTLUtils.getStringToLong( request.getParameter("txtFranquia") );
	int		iAcesso						=	UTLUtils.getStringToInt( txtAss );

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	String	txtDtaIni					=	UTLUtils.getStringToString( request.getParameter("txtDtaIni") );
	String	txtDtaFim					=	UTLUtils.getStringToString( request.getParameter("txtDtaFim") );
	String	txtPrcRob					=	UTLUtils.getStringToString( request.getParameter("txtPrcRob") );
	String	txtPrcRef					=	UTLUtils.getStringToString( request.getParameter("txtPrcRef") );
	String	txtPrcCob					=	UTLUtils.getStringToString( request.getParameter("txtPrcCob") );
	String	txtPrcCef					=	UTLUtils.getStringToString( request.getParameter("txtPrcCef") );

	String	strBtn						=	"Incluir";
	String	strMensagem					=	UTLUtils.getBranco();

	if ( txtAcao.equals("modificar") )
	{
		CADTaxa _taxa					=	new CADTaxa( lTaxa, conn );
		lPais							=	_taxa.getIdPais();
		lFranquia						=	_taxa.getIdFranquia();
		txtDtaIni						=	UTLUtils.getDia(_taxa.getDataInicio());
		txtDtaFim						=	UTLUtils.getDia(_taxa.getDataFinal());
		txtPrcRob						=	UTLUtils.getCampoDecimal(_taxa.getRemuneracaoObjetivo(), 3);
		txtPrcRef						=	UTLUtils.getCampoDecimal(_taxa.getRemuneracaoEfetivo(), 3);
		txtPrcCob						=	UTLUtils.getCampoDecimal(_taxa.getComissaoObjetivo(), 3);
		txtPrcCef						=	UTLUtils.getCampoDecimal(_taxa.getComissaoEfetivo(), 3);
		strBtn							=	"Atualizar";
	}
	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") )
	{
		CADTaxa _taxa					=	new CADTaxa( lTaxa, conn );
		_taxa.setIdPais					( lPais									);
		_taxa.setIdFranquia				( lFranquia								);
		_taxa.setDataInicio				( UTLUtils.converteData(txtDtaIni)		);
		_taxa.setDataFinal				( UTLUtils.converteData(txtDtaFim)		);
		_taxa.setRemuneracaoObjetivo            ( UTLUtils.getStringToDouble(txtPrcRob)	);
		_taxa.setRemuneracaoEfetivo		( UTLUtils.getStringToDouble(txtPrcRef)	);
		_taxa.setComissaoObjetivo 		( UTLUtils.getStringToDouble(txtPrcCob)	);
		_taxa.setComissaoEfetivo		( UTLUtils.getStringToDouble(txtPrcCef) );
		_taxa.setIdColaborador			( UTLUtils.getStringToLong(txtUid) 		);
		try
		{
			_taxa.atualize( conn );
			strMensagem					=	"Registro atualizado com sucesso!";
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
		lTaxa							=	0;
		lPais							=	0;
		txtDtaIni						=	UTLUtils.getDia(Calendar.getInstance());
	}
	strMensagem							=	strMensagem.replace('\'','´').replace('\n',' ');
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
<link type="text/css" href="css/calendar-win2k-cold-2.css" rel="stylesheet" media="all" title="win2k-cold-2" />
<script type="text/javascript" src="inc/js/calendar-js.js"></script>
<script type="text/javascript" src="inc/js/calendar-br.js"></script>
<script type="text/javascript" src="inc/js/calendar-setup.js"></script>
<script type="text/Javascript">
strAviso = '<%=strMensagem%>';

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

    Calendar.setup({ inputField : "txtDtaIni", ifFormat : "dd/mm/y", button : "imgDtaIni", align : "Bl", singleClick :true });
    Calendar.setup({ inputField : "txtDtaFim", ifFormat : "dd/mm/y", button : "imgDtaFim", align : "Bl", singleClick :true });

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if ( CampoVazio(document.form1.txtDtaIni.value) ) {
		document.form1.txtDtaIni.focus();
	} else {
		document.form1.imgDtaFim.focus();
	}
//	document.form1.txtValor.select();
//	document.form1.txtValor.focus();
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmTaxCns.jsp";
	}
	if (acao == "A") {
		if ( valor( document.form1.txtPrcRob.value ) == 0 ) {
			alert("Falta informar o % da Remuneração Objetivo!");
			document.form1.txtPrcRob.focus();
			return;
		}
		if ( valor( document.form1.txtPrcCob.value ) == 0 ) {
			alert("Falta informar o % da Comissão Objetivo!");
			document.form1.txtPrcCob.focus();
			return;
		}
		if ( document.form1.txtTaxa.value == "" || document.form1.txtTaxa.value == "0" ) {
			document.form1.txtAcao.value = "incluir";
		} else {
			document.form1.txtAcao.value = "atualizar";
		}
		document.form1.action="frmTaxCad.jsp";
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

				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtTaxa"        id="txtTaxa"      value="<%=lTaxa%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
						<tr>
							<td width="21%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="78%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan="2" valign="top">TAXA DE REMUNERA&Ccedil;&Atilde;O :: CADASTRO</td></tr>
						<tr>
							<td >Pa&iacute;s :</td>
							<td >
								<select class="form-control shadow-sm" name="txtPais" id="txtPais" _style="background-color: #f0f8ff" _onchange="javascript: Submeter('C');">
									<option value="0"> -- aplicado em todos os pa&iacute;ses --- </option>
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
						<tr>
							<td >Franquia :</td>
							<td >
								<select class="form-control shadow-sm" name="txtFranquia" id="txtFranquia" _style="background-color: #f0f8ff" _onchange="javascript: Submeter('C');">
									<option value="0"> -- aplicado em todos as franquias --- </option>
<%
	CADFranquia _franquia				=	new CADFranquia();
	while ( _franquia.next() )
	{
		out.write("<option value='" + _franquia.getId() );
		if ( _franquia.getId() == lFranquia )
		{
			out.write("' selected>");
		}
		else
		{
			out.write("'>");
		}
		out.write(_franquia.getTitulo());
		out.write("</option>");
	}
%>								
								</select>
							</td>
						</tr>
						<tr>
							<td>Data in&iacute;cio :</td>
							<td>
								<input title="data in&iacute;cio da vig&ecirc;ncia" onfocus="javascript: window.status=this.title; this.select();" class="input" type="text" value="<%=txtDtaIni%>" ths="1" prv="20" nxt="2" id="txtDtaIni" name="txtDtaIni" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verTab(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">&nbsp;
								<img src="img/calendario.gif" border="0" style="cursor: pointer;" id="imgDtaIni" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;">
							</td>
						</tr>
						<tr>
							<td>% Rem.Objetivo :</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtPrcRob" id="txtPrcRob" size="5" maxlength="6" ths="3" prv="2" nxt="4" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtPrcRob.replace(".", ",")%>" onkeydown="javascript:return verNN(event, document.form1.txtDtaIni, document.form1.txtPrcRef);" onkeyup="javascript:verVV(this, 3, 2);"></td>
						</tr>
						<tr>
							<td>% Rem.Efetivo :</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtPrcRef" id="txtPrcRef" size="5" maxlength="6" ths="3" prv="2" nxt="4" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtPrcRef.replace(".", ",")%>" onkeydown="javascript:return verNN(event, document.form1.txtPrcRob, document.form1.txtPrcCob);" onkeyup="javascript:verVV(this, 3, 2);"></td>
						</tr>
						<tr>
							<td>% Com.Objetivo :</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtPrcCob" id="txtPrcCob" size="5" maxlength="6" ths="4" prv="3" nxt="20" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtPrcCob.replace(".", ",")%>" onkeydown="javascript:return verNN(event, document.form1.txtPrcRef, document.form1.txtPrcCef);" onkeyup="javascript:verVV(this, 3, 2);"></td>
						</tr>
						<tr>
							<td>% Com.Efetivo :</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtPrcCef" id="txtPrcCef" size="5" maxlength="6" ths="4" prv="3" nxt="20" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtPrcCef.replace(".", ",")%>" onkeydown="javascript:return verNN(event, document.form1.txtPrcCob, document.form1.imgDtaFim);" onkeyup="javascript:verVV(this, 3, 2);"></td>
						</tr>
						<tr>
							<td>Data fim :</td>
							<td>
								<input title="data fim da vig&ecirc;ncia" onfocus="javascript: window.status=this.title; this.select();" class="input" type="text" value="<%=txtDtaFim%>" ths="2" prv="1" nxt="3" id="txtDtaFim" name="txtDtaFim" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verTab(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">&nbsp;
								<img src="img/calendario.gif" border="0" style="cursor: pointer;" id="imgDtaFim" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;">
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnVlt" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="<%=strBtn%>" ths="20" prv="4" nxt="21" onkeydown="javascript: return verTab(event);">
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
					</td>
				</tr>
				</table>
			</div>
			<div class="col-sm text-center"></div>
        </div>
    </div>

</body>
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
var vv = false;		// 	Indica vírgula do ponto decimal;
var dd = false;		// 	Indica preenchimento das cadas decimais
var tt = false;		//	Indica preenchimento das casas não decimais
var xx = false;
function verNN(e, p, n) {
	var e=(typeof event!='undefined')?window.event:e;	// IE : Moz 
	tc = e.which || e.keyCode
	if(tc==27) {
		p.focus();
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
</html>
<%@ include file="inc/incRodape.jsp"%>
