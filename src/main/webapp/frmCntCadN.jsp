<%@ include file="inc/incCabec.jsp"%><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);

	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String 	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	int		iAcesso						=	UTLUtils.getStringToInt( txtAss );
	int		iSituacao					=	-1;
	String	txtBtnArq					=	"";

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

//	int		intFranquia					=	UTLUtils.getStringToInt( txtFrq );
	long 	lCliente					=	UTLUtils.getStringToLong( request.getParameter("txtCliente") );
	long 	lColaborador				=	UTLUtils.getStringToLong( request.getParameter("txtColaborador") );

	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
		if ( lColaborador == 0 )
		{
			lColaborador				=	Integer.parseInt(txtUid);
		}
	}


	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );
	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	int		intPagina					=	UTLUtils.getStringToInt( request.getParameter("txtPagina") ) ;
	int		intTotal					=	UTLUtils.getStringToInt( request.getParameter("txtTotal") ) ;

	String	txtContrato					=	UTLUtils.getStringToString( request.getParameter("txtContrato") );
	String	txtMes						=	UTLUtils.getStringToString( request.getParameter("txtMes") );
	String	txtValor					=	UTLUtils.getStringToString( request.getParameter("txtValor") );
	String	txtPercInv					=	UTLUtils.getStringToString( request.getParameter("txtPercInv") );
	String	txtPercClb					=	UTLUtils.getStringToString( request.getParameter("txtPercClb") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	if ( txtFranquia.trim().length() == 0 )
	{
		txtFranquia						=	txtFrq;
	}
	String	txtDataPag					=	UTLUtils.getStringToString( request.getParameter("txtDataPag") );

	if ( txtPercInv.trim().length() == 0 )
	{
		txtPercInv						=	"10";
	}
	if ( txtPercClb.trim().length() == 0 )
	{
		txtPercClb						=	"2";
	}

	String	strBtn						=	"Incluir";
	String	strMensagem					=	UTLUtils.getBranco();
	boolean bAlterar					=	true;
	
	if ( txtAcao.equals("modificar") || txtAcao.equals("exibir") )
	{
		long lCodigo					=	Long.parseLong( txtContrato );
		CADContratoNovo _contrato		=	new CADContratoNovo( lCodigo, conn );
		lCliente						=	_contrato.getIdCliente();
		lColaborador					=	_contrato.getIdColaborador();
		txtMes							=	_contrato.getMeses() + "";
		txtValor						=	UTLUtils.getValor(_contrato.getValorInvestido());
		txtPercInv						=	((int)(_contrato.getPercentualInvestido() * 100)) + "";
		txtPercClb						=	((int)(_contrato.getPercentualComissao() * 100)) + "";
	 	txtFranquia						=	_contrato.getFranquia() + "";
		txtDataPag						=	UTLUtils.getDia(_contrato.getDataPagamento());
		iSituacao						=	_contrato.getCliente().getSituacao();
		strBtn							=	"Atualizar";
		CADClientePagamento _pgCli		=	new CADClientePagamento( lCodigo, 0L, null, null, 0, conn );
		while ( _pgCli.next() )
		{
			if ( _pgCli.getDataPagamento() != null )
			{
				bAlterar				=	false;
				break;
			}
		}
		txtBtnArq						=	"<div class=\"grupo-coluna-r\"><input class=\"btn btn-dark btn-custom\" onclick=\"javascript: Submeter('Cp');\" type=\"button\" name=\"btnArq\" value=\"Arquivos\"></div>";
	}
	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") || txtAcao.equals("aprovar") )
	{
		CADClienteNovo _cliente			=	null;
		
		if ( txtAcao.equals("incluir") )
		{
			CADCliente _origem			=	new CADCliente( lCliente, conn );
			_cliente					=	new CADClienteNovo();
			
			_cliente.setCarteira			( _origem.getCarteira() 			);
			_cliente.setCpf					( _origem.getCpf()					);
			_cliente.setNome				( _origem.getNome()					);
			_cliente.setIdentidade			( _origem.getIdentidade()			);
			_cliente.setEndereco			( _origem.getEndereco()				);
			_cliente.setCep					( _origem.getCep()					);
			_cliente.setPix					( _origem.getPix()					);
			_cliente.setEnderecoCarteira	( _origem.getEnderecoCarteira()		);
			_cliente.setEnderecoAlternativo	( _origem.getEnderecoAlternativo()	);
			_cliente.setBanco				( _origem.getBanco()				);
			_cliente.setAgencia				( _origem.getAgencia()				);
			_cliente.setContaCorrente		( _origem.getContaCorrente()		);
			_cliente.setFavorecido			( _origem.getFavorecido()			);
			_cliente.setEmail				( _origem.getEmail()				);
			_cliente.setTelegram			( _origem.getTelegram()				);
			_cliente.setFranquia			( _origem.getFranquia()				);
			_cliente.setIdCliente			( _origem.getId()					);
			_cliente.setIdColaborador		( lColaborador 						);
//			_cliente.atualize				( conn 								);
		}

		long lCodigo					=	Long.parseLong( txtContrato );
		CADContratoNovo _contrato		=	new CADContratoNovo( lCodigo, conn );
		if ( ! txtAcao.equals("incluir") )
		{
			_cliente					=	_contrato.getCliente();
		}
//		_contrato.setIdCliente(lCliente);
		_contrato.setIdColaborador(lColaborador);
		_contrato.setMeses(UTLUtils.getStringToInt(txtMes));
		_contrato.setValorInvestido(UTLUtils.getStringToDouble(txtValor));
		_contrato.setPercentualInvestido(UTLUtils.getStringToDouble(txtPercInv) / 100);
		_contrato.setPercentualComissao(UTLUtils.getStringToDouble(txtPercClb) / 100);
	 	_contrato.setFranquia(UTLUtils.getStringToInt(txtFranquia));
		_contrato.setDataPagamento(UTLUtils.converteData(txtDataPag));
		
		if ( txtAcao.equals("aprovar") )
		{
			if ( iAcesso == CADColaborador.CADASTRO_FRANQUIA || iAcesso == CADColaborador.CADASTRO_CONSULTA )
			{
				_cliente.setSituacao	( CADClienteNovo.SITUACAO_FINANCEIRO_DOCUMENTO );  // Aprovado 1o. nivel, enviado para o financeiro
				_contrato.setSituacao	( CADClienteNovo.SITUACAO_FINANCEIRO_DOCUMENTO );  // Aprovado 1o. nivel, enviado para o financeiro
			}
			if ( iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
			{
				_cliente.setSituacao	( CADClienteNovo.SITUACAO_APROVADO );  // Aprovado 2o. nivel, enviado para o sistema
				_contrato.setSituacao	( CADClienteNovo.SITUACAO_APROVADO );  // Aprovado 2o. nivel, enviado para o sistema
			}
		}

		try
		{
			_cliente.atualize( conn );
			
			_contrato.setIdCliente(_cliente.getId());
			_contrato.atualize( conn );
			
			lCliente					=	_cliente.getId();
			strMensagem					=	"Registro atualizado com sucesso!";
			
			if ( _cliente.getSituacao() ==  CADClienteNovo.SITUACAO_APROVADO )
			{
//				_cliente.atualize( conn );
				
				boolean bAtualizar		=	true;
				CADCliente _novo		=	null;
				
				if ( _cliente.getIdCliente() > 0 )
				{
					_novo				=	new CADCliente( _cliente.getIdCliente(), conn );
				}
				else
				{
					_novo				=	new CADCliente( 0, 0L, _cliente.getCpf(), 0, 0, 0, 0, conn );
					if ( _novo.next() )
					{
						bAtualizar		=	false;
					}
				}
//					_novo.setId						( 0L								);
				_novo.setCarteira				( _cliente.getCarteira() 			);
				_novo.setCpf					( _cliente.getCpf()					);
				_novo.setNome					( _cliente.getNome()				);
				_novo.setIdentidade				( _cliente.getIdentidade()			);
				_novo.setEndereco				( _cliente.getEndereco()			);
				_novo.setCep					( _cliente.getCep())				;
				_novo.setPix					( _cliente.getPix()					);
				_novo.setEnderecoCarteira		( _cliente.getEnderecoCarteira()	);
				_novo.setEnderecoAlternativo	( _cliente.getEnderecoAlternativo()	);
				_novo.setBanco					( _cliente.getBanco()				);
				_novo.setAgencia				( _cliente.getAgencia()				);
				_novo.setContaCorrente			( _cliente.getContaCorrente()		);
				_novo.setFavorecido				( _cliente.getFavorecido()			);
				_novo.setEmail					( _cliente.getEmail()				);
				_novo.setTelegram				( _cliente.getTelegram()			);
				_novo.setFranquia				( _cliente.getFranquia()			);
				
				if ( bAtualizar )
				{
					_novo.atualize				( conn 								);
				}

				CADContrato _cntN				=	new CADContrato();
				_cntN.setIdCliente				(_novo.getId()						);
				_cntN.setIdColaborador			(_contrato.getIdColaborador()		);
				_cntN.setMeses					(_contrato.getMeses()				);
				_cntN.setValorInvestido			(_contrato.getValorInvestido()		);
				_cntN.setPercentualInvestido	(_contrato.getPercentualInvestido()	);
				_cntN.setPercentualComissao		(_contrato.getPercentualComissao()	);
				_cntN.setFranquia				(_contrato.getFranquia()			);
				_cntN.setDataPagamento			(_contrato.getDataPagamento()		);
				_cntN.atualize					( conn 								);
				
				Calendar cDta					=	_contrato.getDataPagamento();
				int iDia						=	cDta.get(Calendar.DAY_OF_MONTH);
				CADClientePagamento 	_pgCli	=	new CADClientePagamento();
				CADColaboradorPagamento _pgClb	=	new CADColaboradorPagamento();
				BigDecimal bInv					=	new BigDecimal(_contrato.getMoedaValor());
				BigDecimal bCms					=	new BigDecimal(_contrato.getMoedaValor());
				bInv							=	bInv.multiply(new BigDecimal(_contrato.getPercentualInvestido()));
				bCms							=	bCms.multiply(new BigDecimal(_contrato.getPercentualComissao()));

				BigDecimal bInvBrl				=	new BigDecimal(_contrato.getValorInvestido());
				BigDecimal bCmsBrl				=	new BigDecimal(_contrato.getValorInvestido());
				bInvBrl							=	bInv.multiply(new BigDecimal(_contrato.getPercentualInvestido()));
				bCmsBrl							=	bCms.multiply(new BigDecimal(_contrato.getPercentualComissao()));
				for (int i=0; i<_contrato.getMeses(); i++)
				{
					cDta.add(Calendar.MONTH, 1);
					if ( cDta.get(Calendar.DAY_OF_MONTH) < iDia)
					{
						cDta.add(Calendar.DAY_OF_MONTH, 1);

						if ( cDta.get(Calendar.DAY_OF_MONTH) == 1)
						{
							cDta.add(Calendar.DAY_OF_MONTH, -1);
						}
					}
					_pgCli.setId				(0L									);
					_pgCli.setIdContrato		(_cntN.getId()						);
					_pgCli.setIdCliente			(_cntN.getIdCliente()				);
					_pgCli.setDataVencimento	(cDta								);
					_pgCli.setFranquia			(_cntN.getFranquia()				);
					_pgCli.setValorPagamento	(bInv.doubleValue()					);
					_pgCli.atualize				(conn								);
					if ( _cntN.getIdColaborador() > 0 )
					{
						_pgClb.setId			(0L									);
						_pgClb.setIdContrato	(_cntN.getId()						);
						_pgClb.setIdColaborador	(_cntN.getIdColaborador()			);
						_pgClb.setDataVencimento(cDta								);
						_pgClb.setFranquia		(_cntN.getFranquia()				);
						_pgClb.setValorPagamento(bCms.doubleValue()					);
						_pgClb.atualize			(conn								);
					}
				}
				CADContratoArquivoNovo _arqN	=	new CADContratoArquivoNovo( _contrato.getId(), 1, conn );
				CADContratoArquivo _arq			=	new CADContratoArquivo();
				while ( _arqN.next() )
				{
					_arq.setId					(0L									);
					_arq.setIdContrato			(_cntN.getId()						);
					_arq.setNomeArquivo			(_arqN.getNomeArquivo()				);
					_arq.setExtensaoArquivo		(_arqN.getExtensaoArquivo()			);
					_arq.setObservacao			(_arqN.getObservacao()				);
					_arq.setDataUpload			(_arqN.getDataUpload()				);
					_arq.setPath			    (_arqN.getPath()					);
					_arq.atualize				(conn 								);
				}

				strMensagem				=	"Registro incluido no sistema com sucesso!";

				//// e-Mail de aviso
				String txtFromEmail		=	"Elysium Portal<suporte@servicosespecializados.com.br>";
				String[] arrToEmail		=	new String[1];
				arrToEmail[0]			=	txtFromEmail;
				String[] arrCCEMail		=	null;
				String[] arrBCCEMail	=	null;
				String	txtAssunto		=	"Contrato novo ||| " + lCodigo;
				System.out.println( txtAssunto );
				String[] files			=	null;
				String	strProps		=	dir_base + "/Intranet/inf/prp/Mailinf.props";
				UTLMail mail 			=	new UTLMail(dir_base);
				mail.postMail(txtFromEmail, arrToEmail, arrCCEMail, arrBCCEMail, txtAssunto, txtAssunto, txtAssunto, strProps, files);
				////

				//// Envio JSon
				CADContratoSendJson _json	=	new CADContratoSendJson();
				_cntN						=	new CADContrato(_cntN.getId() , conn);
				_json.setIdContrato			( _cntN.getId()						);
				_json.setCarteiraTitulo		( _novo.getCarteiraTitulo()			);
				_json.setEnderecoCarteira   ( _novo.getEnderecoCarteira()       );
				_json.setCep				( _novo.getCep()					);
				_json.setDataContrato		( _cntN.getDataPagamento()		);
				_json.setEmail				( _novo.getEmail()					);
				_json.setEndereco			( _novo.getEndereco()				);
				_json.setNome				( _novo.getNome()					);
				_json.setDocumento			( _novo.getCpf()					);
				_json.setMeses				( _cntN.getMeses()				);
				_json.setTaxaObjetivo		( _cntN.getPercentualInvestido());
				_json.setValorContrato		( _cntN.getMoedaValor()				);
				System.out.println("json: " + _json.toString());
				_json.post("https://elysiumaccept.herokuapp.com/contratos");
				if ( _json.getStatusCode() != 200 )
				{
					arrToEmail			=	new String[2];
					arrToEmail[0]		=	"Suporte Infinity<suporte@servicosespecializados.com.br>";
					arrToEmail[1]		=	"Igor<suporte@servicosespecializados.com.br>";
					txtAssunto			=	"Falha envio JSon";
					String txtConteudo	=	"Status: " + _json.getStatusCode() + ", " + _json.getReason() + "\n\n" + _json.toString();
					mail.postMail(txtFromEmail, arrToEmail, arrCCEMail, arrBCCEMail, txtAssunto, txtConteudo, txtConteudo, strProps, files);
				}
				System.out.println("json: " + _json.toString() + ", Status: " + _json.getStatusCode());
				////
			}
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
//		lColaborador					=	0;
		txtDataPag						=	UTLUtils.getDia(Calendar.getInstance());
	}
	String sBr2							=	"&nbsp;";
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
	}

	strMensagem							=	strMensagem.replace('\'','?').replace('\n',' ');
	UTLCombo franquia					=	new CADFranquia().getCombo();
	UTLCombo meses						=	new UTLCombo("6|6 meses,12|12 meses,18|18 meses,24|24 meses,30|30 meses,36|36 meses,48|48 meses,60|60 meses");

	
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
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
<link type="text/css" href="css/calendar-win2k-cold-2.css" rel="stylesheet" media="all" title="win2k-cold-2" />
<script type="text/javascript" src="inc/js/calendar-js.js"></script>
<script type="text/javascript" src="inc/js/calendar-br.js"></script>
<script type="text/javascript" src="inc/js/calendar-setup.js"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
			if ( document.form1.txtAcao.value == "incluir" && confirm("Deseja incluir os comprovantes agora?") == true ) {
				Submeter("Ca");
			} else {
				Submeter("V");
			}
			return;
		}
	}
    Calendar.setup({ inputField : "txtDataPag", ifFormat : "dd/mm/y", button : "imgDataCadastro", align : "Bl", singleClick :true });

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if ( document.form1.txtContrato.value == "" || document.form1.txtContrato.value == "0" ) {
		document.form1.txtCliente.focus();
	} else {
		document.form1.txtMes.focus();
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
	if (acao == "S") {
		document.form1.action="frmMenu.jsp";
	}
	if (acao == "V") {
		if ( document.form1.txtAcao.value == "exibir" || document.form1.txtAcao.value == "modificar" ) {
			document.form1.txtAcao.value = "";
		    document.form1.txtAcao.value = "cnsCli";
			document.form1.action="frmCntCnsN.jsp";
		} /* else {
			if ( document.form1.txtOrigem.value == "" ) {
				document.form1.txtAcao.value = "";
				document.form1.action="frmCntCnsN.jsp";
			} else {
				document.form1.txtAcao.value = "modificar";
				document.form1.action = document.form1.txtOrigem.value;
			}
		} */
	}
	if (acao == "A" || acao == "Ap") {
		if ( document.form1.txtCliente.selectedIndex < 1 ) {
			alert("Falta selecionar o investidor!");
			document.form1.txtCliente.focus();
			return;
		}
		if ( document.form1.txtFranquia.selectedIndex < 1 ) {
			alert("Falta selecionar a franquia!");
			document.form1.txtFranquia.focus();
			return;
		}
		if ( valor( document.form1.txtValor.value ) == 0 ) {
			alert("Falta informar o valor investidor!");
			document.form1.txtValor.focus();
			return;
		}
		if ( valor( document.form1.txtPercInv.value ) == 0 ) {
			alert("Falta informar o percentual do Investidor!");
			document.form1.txtPercInv.focus();
			return;
		}
		if ( valor( document.form1.txtPercClb.value ) > 2 ) {
			alert("Verifique o percentual do coordenador!");
			document.form1.txtPercClb.focus();
			return;
		}
		if ( document.form1.txtContrato.value != "" && document.form1.txtContrato.value != "0" ) {
			if ( valor(document.form1.txtAltVal.value) != (document.form1.txtValor.value) ) {
				if ( document.form1.txtAlt.value == "N" ) {
					alert("N\343o pode alterar o valor do contrato!\n\nJ\341 houve pagamento!");
					document.form1.txtValor.select();
					document.form1.txtValor.focus();
					return;
				} else {
					document.form1.txtCalc.value = "S";
				}
			}
			if ( document.form1.txtAltDta.value != document.form1.txtDataPag.value ) {
				if ( document.form1.txtAlt.value == "N" ) {
					alert("N\343o pode alterar a data do contrato!\n\nJ\341 houve pagamento!");
					document.form1.txtDataPag.select();
					document.form1.txtDataPag.focus();
					return;
				} else {
					document.form1.txtCalc.value = "S";
				}
			}
			if ( document.form1.txtAltPrz.value != document.form1.txtMes[document.form1.txtMes.selectedIndex].value ) {
				if ( document.form1.txtAlt.value == "N" ) {
					alert("N\343o pode alterar o prazo do contrato!\n\nJ\341 houve pagamento!");
					document.form1.txtMes.focus();
					return;
				} else {
					document.form1.txtCalc.value = "S";
				}
			}
		}
		if ( document.form1.txtContrato.value == "" || document.form1.txtContrato.value == "0" ) {
			if ( confirm("Confirma a inclus\343o do Contrato?\n\n" + document.form1.txtMes[document.form1.txtMes.selectedIndex].text + " meses, em " + document.form1.txtDataPag.value + "\nNo valor de " + document.form1.txtValor.value+"\n\nTaxa: " + document.form1.txtPercInv.value + "\nComiss�o: " + document.form1.txtPercClb.value) == true ) {
				document.form1.txtAcao.value = "incluir";
			} else {
				return;
			}
		} else {
			if ( acao == "Ap" ) {
				if ( confirm("Confirma a aprova\347\343o do CONTRATO?") != true ) return;
				document.form1.txtAcao.value = "aprovar";
			} else {
				if ( confirm("Confirma a Altera\347\343o do Contrato?\n\n" + document.form1.txtMes[document.form1.txtMes.selectedIndex].text + " meses, em " + document.form1.txtDataPag.value + "\nNo valor de " + document.form1.txtValor.value+"\n\nTaxa: " + document.form1.txtPercInv.value + "\nComiss�o: " + document.form1.txtPercClb.value) == true ) {
					document.form1.txtAcao.value = "atualizar";
				} else {
					return;
				}
			}
		}
//		document.form1.txtOrigem.value="frmCntCadN.jsp";
		document.form1.action="frmCntCadN.jsp";
	}
	if (acao == "Cp") {
		document.form1.action="frmCtaCnsN.jsp";
	}
	if (acao == "Ca") {
		document.form1.txtAcao.value = "novo";
		document.form1.action="frmCtaCadN.jsp";
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
    <div class="d-flex row flex-nowrap m-0 p-0 h-auto w-auto">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto">
<%@ include file="inc/incSideBar.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form w-100">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="98%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"         id="sWhidt"       value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"      value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"      value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"     value="<%=txtBusca%>">
						<input type="hidden" name="txtSss"         id="txtSss"       value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"       value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"       value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"         id="txtFrq"       value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"       value="<%=txtOwn%>">
						<input type="hidden" name="txtAlt"         id="txtAlt"       value="<%=(bAlterar ? "S" : "N")%>">
						<input type="hidden" name="txtAltCalc"     id="txtCalc"      value="N">
						<input type="hidden" name="txtAltDta"      id="txtAltDta"    value="<%=txtDataPag%>">
						<input type="hidden" name="txtAltVal"      id="txtAltVal"    value="<%=txtValor%>">
						<input type="hidden" name="txtAltPrz"      id="txtAltPrz"    value="<%=txtMes%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"    value="frmCntCadN.jsp">
<!-- --------------------------------------------------------------Pagina��o: Inicio Parte 2 de 5 -->
						<input type="hidden" name="txtRegistros"   id="txtRegistros" value="<%=intRegistros%>">
						<input type="hidden" name="txtPagina"      id="txtPagina"    value="<%=intPagina%>">
						<input type="hidden" name="txtTotal"       id="txtTotal"     value="<%=intTotal%>">
<!-- --------------------------------------------------------------Pagina��o: Fim Parte 1 de 5 -->
						<tr>
							<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="80%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan=2" valign="top">CONTRATO NOVO CADASTRO</td></tr>
						<tr height="32">
							<td>N&uacute;mero:</td>
							<td>
								<div class="grupo-coluna">
								<div class="grupo-coluna-l">
								<input class="form-control shadow-sm col-lg-5" type="text" name="txtContrato" id="txtContrato" size="4" maxlength="4" style="text-align: center;background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtContrato%>" onkeydown="javascript: return false;">
								</div>
								<%=txtBtnArq%>
								</div>
							</td>
						</tr>
						<tr height="32" >
							<td>Investidor:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtCliente" id="txtCliente" _style="width:280px; background-color: #f0f8ff" ths="1" prv="20" nxt="2" onkeydown="javascript: return verTab(event);">
									<option value="0"> -- selecione o investidor --- </option>
<%
	long lClb							=	lColaborador;
	if ( txtAcao.equals("novo") )
	{
		CADCliente _cliente				=	new CADCliente(0, lColaborador, "", 0, 0, 0, 0, conn);
		while ( _cliente.next() )
		{
			out.write("<option value='" + _cliente.getId() + "'>");
			out.write(_cliente.getNome());
			out.write("</option>\n");
		}
	}
	else
	{
		CADClienteNovo _cliente			=	new CADClienteNovo(-1, lColaborador, 0L, "", 0, 0, 0, 0, conn);
		while ( _cliente.next() )
		{
			out.write("<option value='" + _cliente.getId() );
			if ( _cliente.getId() == lCliente )
			{
				out.write("' selected>");
			}
			else
			{
				out.write("'>");
			}
			out.write(_cliente.getNome());
			out.write("</option>\n");
		}
	}
%>
								</select>
							</td>
						</tr>
						<tr height="32">
							<td>Coordenador:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtColaborador" id="txtColaborador" _style="background-color: #f0f8ff" ths="2" prv="1" nxt="3" onkeydown="javascript: return verTab(event);">



									<option value="0">SEM COORDENADOR</option>
<%
//	CADColaborador _colaborador			=	new CADColaborador( CADColaborador.BUSCA_CADASTRO, intFranquia, "", 0, 0, 0, 0, conn );
	CADColaborador _colaborador			=	new CADColaborador( lColaborador, conn );
	_colaborador.start();
	while ( _colaborador.next() )
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
			out.write("-- contrato sem colaborador --");
		}
		else
		{
			out.write(_colaborador.getNome());
		}
		out.write("</option>\n");
	}
