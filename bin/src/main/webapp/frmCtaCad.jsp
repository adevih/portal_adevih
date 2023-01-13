<jsp:useBean id="prop" scope="page" class="java.util.Properties" />
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ include file="inc/incCabec.jsp"%>
<%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");

	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );

	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String	txtTipArq					=	UTLUtils.getStringToString( request.getParameter("txtTipArq") );
	String	txtNomeArquivo				=	UTLUtils.getStringToString( request.getParameter("txtNomeArquivo") );

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	String	strMensagem					=	UTLUtils.getBranco();

	UTLFileInfo fil						= 	null;
	UTLHttpMultiPartParser hmp			=	new UTLHttpMultiPartParser();
	String bound						=	hmp.getBoundary(request,prop);

	if ( bound != null )
	{
		Hashtable tabela				= 	hmp.parseData(request.getInputStream(), bound);
		Enumeration key					= 	tabela.keys();
		Enumeration elm					=	tabela.elements();
		String keyName 					= 	null;
		String elmValue					= 	null;
		while ( key.hasMoreElements() )
		{
			keyName 					= 	(String) key.nextElement();
			elmValue					= 	UTLUtils.getBranco();
			if (keyName.equals("txtAnexo"))
			{
				fil 					= 	(UTLFileInfo)elm.nextElement();
			}
			else
			{
				elmValue 				= 	(String)elm.nextElement();
			}
			if (keyName.equals("txtAcao")) 				{	txtAcao 			= 	elmValue;							}
			if (keyName.equals("txtNomeArquivo")) 		{	txtNomeArquivo 		= 	elmValue;							}
			if (keyName.equals("sWhidt")) 			    {	sWhidt 			    = 	elmValue;                           }
			if (keyName.equals("sHeight")) 			    {	sHeight			    = 	elmValue;                           }

			if (keyName.equals("txtBusca")) 			{	txtBusca			= 	elmValue;                           }
			if (keyName.equals("txtCodigo")) 			{	txtCodigo			= 	elmValue;                           }
			if (keyName.equals("txtSss")) 			    {	txtSss			    = 	elmValue;                           }
			if (keyName.equals("txtAss")) 			    {	txtAss			    = 	elmValue;                           }
			if (keyName.equals("txtUid")) 			    {	txtUid			    = 	elmValue;                           }
			if (keyName.equals("txtOwn")) 			    {	txtOwn			    = 	elmValue;                           }
			if (keyName.equals("txtTipArq")) 			{	txtTipArq			= 	elmValue;                           }
		}
	}
	
	int		iAcesso						=	UTLUtils.getStringToInt( txtAss );
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);

	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") )
	{
		String sPath					=	dir_base + "/Intranet/inf/arq/" + UTLUtils.getDataAAMMDDHHMMSS(Calendar.getInstance());
		CADContratoArquivo arquivo		=	new CADContratoArquivo();
		arquivo.setIdContrato(UTLUtils.getStringToLong(txtCodigo));
		arquivo.setTipoArquivo(UTLUtils.getStringToInt(txtTipArq));
		arquivo.setPath(sPath);
		arquivo.setNomeArquivo(txtNomeArquivo);
		try
		{
			File file					=	new File(sPath);
			FileOutputStream fos 		= 	new FileOutputStream(file);
			fos.write(fil.getFileContents(), 0, fil.getFileContentLength());
			fos.flush();
			fos.close();
			arquivo.atualize( conn );
			strMensagem					=	"Registro atualizado com sucesso!";
		}
		catch (SQLException e)
		{
			strMensagem 				= 	"Erro na atualiza\u00E7\u00E3o: " + e;
		}
	}
	String sBr2							=	"&nbsp;";
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
	}

	strMensagem							=	strMensagem.replace('\'','´').replace('\n',' ');
	UTLCombo tipoArq					=	new UTLCombo(CADContratoArquivo.TIPO_INCLUIR);
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
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
<script type="text/Javascript">
strAviso = '<%=strMensagem%>';

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
			Submeter("V");
			return;
		}
	}

	document.form1.txtTipArq.focus();
}

var varSubmit = false;
function Submeter(acao) {
	if (acao == "Ext") {
		document.form9.txtAcao.value = "";
		document.form9.action="/";
		document.form9.submit();
		return;
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
		document.form9.txtAcao.value = "modificar";
		document.form9.action = "frmCtaCns.jsp";
	}
	if (acao == "V" || acao == "S" || acao == "Ext") {
		document.form9.submit();
		return;
	}

	if (acao == "A") {
//		document.getElementById("form1").enctype = "multipart/form-data";
//		document.form1.enctype = "multipart/form-data";
		if (document.form1.txtAnexo.value=="") {
			alert("Falta selecionar o arquivo para importar!");
			document.form1.txtAnexo.focus();
			return;
		}
		arq = document.form1.txtAnexo.value;
		pos = 0;
		
		for (i=0;i<arq.length;i++) {
			if (arq.charAt(i) == ".") {
				pos = i + 1;
			}
		}
		ext = arq.substring(pos).toUpperCase();
		err = false;
		if ( ext != "PNG" && ext != "GIF" && ext != "JPG" && ext != "PDF" ) {
			err = true;
		}
		if ( err == true ) {
			alert("Formato de arquivo n\343o reconhecido (" + ext + ")!");
			document.form1.txtNomeArquivo.select();
			document.form1.txtNomeArquivo.focus();
			return;
		}
		pos = 0;
		for (i=0;i<arq.length;i++) {
			if (arq.charAt(i) == '\\') {
				pos = i + 1;
			}
		}
		document.form1.txtNomeArquivo.value = arq.substring(pos);
		document.form1.txtAcao.value = "incluir";
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
						<form  method="post" name="form9"          id="form9"        action="">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtCodigo"      id="txtCodigo"    value="<%=txtCodigo%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
						</form>

						<form  method="post" name="form1"          id="form1"        action="frmCtaCad.jsp" enctype="multipart/form-data">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtCodigo"      id="txtCodigo"    value="<%=txtCodigo%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
				        <input type="hidden" name="txtNomeArquivo" id="txtNomeArquivo" value="">

						<tr>
							<td width="12%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="88%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan=2" valign="top">ARQUIVO CADASTRO</td></tr>
						<tr class="cabAcesso" height="32">
							<td>Tipo:</td>
							<td><%=tipoArq.getCombo("txtTipArq", "class=\"form-control shadow-sm\" ths=\"3\" prv=\"2\" nxt=\"4\" onkeydown=\"javascript: verTab(event);\" ", txtTipArq)%></td>
						</tr>
						<tr class="cabAcesso" height="32">
							<td>Arquivo:</td>
							<td>
								<div class="custom-file">
									<input class="custom-file-input" type="file" value="" name="txtAnexo">
									<label class="custom-file-label" for="customFile">Escolha o arquivo</label>
								</div>
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnVlt" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="Incluir" ths="20" prv="2" nxt="21" onkeydown="javascript: return verTab(event);">
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
			<!--/div-->
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
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
