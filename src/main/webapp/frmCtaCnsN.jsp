<%@ include file="inc/incCabec.jsp"%><%@ page import="java.io.*" %><%
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtContrato					=	UTLUtils.getStringToString( request.getParameter("txtContrato") );
	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );

	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String	txtArquivo					=	UTLUtils.getStringToString( request.getParameter("txtArquivo") );
	String	txtSituacao					=	UTLUtils.getStringToString( request.getParameter("txtSituacao") );
	String	txtVisto					=	UTLUtils.getStringToString( request.getParameter("txtVisto") );
	String	txtAprovado					=	UTLUtils.getStringToString( request.getParameter("txtAprovado") );
	String 	strMensagem					=	UTLUtils.getBranco();

	long lContrato						=	UTLUtils.getStringToLong(txtContrato);
	int iAcesso							=	Integer.parseInt(txtAss);
	int iAprovar						=	0;
	int iArquivos						=	0;

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
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
		sWNome							=	"220";
	}

	if ( txtAcao.equals("excluir") )
	{
		CADContratoArquivoNovo _arquivo	=	new CADContratoArquivoNovo( UTLUtils.getStringToLong(txtArquivo), conn );
		CADClienteNovo _cliente	        =	_arquivo.getContrato().getCliente();
		try
		{
			try
			{
				File file				=	new File(_arquivo.getPath());
				file.delete();
			}
			catch ( Exception e )
			{
				System.out.println("frmCtaCnsN: Erro excluido arquivo:" + _arquivo.getId() + " | " + _arquivo.getPath());
		    	e.printStackTrace(System.out);
			}
			_arquivo.delete( conn );
			CADContratoArquivoNovo _arq		=	new CADContratoArquivoNovo( lContrato, 1, conn );
			if ( _cliente.getSituacao() == CADClienteNovo.SITUACAO_COODENADOR_APROVANDO || _cliente.getSituacao() == CADClienteNovo.SITUACAO_FINANCEIRO_APROVANDO )
			{
				if ( _cliente.getSituacao() == CADClienteNovo.SITUACAO_COODENADOR_APROVANDO )
				{
					_cliente.setSituacao(CADClienteNovo.SITUACAO_COODENADOR_DOCUMENTO);
					while ( _arq.next() )
					{
						_arq.setDataVisto(null);
						_arq.atualize(conn);
					}
				}
				if ( _cliente.getSituacao() == CADClienteNovo.SITUACAO_FINANCEIRO_APROVANDO )
				{
					_cliente.setSituacao(CADClienteNovo.SITUACAO_FINANCEIRO_DOCUMENTO);
					while ( _arq.next() )
					{
						_arq.setDataAprovado(null);
						_arq.atualize(conn);
					}
				}
				_cliente.atualize(conn);
			}
			strMensagem 				= 	"Document Successful deleted!";
		}
		catch (SQLException e)
		{
			strMensagem 				= 	"Erro na atualiza\u00E7\u00E3o: " + e;
		}
	}

	if ( txtAcao.equals("aprovar") )
	{
		boolean bAtualizar				=	false;
		CADContratoArquivoNovo _arquivo	=	new CADContratoArquivoNovo( UTLUtils.getStringToLong(txtArquivo), conn );
		if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )	// Corrdenador / Franquia
		{
			if ( txtVisto.equals("S") )
			{
				bAtualizar				=	true;
				_arquivo.setDataVisto();
			}
		}
		if ( iAcesso == CADColaborador.CADASTRO_FINANCEIRO )	// Financeiro
		{
			if ( txtAprovado.equals("S") )
			{
				bAtualizar				=	true;
				_arquivo.setDataAprovado();
			}
		}
		if ( bAtualizar )
		{
			try
			{
				_arquivo.atualize( conn );
				strMensagem				=	"Document approved!";
			}
			catch (SQLException e)
			{
				strMensagem 			= 	"Erro na atualiza\u00E7\u00E3o: " + e;
			}
		}
	}
	if ( txtAcao.equals("aprovar") || txtAcao.equals("consultar") )
	{
//		boolean bCnt					=	false;
		boolean bIdt					=	false;
		boolean bPag					=	false;
		CADContratoArquivoNovo _arq		=	new CADContratoArquivoNovo( lContrato, 1, conn );
		iAprovar						=	_arq.lidos();
		iArquivos						=	0;
		while ( _arq.next() )
		{
			if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )	// Corrdenador / Franquia
			{
				if ( _arq.isVisto() )
				{
					iArquivos++;
//					if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_CONTRATO )
//					{
//						bCnt			=	true;
//					}
					if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_IDENTIDADE )
					{
						bIdt			=	true;
					}
					if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_PAGAMENTO )
					{
						bPag			=	true;
					}
				}
			}
			else
			{
				if ( _arq.isAprovado() )
				{
					iArquivos++;
//					if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_CONTRATO )
//					{
//						bCnt			=	true;
//					}
					if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_IDENTIDADE )
					{
						bIdt			=	true;
					}
					if ( _arq.getTipoArquivo() == CADContratoArquivoNovo.TIPO_PAGAMENTO )
					{
						bPag			=	true;
					}
				}
			}
		}