%>
								</select>
							</td>
						</tr>
						<tr height="32">
							<td>Prazo:</td>
							<td><%=meses.getCombo("txtMes", "class=\"form-control shadow-sm col-lg-3\" ths=\"3\" prv=\"2\" nxt=\"4\" onkeydown=\"javascript: verTab(event);\" ", txtMes)%></td>
						</tr>
						<tr height="32">
							<td>Valor investido:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtValor" id="txtValor" size="12" maxlength="12" ths="4" prv="3" nxt="5" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtValor%>" onkeydown="javascript:return verNN(event, document.form1.txtMes, document.form1.txtPercInv);" onkeyup="javascript:verVV(this, 2, 7);"></td>
						</tr>
						<tr height="32">
							<td>% Investidor:</td>
							<td><input class="form-control shadow-sm col-lg-2" type="text" name="txtPercInv" id="txtPercInv" size="3" maxlength="2" ths="5" prv="4" nxt="6" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtPercInv%>" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr height="32">
							<td>% Coordenador:</td>
							<td><input class="form-control shadow-sm col-lg-2" type="text" name="txtPercClb" id="txtPercClb" size="3" maxlength="2" ths="6" prv="5" nxt="7" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtPercClb%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr height="32">
							<td>Franquia:</td>
							<td><%=franquia.getCombo("txtFranquia", "class=\"form-control shadow-sm col-lg-5\" ths=\"7\" prv=\"6\" nxt=\"8\" onkeydown=\"javascript: verTab(event);\" ", txtFranquia)%></td>
						</tr>
						<tr height="32">
							<td>Data contrato:</td>
							<td>
								<div class="grupo-coluna">
								<div class="grupo-coluna-l">
								<input title="data de pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" class="form-control shadow-sm col-lg-6" type="text" value="<%=txtDataPag%>" ths="8" prv="7" nxt="20" id="txtDataPag" name="txtDataPag" onblur="javascript: if (this.value != '') { check_date(this);}" onkeydown="javascript:return verTab(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10">&nbsp;
								</div>
								<div class="grupo-coluna-r">
								<img src="img/calendario.gif" border="0" style="cursor: pointer;" id="imgDataCadastro" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;">
								</div>
								</div>
							</td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
