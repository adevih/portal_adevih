<jsp:useBean id="prop" scope="page" class="java.util.Properties" /><%@ page import="java.io.*, java.util.*" %><%@ include file="inc/incCabec.jsp"%><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");

	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtContrato					=	UTLUtils.getStringToString( request.getParameter("txtContrato") );
    String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );

	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String	txtTipArq					=	UTLUtils.getStringToString( request.getParameter("txtTipArq") );
	String	txtNomeArquivo				=	UTLUtils.getStringToString( request.getParameter("txtNomeArquivo") );
	String	txtNomCli					=	UTLUtils.getStringToString( request.getParameter("txtNomCli") );

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	String	strMensagem					=	UTLUtils.getBranco();
	String	txtTodos					=	UTLUtils.getBranco();

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
			if (keyName.equals("txtContrato")) 			{	txtContrato			= 	elmValue;                           }
			if (keyName.equals("txtCliente")) 			{	txtCliente			= 	elmValue;                           }
			if (keyName.equals("txtOrigem")) 			{	txtOrigem			= 	elmValue;                           }
			if (keyName.equals("txtSss")) 			    {	txtSss			    = 	elmValue;                           }
			if (keyName.equals("txtAss")) 			    {	txtAss			    = 	elmValue;                           }
			if (keyName.equals("txtUid")) 			    {	txtUid			    = 	elmValue;                           }
			if (keyName.equals("txtFrq")) 			    {	txtFrq			    = 	elmValue;                           }
			if (keyName.equals("txtOwn")) 			    {	txtOwn			    = 	elmValue;                           }
			if (keyName.equals("txtTipArq")) 			{	txtTipArq			= 	elmValue;                           }
		}
	}
	
	int		iAcesso						=	UTLUtils.getStringToInt( txtAss );
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);

	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") )
	{
		Hashtable<String, Integer> ht	=	new Hashtable<String, Integer>();
		ht.put("PNG", new Integer(6));
		ht.put("GIF", new Integer(7));
		ht.put("JPG", new Integer(8));
		ht.put("JPEG", new Integer(9));
		ht.put("PDF", new Integer(10));
		ht.put("DOC", new Integer(11));
		ht.put("DOCX", new Integer(12));

		String sId						=	UTLUtils.getDataAAMMDDHHMMSS(Calendar.getInstance());
		long lId						=	Long.parseLong(sId);


//		String sPath					=	"/home3/portalin/Intranet/inf/arq/" + sId;	//UTLUtils.getDataAAMMDDHHMMSS(Calendar.getInstance());
		String sPath					=	dir_base + "/Intranet/inf/arq/" + sId; 	//UTLUtils.getDataAAMMDDHHMMSS(Calendar.getInstance());
		CADContratoArquivoNovo arquivo	=	new CADContratoArquivoNovo();
		arquivo.setIdContrato			( UTLUtils.getStringToLong(txtContrato)	);
		arquivo.setTipoArquivo			( UTLUtils.getStringToInt(txtTipArq)	);
		arquivo.setPath					( sPath									);
		arquivo.setNomeArquivo			( txtNomeArquivo						);

		String sTmp						= 	txtNomeArquivo;
		if ( sTmp.length() > 6 )
		{
			sTmp						= 	sTmp.substring(sTmp.length() - 6);
		}
		sTmp							= 	sTmp.substring(sTmp.lastIndexOf(".") + 1).toUpperCase();

		CADArquivo _arquivo				=	new CADArquivo();
		_arquivo.setId					( lId									);
    	_arquivo.setExtensaoArquivo		( ht.get(sTmp).intValue()				);
    	_arquivo.setIdContrato			( UTLUtils.getStringToLong(txtContrato)	);
		_arquivo.setNomeArquivo			( txtNomeArquivo						);
		_arquivo.setPathArquivo			( sPath									);
		_arquivo.setDataUpload 			( Calendar.getInstance()				);
		_arquivo.setConteudoArquivo		( fil.getFileContents()					);
		arquivo.setIdArquivo			( _arquivo.getId() 						);

		try
		{
			_arquivo.atualize( conn );
			arquivo.atualize( conn );
			strMensagem					=	"Document sended!";
/*
			File file					=	new File(sPath);
			FileOutputStream fos 		= 	new FileOutputStream(file);
			fos.write(fil.getFileContents(), 0, fil.getFileContentLength());
			fos.flush();
			fos.close();
*/
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

	strMensagem							=	strMensagem.replace('\'','?').replace('\n',' ');
	String txtTipo						=	"";
	
	if ( txtAcao.equals("novo") )
	{
//		boolean bCnt					=	true;
		boolean bIdt					=	true;
		boolean bPag					=	true;
//		boolean bSep					=	false;
		CADContratoArquivoNovo _arq		=	new CADContratoArquivoNovo( UTLUtils.getStringToLong(txtContrato), 1, conn );
		while ( _arq.next() )
		{
//			if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_CONTRATO )
//			{
//				bCnt					=	false;
//			}
			if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_IDENTIDADE )
			{
				bIdt					=	false;
			}
			if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_PAGAMENTO )
			{
				bPag					=	false;
			}
		}
		StringBuilder sb				=	new StringBuilder();
//		if ( bCnt )
//		{
//			sb.append(CADContratoArquivoNovo.getTipo(CADContratoArquivoNovo.TIPO_CONTRATO));
//			bSep						=	true;
//		}
		if ( bIdt )
		{
			sb.append(CADContratoArquivoNovo.getTipo(CADContratoArquivoNovo.TIPO_IDENTIDADE));
			sb.append(",");
			sb.append(CADContratoArquivoNovo.getTipo(CADContratoArquivoNovo.TIPO_PAGAMENTO));
		}
		else
		{
			sb.append(CADContratoArquivoNovo.getTipo(CADContratoArquivoNovo.TIPO_PAGAMENTO));
			sb.append(",");
			sb.append(CADContratoArquivoNovo.getTipo(CADContratoArquivoNovo.TIPO_IDENTIDADE));
		}
//		sb.append(CADContratoArquivoNovo.getTipo(CADContratoArquivoNovo.TIPO_PAGAMENTO));
		txtTipo							=	sb.toString();
//		if (  !bCnt && !bIdt && !bPag )
		if (  !bIdt && !bPag )
		{
			txtTodos					=	"S";
		}
	}
	UTLCombo tipoArq					=	new UTLCombo(txtTipo);

	
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
		if (strAviso == "Document sended!") {
			Submeter("V");
			return;
		}
	}

	document.form9.txtAnexo.focus();
	if ( document.form9.txtTodos.value == "S" ) {
		if ( confirm("All the documents are included! Do you want to include a new Contract/Document?") != true ) {
			Submeter("V");
			return;
		}
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmCtaCnsN.jsp";
	}
	if (acao == "A") {
		if (document.form9.txtAnexo.value=="") {
			alert("You didn't selected anything to import!");
			document.form9.txtAnexo.focus();
			return;
		}
		arq = document.form9.txtAnexo.value;
		pos = 0;
		
		for (i=0;i<arq.length;i++) {
			if (arq.charAt(i) == ".") {
				pos = i + 1;
			}
		}
		ext = arq.substring(pos).toUpperCase();
		err = false;
		if ( ext != "PNG" && ext != "GIF" && ext != "JPG" && ext != "JPEG" && ext != "PDF" && ext != "DOC " && ext != "DOCX " ) {
			err = true;
		}
		if ( err == true ) {
			alert("Document format not supported (" + ext + ")!");
			document.form9.txtNomeArquivo.select();
			document.form9.txtNomeArquivo.focus();
			return;
		}
		pos = 0;
		for (i=0;i<arq.length;i++) {
			if (arq.charAt(i) == '\\') {
				pos = i + 1;
			}
		}
		document.form9.txtNomeArquivo.value = arq.substring(pos);
		document.form9.txtAcao.value = "incluir";
		varSubmit = true;
		document.form9.action="frmCtaCadN.jsp";
		document.form9.enctype="multipart/form-data";
		document.form9.submit();
	} else {
		varSubmit = true;
		document.form1.submit();
	}
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
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto" style="background-color:#080808;" >
<%@ include file="inc/incSideBar2.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form w-100">

				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" class="col-12 col-lg-10 m-auto justify-content-center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form  method="post" name="form1"          id="form1"        action="">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtCliente"     id="txtCliente"   value="<%=txtCliente%>">
						<input type="hidden" name="txtContrato"    id="txtContrato"  value="<%=txtContrato%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"         id="txtFrq"       value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"    value="<%=txtOrigem%>">
						</form>

						<form  method="post" name="form9"          id="form9"        action="">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtCliente"     id="txtCliente"   value="<%=txtCliente%>">
						<input type="hidden" name="txtContrato"    id="txtContrato"  value="<%=txtContrato%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"         id="txtFrq"       value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"    value="<%=txtOrigem%>">
						<input type="hidden" name="txtTodos"       id="txtTodos"     value="<%=txtTodos%>">
				        <input type="hidden" name="txtNomeArquivo" id="txtNomeArquivo" value="">
						<tr>
							<td width="12%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="88%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<!--tr class="linha" height="26"-->
						<tr class="selecF12 text-center" height="50"><td colspan="2" class="h-100 m-5" valign="top">New Document</td></tr>
						<tr class="cabAcesso" height="32">
							<td >Investor:</td>
							<td >
								<input class="form-control shadow-sm" type="text" name="txtNomCli" id="txtNomCli" style="background-color: #e6e6e6" onfocus="javascript: this.blur();" value="<%=txtNomCli%>" onkeydown="javascript: return false;">
							</td>
						</tr>
						<tr class="cabAcesso" height="32">
							<td>Format:</td>
							<td><%=tipoArq.getCombo("txtTipArq", "class=\"form-control shadow-sm\" ths=\"3\" prv=\"2\" nxt=\"4\" onkeydown=\"javascript: verTab(event);\" ", txtTipArq)%></td>
						</tr>
						<tr class="cabAcesso" height="32">
							<td>Document:</td>
							<td>
								<div class="custom-file">
									<input class="custom-file-input" size="20" type="file" value="" name="txtAnexo" id="txtAnexo">
									<label class="custom-file-label" for="txtAnexo">Choose your Document</label>
								</div>
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnVlt" onclick="javascript: Submeter('V');" value="Back" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="Send Document" ths="20" prv="2" nxt="21" onkeydown="javascript: return verTab(event);">
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div></div>
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

ordemText = () =>{
	if(txtTipArq.value == 2){
		txtTipArq.options[1].innerText = "Document"
	txtTipArq.options[0].innerText = "Payment"

	}
	if(txtTipArq.value == 1){
		txtTipArq.options[0].innerText = "Document"
		txtTipArq.options[1].innerText = "Payment"
	}
}

ordemText()

</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
