<%@ include file="inc/incCabec.jsp"%>
<%
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );

	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String 	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
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

	String sBr2							=	"&nbsp;&nbsp;&nbsp;";
	if ( iWhidt < 1)
	{
		sBr2							=	"<br><br>";
		sWNome							=	"220";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- <%=txtCodigo%> -->
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
	}

	let sidebar = document.querySelector(".cttNovoCon")
	sidebar.style.background = "#0b7fab";

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	document.onkeydown = OnKeyDown;
	if ( parseInt(document.getElementById("txtLidos").value) > 1 ) {
		document.getElementById("tbPes").getElementsByTagName("tr")[2].click();
	}
}

var varSubmit = false;
function Submeter(acao) {
	if (acao == "Ext") {
		document.form1.txtAcao.value = "";
		document.form1.action="/";
	}
	if (acao == "Cli") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCliCns.jsp";
	}
	if (acao == "CliN") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCliCnsN.jsp";
	}
	if (acao == "Clb") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmClbCns.jsp";
	}
	if (acao == "Cnt") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCntCns.jsp";
	}
	if (acao == "CntN") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCntCnsN.jsp";
	}
	if (acao == "Ctf") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCntFrqCns.jsp";
	}
	if (acao == "Cip") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCipCns.jsp";
	}
	if (acao == "Cbp") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmCbpCns.jsp";
	}
	if (acao == "Pwd") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmPwd.jsp";
	}
	if (acao == "Dlr") {
		document.form1.txtAcao.value = "";
		document.form1.action="frmDlrCns.jsp";
	}
//===============================================//
	if (acao == "V") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmCntCad.jsp";
	}
	if (acao == "N") {
		document.form1.txtAcao.value = "novo";
		document.form1.action = "frmCtaCad.jsp";
	}
	varSubmit = true;
	document.form1.submit();
}
</script>
<body class="m-0 p-0" onload="javascript: Foco();">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto" style="background-color:#121212;">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto">
<%@ include file="inc/incSideBar.jsp"%>
		</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form justify-content-center">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" class="col-12">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="50%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"     id="sWhidt"     value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"    id="sHeight"    value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"    id="txtAcao"    value="<%=txtAcao%>">
						<input type="hidden" name="txtSss"     id="txtSss"     value="<%=txtSss%>">
						<input type="hidden" name="txtAss"     id="txtAss"     value="<%=txtAss%>">
						<input type="hidden" name="txtUid"     id="txtUid"     value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"     id="txtFrq"     value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"     id="txtOwn"     value="<%=txtOwn%>">
						<%-- <tr>
							<td width="95%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="5%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr> --%>
						<tr class="selecF12 text-center" height="50"><td colspan="2" valign="top">CONSULT DOCUMENT</td></tr>
						<tr>
							<td colspan="2">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr style="color:#fff;" class="linha" height="26">
									<td >Investor:</td>
									<td >
<%
	long lContrato						=	UTLUtils.getStringToLong(txtCodigo);
	CADContrato _contrato				=	new CADContrato( lContrato, conn );
%>
										<input class="form-control shadow-sm" type="text" name="txtNomCli" id="txtNomCli" style="background-color: #e6e6e6" onfocus="javascript: this.blur();" value="<%=_contrato.getCliente().getNome()%>" onkeydown="javascript: return false;">
									</td>
								</tr>
								<tr style="color:#fff;" class="linha" height="26">
									<td >Contract:</td>
									<td >
										<input class="form-control shadow-sm col-lg-3" type="text" name="txtCodigo" id="txtCodigo" style="background-color: #e6e6e6" onfocus="javascript: this.blur();" value="<%=txtCodigo%>" onkeydown="javascript: return false;">
									</td>
								</tr>
								<tr><td colspan="2">&nbsp;</td></tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#fff" name="tbCab" id="tbCab" >
								<tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="60%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								<tr style="background-color:#525252; color:#000; font-size:10pt; font-weight: bolder;">
									<td>Date</td>
									<td>Document</td>
									<td>Name</td>
								</tr>
								<%-- <tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="60%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
								</table>
							<div name="divProg" id="divProg" style="height: 300; width: 100%; overflow: auto; display:block; overflow-y: scroll;">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#606060" name="tbPes" id="tbPes" >
								<tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="60%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
<%
	String strCor1					= 	"#525252";
	String strCor2					= 	"#3d3d3d";
	String	strCor 					= 	strCor2;
	int	iLidos						=	1;
	
	CADContratoArquivo _arquivo		=	new CADContratoArquivo( lContrato, 0, conn );
		while ( _arquivo.next() )
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
			out.write( "\" codigo=\"" + _arquivo.getId() + "\"><td>" );
			out.write( UTLUtils.getDataHora(_arquivo.getDataUpload()) );
			out.write("</td><td>" );
			String doc = "Document";
			String doc2 = "Payment";
			String arq = _arquivo.getTipoArquivoTitulo();
			if(arq == "Cadastro"){
				arq = doc;
			}
			else{
				arq = doc2;
			}

			//
			out.write(arq);

			out.write("</td><td>" );
			out.write( _arquivo.getNomeArquivo() );
			out.write("</td></tr>\n");
		}
%>
								</table>
								</div>
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Return">
<%
	int iAcesso							=	Integer.parseInt(txtAss);
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
%>
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="New" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
<%
	}
%>
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
								<input type="hidden" name="txtLidos" id="txtLidos" value="<%=iLidos%>">
								<input type="hidden" name="txtBusca" id="txtBusca" value="<%=txtBusca%>">
								<br>
							</td>
						</tr>
						</form>
						
						<form method="post"  name="form2"      id="form2"      action="frmCtaDwn.jsp" >
						<input type="hidden" name="txtSss"     id="txtSss"     value="<%=txtSss%>">
						<input type="hidden" name="txtAss"     id="txtAss"     value="<%=txtAss%>">
						<input type="hidden" name="txtUid"     id="txtUid"     value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"     id="txtOwn"     value="<%=txtOwn%>">
						<input type="hidden" name="fl"         id="fl"         value="">
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
function OnOver(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	tr.style.cursor = "pointer";
	tr.style.background = "#161616";
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
	document.form2.fl.value = tr.getAttribute("codigo");
	posicaoAnterior = tr;
}

function OnDblClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	document.form2.fl.value = tr.getAttribute("codigo");
    document.form2.submit();
//	Submeter("M");	
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