//		if ( iAprovar == iArquivos && bCnt && bIdt && bPag )
		if ( iAprovar == iArquivos && bIdt && bPag )
		{
			try
			{
				CADClienteNovo _cliente		=	new CADClienteNovo( UTLUtils.getStringToLong( txtCliente ), conn );
				if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )
				{
					_cliente.setSituacao(CADClienteNovo.SITUACAO_COODENADOR_APROVANDO);
				}
				if ( iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
				{
					_cliente.setSituacao(CADClienteNovo.SITUACAO_FINANCEIRO_APROVANDO);
				}
				_cliente.atualize( conn );
				strMensagem			=	"All Documents Approved!";
			}
			catch (SQLException e)
			{
				strMensagem 		= 	"Erro na atualiza\u00E7\u00E3o: " + e;
			}
		}
	}
	
	String	txtAvisoSituacao			=	"Approved Documents";
	boolean bDocAprovar					=	false;
	iArquivos							=	0;
	CADContratoArquivoNovo _arquivo		=	new CADContratoArquivoNovo( lContrato, 1, conn );
	iAprovar							=	_arquivo.lidos();
	while ( _arquivo.next() )
	{
		if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )	// Corrdenador / Franquia
		{
			if ( _arquivo.isVisto() )
			{
				iArquivos++;
			}
		}
		else
		{
			if ( _arquivo.isAprovado() )
			{
				iArquivos++;
			}
		}
	}
	_arquivo.start();
	if ( iArquivos != iAprovar )
	{
		txtAvisoSituacao				=	"Documents awaiting for approval";
	}
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
<link rel="stylesheet" href="css/style2.css">
<script type="text/javascript" src="inc/js/autotab.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<%-- <script type="text/javascript" src="inc/js/autotab.js"></script> --%>
    <!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/solid.min.js" integrity="sha512-dcTe66qF6q/NW1X64tKXnDDcaVyRowrsVQ9wX6u7KSQpYuAl5COzdMIYDg+HqAXhPpIz1LO9ilUCL4qCbHN5Ng==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js" integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";
