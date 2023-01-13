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

	if ( (! txtSss.equals(session.getId())) || ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA ) )
	{
		txtSss							=	"...";
	}

	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	String	sWNome						=	"280";

	String	txtColaborador				=	UTLUtils.getStringToString( request.getParameter("txtColaborador") );
	String	txtCad						=	UTLUtils.getStringToString( request.getParameter("txtCad") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	
	String sBr2							=	"&nbsp;&nbsp;&nbsp;";
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
		sWNome							=	"220";
	}
	if ( txtAcao.equals("consultar") )
	{
		intExibir						=	EXIBIR_CONSULTA;
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
<link rel="icon" href="img/favIcon.png">
<title>Elysium Technology</title>
<link rel="stylesheet" href="css/style.css">
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

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if ( document.form1.txtExibir.value == "0" ) {
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
		document.form1.action = "frmClbCns.jsp";
	}
	if (acao == "V") {
		document.form1.txtAcao.value = "";
		document.form1.action = "frmClbCns.jsp";
	}
	if (acao == "N") {
		document.form1.txtColaborador.value = "0";
		document.form1.txtAcao.value = "novo";
		document.form1.action = "frmClbCad.jsp";
	}
	if (acao == "M") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmClbCad.jsp";
	}
	varSubmit = true;
	document.form1.submit();
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto" style="background-color:#121212;">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto">
<%@ include file="inc/incSideBar.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form w-100">

				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" _bgcolor="#DBDCDC">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table border="0" width="98%" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"         id="sWhidt"         value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"        value="<%=sHeight%>">
						<input type="hidden" name="txtColaborador" id="txtColaborador" value="<%=txtColaborador%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"        value="">
						<input type="hidden" name="txtExibir"      id="txtExibir"      value="<%=intExibir%>">
						<input type="hidden" name="txtSss"         id="txtSss"         value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"         value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"         value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"  id="txtOwn"  value="<%=txtOwn%>">
						<tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td class="text-center" colspan="2" valign="top"><!--img src="img/user_edit.png" alt="">&nbsp;-->VERIFY COORDINATOR</td></tr>
<%
	if ( intExibir == EXIBIR_PROCURA )
	{
%>
						<tr>
							<td colspan="2"  align="center" valign="middle">
								<input class="form-control shadow-sm w-75" type="search" name="txtBusca" id="txtBusca" placeholder="Buscar" _size="40" ths="1" prv="21" nxt="20" onfocus="javascript: this.select();" value="<%=txtBusca%>" onkeydown="javascript: return verTab(event);">
							</td>
							
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('C');" type="button" name="btnAcao" value="Verify" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="New" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;">  <div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
							</td>
						</tr>

<%
	}
	else
	{
%>
						<tr class="cabAcesso">
							<td colspan="2" bgcolor="#ffffff">
								<table class="title_table" width="100%" border="0" cellpadding="0" cellspacing="1" name="tbCab" id="tbCab" >
								<%-- <tr>
									<td width="88%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="7%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="5%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
								<tr bgcolor="#3d3d3d" style="font-size:10pt; letter-spacing: 3px; font-weight: bolder;">
									<td>NAME</td>
									<td align="center">ID</td>
									<td>&nbsp;</td>
								</tr>
								</table>
							<div name="divProg" id="divProg" style="height: 300; width: 100%; overflow: auto; display:block; overflow-y: scroll; background-color:#323232;">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" name="tbPes" id="tbPes">
								<%-- <tr>
									<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
<%
		String strCor1					= 	"#525252";
		String strCor2					= 	"#3d3d3d";
		String	strCor 					= 	strCor2;
		int	iLidos						=	1;

		CADColaborador _colaborador		=	new CADColaborador( CADColaborador.BUSCA_CADASTRO, 0L, txtBusca, 0, 0, 0, 0, conn );
		UTLPage pager					=	(UTLPage)_colaborador;
		while ( _colaborador.next() )
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
				out.write("<tr class=\"selecF12c\" height=\"32\"");
			}
			else
			{
				out.write("<tr class=\"selecF12c\" height=\"32\"");
			}
			out.write( " title=\"Double click to select Register\" onmouseover=\"javascript: OnOver(event);\" onmouseout=\"javascript: OnOut(event);\" onclick=\"javascript: OnClick(event);\" ondblclick=\"javascript: OnDblClick(event);\" " );
			out.write( " onkeydown=\"javascript: OnKeyDown(event);\"  " );
			out.write( " tab=\"" + ++iLidos + "\" " );
			out.write( " bgcolor=\"" );
			out.write( strCor );
			out.write( "\" cor=\"" );
			out.write( strCor );
			out.write( "\" codigo=\"" + _colaborador.getId() + "\"><td>" );
			out.write(_colaborador.getNome());
			out.write("</td><td align=\"center\">" + _colaborador.getId() );
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
									<input class="btn btn-dark btn-custom-3" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Return" ths="21" prv="22" nxt="23" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom-3" onclick="javascript: Submeter('M');" type="button" name="btnAcao" value="Modify" ths="20" prv="1" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom-3" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="New" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden; "><div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
								<input type="hidden" name="txtLidos" id="txtLidos" value="<%=iLidos%>">
								<input type="hidden" name="txtBusca" id="txtBusca" value="<%=txtBusca%>">
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
		document.form1.txtColaborador.value = posicaoAnterior.getAttribute("codigo");
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
	document.form1.txtColaborador.value = tr.getAttribute("codigo");
	posicaoAnterior = tr;
}

function OnDblClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
	document.form1.txtColaborador.value = tr.getAttribute("codigo");
	Submeter("M");	
}
</script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