<%
	if ( (iAcesso == CADColaborador.CADASTRO_FINANCEIRO || iAcesso == CADColaborador.CADASTRO_FRANQUIA || iAcesso == CADColaborador.CADASTRO_CONSULTA ) )
	{
		if ( iSituacao == CADClienteNovo.SITUACAO_COODENADO_APROVANDO || iSituacao == CADClienteNovo.SITUACAO_FINANCEIRO_APROVANDO )
		{
%>
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('Ap');" value="Aprovar" ths="23" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									<br><br>
<%
		}
	}
%>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	if ( iAcesso == CADColaborador.CADASTRO_EXECUTIVO || iAcesso == CADColaborador.CADASTRO_ADMINISTRADOR || iAcesso == CADColaborador.CADASTRO_FRANQUIA )
	{
		if ( ! txtAcao.equals("exibir") )
		{
%>
									&nbsp;&nbsp;
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="<%=strBtn%>" ths="20" prv="12" nxt="21" onkeydown="javascript: return verTab(event);">
<%
		}
	}
%>
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
var vv = false;		// 	Indica v�rgula do ponto decimal;
var dd = false;		// 	Indica preenchimento das cadas decimais
var tt = false;		//	Indica preenchimento das casas n�o decimais
var xx = false;
function verNN(e, p, n) {
	var e=(typeof event!='undefined')?window.event:e;	// IE : Moz 
	if(e.keyCode==27) {
		tmp = document.form1.txtBuscaProduto.value;
		limpa();
		document.form1.txtBuscaProduto.value = tmp;
		document.form1.txtBuscaProduto.select();
		document.form1.txtBuscaProduto.focus();
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
<script src="inc/js/jquery.js"></script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