strTipo = "";
function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if (strAviso != "") alert(strAviso);

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	document.onkeydown = OnKeyDown;
//	if ( parseInt(document.getElementById("txtLidos").value) > 1 ) {
//		document.getElementById("tbPes").getElementsByTagName("tr")[1].click();
//	}
	
	if ( strAviso == "All Documents Approved!" ) {
//		Submeter("Cn");
		Submeter("V");
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		document.form1.txtAcao.value = "modificar";
		document.form1.action = "frmCntCadN.jsp";
		document.form1.action = document.form1.txtOrigem.value;
	}
	if (acao == "E") {
		if ( confirm("Cofirm the DELETION of the Document " + strTipo + "?") != true ) return;
		document.form1.txtAcao.value = "excluir";
		document.form1.action = "frmCtaCnsN.jsp";
	}
	if (acao == "N") {
		document.form1.txtAcao.value = "novo";
		document.form1.action = "frmCtaCadN.jsp";
	}
	if (acao == "Ap") {
		if ( confirm("Confirm the APPROVATION of the Document?") != true ) return;
		if ( document.form1.txtAss.value == "<%=CADColaborador.CADASTRO_FINANCEIRO%>" ) {
			document.form1.txtAprovado.value = "S";
		} else {
			document.form1.txtVisto.value = "S";
		}
		document.form1.txtAcao.value = "aprovar";
		document.form1.action = "frmCtaCnsN.jsp";
	}
	if (acao == "Cn") {
		document.form1.txtAcao.value = "modificar";
//		document.form1.action = "frmCliCadN.jsp";
		document.form1.action = document.form1.txtOrigem.value;
	}
	varSubmit = true;
	document.form1.submit();
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto" style="background-color:#080808;">
<%@ include file="inc/incSideBar2.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form col-12 p-0">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" class="col-12 col-lg-10 m-auto justify-content-center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"      id="sWhidt"      value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"     id="sHeight"     value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"     id="txtAcao"     value="<%=txtAcao%>">
						<input type="hidden" name="txtSss"      id="txtSss"      value="<%=txtSss%>">
						<input type="hidden" name="txtAss"      id="txtAss"      value="<%=txtAss%>">
						<input type="hidden" name="txtUid"      id="txtUid"      value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"      id="txtFrq"      value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"      id="txtOwn"      value="<%=txtOwn%>">
						<input type="hidden" name="txtOrigem"   id="txtOrigem"   value="<%=txtOrigem%>">
						<input type="hidden" name="txtCliente"  id="txtCliente"  value="<%=txtCliente%>">
						<input type="hidden" name="txtContrato" id="txtContrato" value="<%=txtContrato%>">
						
						<input type="hidden" name="txtArquivo"  id="txtArquivo"  value="<%=txtArquivo%>">
						<input type="hidden" name="txtSituacao" id="txtSituacao" value="<%=txtSituacao%>">
						<input type="hidden" name="txtVisto"    id="txtVisto"    value="<%=txtVisto%>">
						<input type="hidden" name="txtAprovado" id="txtAprovado" value="<%=txtAprovado%>">
						<tr>
							<td width="95%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="5%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12 text-center" height="50"><td colspan="2" class="h-100 m-5" valign="top">NEW DOCUMENTS<br><%=txtAvisoSituacao%><br><br></td></tr>
						<tr>
							<td colspan="2">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<%-- <tr>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
								<tr class="linha" height="26">
									<td >Investor:</td>
									<td >
<%
//	long lContrato						=	UTLUtils.getStringToLong(txtContrato);
	CADContratoNovo _contrato			=	new CADContratoNovo( lContrato, conn );
%>
										<input class="form-control shadow-sm" type="text" name="txtNomCli" id="txtNomCli" style="background-color: #e6e6e6" onfocus="javascript: this.blur();" value="<%=_contrato.getCliente().getNome()%>" onkeydown="javascript: return false;">
									</td>
								</tr>
								<tr><td colspan="2">&nbsp;</td></tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#fff" name="tbCab" id="tbCab" >
								<%-- <tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="70%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="7%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="3%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr> --%>
								<tr style="background-color:#3d3d3d; color:#fff; font-size:10pt; letter-spacing: 3px; font-weight: bolder">
									<td>DATA</td>
									<td>DOCUMENTS</td>
									<td>STATUS</td>
									<td>&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="70%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="7%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="3%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
								</table>
							<div name="divProg" id="divProg" style="height: 150; width: 100%; overflow: auto; display:block; overflow-y: scroll;">
								<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#323232" name="tbPes" id="tbPes" >
								<tr>
									<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="70%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
									<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
								</tr>
<%
	String strCor1					= 	"#525252";
	String strCor2					= 	"#3d3d3d";
	String	strCor 					= 	strCor2;
	int	iLidos						=	1;
	
//	CADContratoArquivoNovo _arquivo	=	new CADContratoArquivoNovo( lContrato, 1, conn );
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
		out.write( " title=\"click to select the Document\" onmouseover=\"javascript: OnOver(event);\" onmouseout=\"javascript: OnOut(event);\" onclick=\"javascript: OnClick(event);\" ondblclick=\"javascript: OnDblClick(event);\" " );
		out.write( " onkeydown=\"javascript: OnKeyDown(event);\"  " );
		out.write( " tab=\"" + ++iLidos + "\" " );
		out.write( " bgcolor=\"" );
		out.write( strCor );
		out.write( "\" cor=\"" );
		out.write( strCor );
		out.write( "\" codigo=\"" + _arquivo.getId() );
		out.write( "\" visto=\"" + (_arquivo.isVisto() ? "S" : "N") );
		out.write( "\" aprovado=\"" + (_arquivo.isAprovado() ? "S" : "N") );
		out.write( "\" situacao=\"" + _arquivo.getSituacao() );
		out.write( "\" tipo=\"" + _arquivo.getTipoArquivoTitulo() );
		out.write( "\"><td>" );
		out.write( UTLUtils.getDiaHora(_arquivo.getDataUpload()) );
		out.write("</td><td>" );
			String doc = "Document";
			String doc2 = "Payment";
			String arq = _arquivo.getTipoArquivoTitulo();
			if(arq == "Identidade"){
				arq = doc;
			}
			else{
				arq = doc2;
			}

			//
			out.write(arq);
//		out.write("</td><td>" );
//		out.write( _arquivo.getNomeArquivo() );
		out.write("</td><td>");
		if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )
		{
			if ( _arquivo.isVisto() )
			{
				out.write("<img src=\"img/tick.png\" width=\"16\" height=\"16\" alt=\"Approved Document\">");
			}
			else
			{
				out.write("<img src=\"img/page_white_magnify.png\" width=\"16\" height=\"16\" alt=\"Validate Document\" onclik=\"alert('alterar');\">");
			}
		}
		if ( iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
		{
			if ( _arquivo.isAprovado() )
			{
				out.write("<img src=\"img/tick.png\" width=\"16\" height=\"16\" alt=\"documento aprovado\">");
			}
			else
			{
				out.write("<img src=\"img/page_white_magnify.png\" width=\"16\" height=\"16\" alt=\"validar documento\" onclik=\"alert('alterar');\">");
			}
		}
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
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="back">
<%
	if ( iAcesso == CADColaborador.CADASTRO_CONSULTA || iAcesso == CADColaborador.CADASTRO_FRANQUIA )
	{
%>
									&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('N');" type="button" name="btnAcao" value="New Document" ths="22" prv="20" nxt="21" onkeydown="javascript: return verTab(event);">
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
						
						<form method="post"  name="form2"       id="form2"       action="frmCtaDwnN.jsp" >
						<input type="hidden" name="txtSss"      id="txtSss"      value="<%=txtSss%>">
						<input type="hidden" name="txtAss"      id="txtAss"      value="<%=txtAss%>">
						<input type="hidden" name="txtUid"      id="txtUid"      value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"      id="txtFrq"      value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"      id="txtOwn"      value="<%=txtOwn%>">
						<input type="hidden" name="fl"          id="fl"          value="">
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
	<div id="divShowDoc" style="position: fixed; top: 0px; left: 0px; width:100%; height:97%; background: #323232; display: none; visibility: hidden;">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#161616">
		<tr height="80">
			<td width="22%" bgcolor="#161616" _rowspan="2" align="center"><img class="g-2" src="img/logo_responsiva.png" width="160"/></td>
			<td width="88%">
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#161616">
				<tr height="30">
					
					<td width="40%" class="text-center" colspan="2">New Document</td>
					<td width="60%" rowspan="2" align="center">
						<div id="divAprovar" name="divAprovar" style="display: none; visibility: hidden;">
							<label for="txtAprovar" style="cursor:pointer;"><span name="shwDoc" id="shwDoc"></span>:&nbsp;&nbsp;Approve?&nbsp;&nbsp;Yes<input type="checkbox" name="txtAprovar" id="txtAprovar" value="S" onclick="javascript: Submeter('Ap');">
						</div>
						<div id="divAprovado" name="divAprovado" style="display: none; visibility: hidden;">
							Approved&nbsp;&nbsp;<img src="img/tick.png" width="16" height="16" alt="documento aprovado">
						</div>
					</td>
				</tr>
				<tr height="30">
					<td width="2%">&nbsp;</td>
					<td width="18%"><input class="btn btn-dark btn-custom" onclick="javascript: Submeter('E');" type="button" name="btnAcao" value="Delete" ths="20" prv="2" nxt="21" onkeydown="javascript: return verTab(event);"></td>
					<td width="18%"><input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: fecharDoc();" value="Close"></td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		<iframe name="showDoc" id="showDoc" allow="accelerometer; fillscreen; gyroscope; midi;" width="100%" height="97%" scrolling="yes"></iframe>
	</div>
</body>
<script type="text/Javascript">
function fecharDoc() {
	document.getElementById("divShowDoc").style.display = "none";
	document.getElementById("divShowDoc").style.visibility = "hidden";
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
	document.form1.txtArquivo.value = tr.getAttribute("codigo");
	document.form1.txtSituacao.value = tr.getAttribute("situacao");
	document.form1.txtVisto.value = tr.getAttribute("visto");
	document.form1.txtAprovado.value = tr.getAttribute("aprovado");
	strTipo = tr.getAttribute("tipo").toUpperCase();
	document.getElementById("shwDoc").innerHTML = strTipo;
	posicaoAnterior = tr;
	
	url = "frmCtaShwN.jsp?txtSss=<%=txtSss%>&txtAss=<%=txtAss%>&txtUid=<%=txtUid%>&fl=" + document.form1.txtArquivo.value;
	document.getElementById("divShowDoc").style.display = "block";
	document.getElementById("divShowDoc").style.visibility = "visible";
	document.getElementById("showDoc").src=url;
	if ( document.form1.txtAss.value == "<%=CADColaborador.CADASTRO_FINANCEIRO%>" ) {
		if ( document.form1.txtAprovado.value == "S" )
		{
			document.getElementById("divAprovar").style.display = "none";
			document.getElementById("divAprovar").style.visibility = "hidden";
			document.getElementById("divAprovado").style.display = "block";
			document.getElementById("divAprovado").style.visibility = "visible";
		}
		else
		{
			document.getElementById("divAprovado").style.display = "none";
			document.getElementById("divAprovado").style.visibility = "hidden";
			document.getElementById("divAprovar").style.display = "block";
			document.getElementById("divAprovar").style.visibility = "visible";
		}
	}
	else
	{
		if ( document.form1.txtVisto.value == "S" )
		{
			document.getElementById("divAprovar").style.display = "none";
			document.getElementById("divAprovar").style.visibility = "hidden";
			document.getElementById("divAprovado").style.display = "block";
			document.getElementById("divAprovado").style.visibility = "visible";
		}
		else
		{
			document.getElementById("divAprovado").style.display = "none";
			document.getElementById("divAprovado").style.visibility = "hidden";
			document.getElementById("divAprovar").style.display = "block";
			document.getElementById("divAprovar").style.visibility = "visible";
		}
	}
}

function OnDblClick(e) {
	e = window.event || e;
	tr = e.target || e.srcElement;
	while ( tr.tagName.toUpperCase() != "TR" ) {
		tr = tr.parentElement;
	}
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
