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
	boolean bExcluir					=	false;
	String	txtBtnArq					=	"";
	int		iAcesso						=	Integer.parseInt(txtAss);

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}

	int		intRegistros				=	UTLUtils.getStringToInt( request.getParameter("txtRegistros") ) ;
	int		intPagina					=	UTLUtils.getStringToInt( request.getParameter("txtPagina") ) ;
	int		intTotal					=	UTLUtils.getStringToInt( request.getParameter("txtTotal") ) ;
	String	txtPais						=	UTLUtils.getStringToString( request.getParameter("txtPais") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtContrato					=	UTLUtils.getStringToString( request.getParameter("txtContrato") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	String	txtCpf						=	UTLUtils.getStringToString( request.getParameter("txtCpf") );
	String	txtNomCli					=	UTLUtils.getStringToString( request.getParameter("txtNomCli") );
	String	txtIdt						=	UTLUtils.getStringToString( request.getParameter("txtIdt") );
	String 	txtEnd						=	UTLUtils.getStringToString( request.getParameter("txtEnd") );
	String	txtCep						=	UTLUtils.getStringToString( request.getParameter("txtCep") );
	String	txtPix						=	UTLUtils.getStringToString( request.getParameter("txtPix") );
	String	txtEnc						=	UTLUtils.getStringToString( request.getParameter("txtEnc") );
	String	txtCal						=	UTLUtils.getStringToString( request.getParameter("txtCal") );
	String	txtBnc						=	UTLUtils.getStringToString( request.getParameter("txtBnc") );
	String	txtAgn						=	UTLUtils.getStringToString( request.getParameter("txtAgn") );
	String	txtCta						=	UTLUtils.getStringToString( request.getParameter("txtCta") );
	String	txtFav						=	UTLUtils.getStringToString( request.getParameter("txtFav") );
	String	txtTlg						=	UTLUtils.getStringToString( request.getParameter("txtTlg") );
	String	txtEml						=	UTLUtils.getStringToString( request.getParameter("txtEml") );
	String	txtClb						=	UTLUtils.getStringToString( request.getParameter("txtClb") );
	String	txtMotivo					=	UTLUtils.getStringToString( request.getParameter("txtMotivo") );
	String	txtReprovado				=	UTLUtils.getStringToString( request.getParameter("txtReprovado") );
	String	txtLido						=	UTLUtils.getStringToString( request.getParameter("txtLido") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	String 	txtIdOrigem					=	UTLUtils.getStringToString( request.getParameter("txtIdOrigem") );

	String	txtMes						=	UTLUtils.getStringToString( request.getParameter("txtMes") );
        
	String	txtValor					=	UTLUtils.getStringToString( request.getParameter("txtValor") );
	String	txtPercInv					=	UTLUtils.getStringToString( request.getParameter("txtPercInv") );
	String	txtPercClb					=	UTLUtils.getStringToString( request.getParameter("txtPercClb") );
        
	String	txtDataPag					=	UTLUtils.getStringToString( request.getParameter("txtDataPag") );
	String	txtTaxa						=	UTLUtils.getStringToString( request.getParameter("txtTaxa") );
	String	txtInfTax					=	UTLUtils.getStringToString( request.getParameter("txtInfTax") );
	String	txtDtaIni					=	UTLUtils.getStringToString( request.getParameter("txtDtaIni") );
        
	String	txtCmpPercInv				=	UTLUtils.getStringToString( request.getParameter("txtCmpPercInv") );
	String	txtCmpPercClb				=	UTLUtils.getStringToString( request.getParameter("txtCmpPercClb") );

	String	txtDlrData					=	UTLUtils.getStringToString( request.getParameter("txtDlrData") );
	String	txtDlrBase					=	UTLUtils.getStringToString( request.getParameter("txtDlrBase") );
	String	txtDlrValor					=	UTLUtils.getStringToString( request.getParameter("txtDlrValor") );
	String	txtDolar					=	UTLUtils.getStringToString( request.getParameter("txtDolar") );
//	BigDecimal bdValor					=	null;

	String  txtIcoDoc					=	UTLUtils.getBranco();
	long 	lColaborador				=	0L;
	boolean bAprovar					=	false;
	
	if ( txtPais.trim().length() == 0 )
	{
		txtPais							=	"0124";		//	Sele��o default pa�s 0124 = BRASIL
	}
	long lPais							=	UTLUtils.getStringToLong( txtPais );
	
	if ( txtPercInv.trim().length() == 0 )
	{
		txtPercInv						=	"10";
	}
	if ( txtPercClb.trim().length() == 0 )
	{
		txtPercClb						=	"2";
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA || Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
		if ( lColaborador == 0 )
		{
			lColaborador				=	Integer.parseInt(txtUid);
		}
		if ( txtClb.trim().length() == 0 )
		{
			CADColaborador _clb			=	new CADColaborador(lColaborador, conn);
			txtClb						=	_clb.getNome();
		}
	}
	if ( txtAcao.equals("novo") )
	{
		txtDataPag						=	UTLUtils.getDia(Calendar.getInstance());
	}

	if ( txtFranquia.trim().length() == 0 )
	{
		txtFranquia						=	txtFrq;
	}
	String	strBtn						=	"Incluir";
	String	strMensagem					=	UTLUtils.getBranco();
	String	btnContratos				=	UTLUtils.getBranco();
	long 	lCodigo						=	Long.parseLong( txtCliente );
	long 	lContrato					=	0L;
	if ( txtContrato.length() > 0 )
	{
		lContrato						=	Long.parseLong( txtContrato );
	}

	if ( txtAcao.equals("modificar") )
	{
		CADClienteNovo _cliente			=	new CADClienteNovo( lCodigo, conn );
		txtCrt							=	_cliente.getCarteira() + "";
		txtCpf							=	_cliente.getCpf();
		txtNomCli						=	_cliente.getNome();
		txtIdt							=	_cliente.getIdentidade();
		txtEnd							=	_cliente.getEndereco();
		txtCep							=	_cliente.getCep();
		txtPix							=	_cliente.getPix();
		txtEnc							=	_cliente.getEnderecoCarteira();
		txtCal							=	_cliente.getEnderecoAlternativo();
		txtBnc							=	_cliente.getBanco();
		txtAgn							=	_cliente.getAgencia();
		txtCta							=	_cliente.getContaCorrente();
		txtFav							=	_cliente.getFavorecido();
		txtEml							=	_cliente.getEmail();
		txtTlg							=	_cliente.getTelegram();
	 	txtFranquia						=	_cliente.getIdFranquia() + "";
		txtReprovado					=	_cliente.isReprovado() ? "S" : "N";
		txtMotivo						=	_cliente.getObservacao();
		txtLido							=	_cliente.isVisto() ? "S" : "N";
		txtPais							=	_cliente.getIdPais() + "";
		lPais							=	_cliente.getIdPais();
		strBtn							=	"Atualizar";
		bExcluir						=	true;

		if ( iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
		{
			CADColaborador _clb			=	new CADColaborador(_cliente.getIdColaborador(), conn);
			txtClb						=	_clb.getNome();
		}

		CADContratoNovo _contrato		=	null;
		if ( lContrato > 0 )
		{
			_contrato					=	new CADContratoNovo( lContrato, conn );
		}
		else
		{
			if ( _cliente.getSituacao() == CADColaborador.CADASTRO_FINANCEIRO )
			{
				lColaborador			=	-1;
			}
			_contrato				=	new CADContratoNovo( 0, lCodigo, lColaborador, null, 0, 0, 0, 0, conn );
			_contrato.next();
		}
		lContrato						=	_contrato.getId();
		txtContrato						=	_contrato.getId() + "";
		txtMes							=	_contrato.getMeses() + "";
		txtValor						=	UTLUtils.getValor(_contrato.getValorInvestido());
		txtDlrValor						=	UTLUtils.getValor(_contrato.getMoedaValor());
		txtDlrData						=	UTLUtils.getDia(_contrato.getDolar().getDataBase());
		txtDolar						=	_contrato.getIdMoeda() + "";
		txtPercInv						=	((int)(_contrato.getPercentualInvestido() * 100)) + "";
		txtPercClb						=	((int)(_contrato.getPercentualComissao() * 100)) + "";
		txtDataPag						=	UTLUtils.getDia(_contrato.getDataPagamento());
		txtTaxa							=	String.valueOf(_contrato.getIdTaxa());
		txtInfTax						=	_contrato.isTaxaInformada() ? "S" : "N";
		txtCmpPercInv					=	String.valueOf(_contrato.getTaxa().getRemuneracaoObjetivo());
		txtCmpPercClb					=	String.valueOf(_contrato.getTaxa().getComissaoObjetivo());
		if ( _contrato.getIdTaxa() > 0 )
		{
			txtDtaIni					=	UTLUtils.getDia(_contrato.getTaxa().getDataInicio());
		}
//		bdValor							=	new BigDecimal(_contrato.getValorInvestido());
		txtBtnArq						=	"<div class=\"grupo-coluna-r_\"><input class=\"btn btn-dark btn-custom2\" onclick=\"javascript: Submeter('Cp');\" type=\"button\" name=\"btnArq\" id=\"btnArq\" value=\"Documentos\"></div>";
		if ( (iAcesso == CADColaborador.CADASTRO_FINANCEIRO || iAcesso == CADColaborador.CADASTRO_FRANQUIA || iAcesso == CADColaborador.CADASTRO_CONSULTA ) && lCodigo > 0 )
		{
			if ( _cliente.getSituacao() == CADClienteNovo.SITUACAO_COODENADOR_APROVANDO || _cliente.getSituacao() == CADClienteNovo.SITUACAO_FINANCEIRO_APROVANDO )
			{
				bAprovar				=	true;
				txtIcoDoc				=	"<img src=\"img/tick.png\" width=\"16\" height=\"16\" alt=\"Todos documentos aprovados\">";
			}
			else
			{
				txtIcoDoc				=	"<img src=\"img/icone_processo.gif\" width=\"16\" height=\"16\" alt=\"Existem documentos para serem aprovados\">";
			}
		}
	}
	if ( txtAcao.equals("excluir") )
	{
		CADClienteNovo _cliente			=	new CADClienteNovo( lCodigo, conn );
		try
		{
			CADContratoNovo _contrato	=	_cliente.getContrato();
			CADContratoArquivoNovo _arq	=	new CADContratoArquivoNovo( _contrato.getId(), 0, conn );
			while ( _arq.next() )
			{
				_arq.delete(conn);
			}
			_contrato.delete(conn);
			_cliente.delete(conn);
				strMensagem				=	"Registro excluido com sucesso!";
			}
			catch (SQLException e)
			{
				strMensagem 			= 	"Erro na atualiza\u00E7\u00E3o: " + e;
		}
	}

	if ( txtAcao.equals("reprovar") )
	{
		CADClienteNovo _cliente			=	new CADClienteNovo( lCodigo, conn );
		_cliente.setSituacao				( CADClienteNovo.SITUACAO_COODENADOR_DOCUMENTO 	);  // Retorno ao n�vel de aprova��o de documento do Coordenador
		_cliente.setObservacao				( txtMotivo										);
		_cliente.setVisto 					( false   										);
		_cliente.setReprovado				( true   										);

		CADContratoNovo _contrato		=	new CADContratoNovo( lContrato, conn );
		_contrato.setSituacao				( CADClienteNovo.SITUACAO_COODENADOR_DOCUMENTO );  // Retorno ao n�vel de aprova��o de documento do Coordenador
//		Calendar cNull					=	null;
		try
		{
			_cliente.atualize( conn );
			_contrato.atualize( conn );
			CADContratoArquivoNovo _arquivo	=	new CADContratoArquivoNovo( lContrato, 0, conn );
			while ( _arquivo.next() )
			{
				_arquivo.setDataVisto		( null );
				_arquivo.setDataAprovado	( null );
				_arquivo.atualize			( conn );
			}
			strMensagem 				= 	"Contrato enviado para an�lise do Coordenador!";
			
		}
		catch (SQLException e)
		{
			strMensagem 				= 	"Erro na reprova\u00E7\u00E3o: " + e;
		}
	}

	if ( txtAcao.equals("incluir") || txtAcao.equals("atualizar") || txtAcao.equals("aprovar") )
	{
		CADClienteNovo _cliente			=	new CADClienteNovo( lCodigo, conn );
		if ( iAcesso == CADColaborador.CADASTRO_FRANQUIA || iAcesso == CADColaborador.CADASTRO_CONSULTA )
		{
			if ( _cliente.getSituacao() != CADClienteNovo.SITUACAO_COODENADOR_APROVANDO )
			{
				_cliente.setSituacao	(CADClienteNovo.SITUACAO_COODENADOR_DOCUMENTO );
			}
		}
		_cliente.setCarteira			(UTLUtils.getStringToInt(txtCrt) 		);
		if ( iAcesso != CADColaborador.CADASTRO_FINANCEIRO )
		{
			_cliente.setIdColaborador	(lColaborador							);
		}
		_cliente.setCpf					(txtCpf									);
		_cliente.setNome				(txtNomCli								);
		_cliente.setIdentidade			(txtIdt									);
		_cliente.setEndereco			(txtEnd									);
		_cliente.setCep					(txtCep									);
		_cliente.setPix					(txtPix									);
		_cliente.setEnderecoCarteira	(txtEnc									);
		_cliente.setEnderecoAlternativo	(txtCal									);
		_cliente.setBanco				(txtBnc									);
		_cliente.setAgencia				(txtAgn									);
		_cliente.setContaCorrente		(txtCta									);
		_cliente.setFavorecido			(txtFav									);
		_cliente.setEmail				(txtEml									);
		_cliente.setTelegram			(txtTlg									);
		_cliente.setIdFranquia			(UTLUtils.getStringToLong(txtFranquia)	);
		_cliente.setIdCliente			(UTLUtils.getStringToLong(txtIdOrigem)	);
		_cliente.setIdPais				(UTLUtils.getStringToLong(txtPais)		);

		CADContratoNovo _contrato		=	new CADContratoNovo( lContrato, conn );
		if ( iAcesso != CADColaborador.CADASTRO_FINANCEIRO )
		{
			_contrato.setIdColaborador	(lColaborador							);
		}
		_contrato.setMeses				(UTLUtils.getStringToInt(txtMes)		);
		_contrato.setValorInvestido		(UTLUtils.getStringToDouble(txtValor)	);
		_contrato.setMoedaValor			(UTLUtils.getStringToDouble(txtDlrValor));
		_contrato.setIdMoeda			(UTLUtils.getStringToLong(txtDolar)	    );
		_contrato.setPercentualInvestido(UTLUtils.getStringToDouble(txtPercInv) / 100);
		_contrato.setPercentualComissao	(UTLUtils.getStringToDouble(txtPercClb) / 100);
		_contrato.setIdFranquia			(UTLUtils.getStringToLong(txtFranquia)	);
		_contrato.setDataPagamento		(UTLUtils.converteData(txtDataPag)		);
		_contrato.setIdTaxa				(UTLUtils.getStringToLong(txtTaxa)		);
		_contrato.setTaxaInformada		(UTLUtils.getStringToBoolean(txtInfTax)	);

		if ( txtAcao.equals("aprovar") )
		{
			if ( iAcesso == CADColaborador.CADASTRO_FRANQUIA || iAcesso == CADColaborador.CADASTRO_CONSULTA )
			{
				_cliente.setSituacao	(CADClienteNovo.SITUACAO_FINANCEIRO_DOCUMENTO );  // Aprovado 1o. nivel, enviado para o financeiro
				_contrato.setSituacao	(CADClienteNovo.SITUACAO_FINANCEIRO_DOCUMENTO );  // Aprovado 1o. nivel, enviado para o financeiro
			}
			if ( iAcesso == CADColaborador.CADASTRO_FINANCEIRO )
			{
				_cliente.setSituacao	(CADClienteNovo.SITUACAO_APROVADO 		);  // Aprovado 2o. nivel, enviado para o sistema
				_contrato.setSituacao	(CADClienteNovo.SITUACAO_APROVADO 		);  // Aprovado 2o. nivel, enviado para o sistema
			}
		}
		try
		{
			_cliente.atualize( conn );
//			System.out.println("frmCliCadN: (atualize) txtIdOrigem:" + txtIdOrigem + ", getIdCliente: " + _cliente.getIdCliente() + ", cliente.getSituacao: " + _cliente.getSituacao());
			lCodigo								=	_cliente.getId();
			_contrato.setIdCliente				( lCodigo								);
			_contrato.atualize( conn );
			lContrato							=	_contrato.getId();
			txtCliente							=	lCodigo + "";
			txtContrato							=	lContrato + "";
			strMensagem							=	"Registro atualizado com sucesso!";
			if ( _cliente.getSituacao() ==  CADClienteNovo.SITUACAO_FINANCEIRO_DOCUMENTO )
			{
				CADContratoArquivoNovo _arquivo	=	new CADContratoArquivoNovo( lContrato, 0, conn );
				while ( _arquivo.next() )
				{
					_arquivo.setDataAprovado	( null );
					_arquivo.atualize			( conn );
				}
			}
			if ( _cliente.getSituacao() ==  CADClienteNovo.SITUACAO_APROVADO )
			{
				CADCliente _novo				=	null;
				if ( _cliente.getIdCliente() > 0 )
				{
					_novo						=	new CADCliente(_cliente.getIdCliente(), conn);
				}
				else
				{
					_novo						=	new CADCliente(0, 0L, _cliente.getCpf(), 0, 0, 0, 0, conn);
					_novo.next();
				}
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
				_novo.setIdFranquia				( _cliente.getIdFranquia()			);
				_novo.setIdPais					( _cliente.getIdPais()				);
				_novo.atualize					( conn 								);

				CADContrato _cntN				=	new CADContrato();
				_cntN.setIdCliente				(_novo.getId()						);
				_cntN.setIdColaborador			(_contrato.getIdColaborador()		);
				_cntN.setMeses					(_contrato.getMeses()				);
				_cntN.setValorInvestido			(_contrato.getValorInvestido()		);
				_cntN.setPercentualInvestido	(_contrato.getPercentualInvestido()	);
				_cntN.setPercentualComissao		(_contrato.getPercentualComissao()	);
				_cntN.setIdMoeda		        (_contrato.getIdMoeda()	            );
				_cntN.setMoedaValor		        (_contrato.getMoedaValor()	        );
				_cntN.setIdFranquia				(_contrato.getIdFranquia()			);
				_cntN.setDataPagamento			(_contrato.getDataPagamento()		);
				_cntN.setIdTaxa					(_contrato.getIdTaxa()				);
				_cntN.setTaxaInformada			(_contrato.isTaxaInformada()		);
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
					_pgCli.setIdFranquia		(_cntN.getIdFranquia()				);
					_pgCli.setValorPagamento	(bInvBrl.doubleValue()				);
					_pgCli.setValorMoeda	    (bInv.doubleValue()					);
					_pgCli.setIdMoeda           (_cntN.getIdMoeda()	            	);
					_pgCli.atualize				(conn								);
					if ( _cntN.getIdColaborador() > 0 )
					{
						_pgClb.setId			(0L									);
						_pgClb.setIdContrato	(_cntN.getId()						);
						_pgClb.setIdColaborador	(_cntN.getIdColaborador()			);
						_pgClb.setDataVencimento(cDta								);
						_pgClb.setIdFranquia	(_cntN.getIdFranquia()				);
						_pgClb.setValorPagamento(bCmsBrl.doubleValue()				);
						_pgClb.setValorMoeda    (bCms.doubleValue()					);
						_pgClb.setIdMoeda       (_cntN.getIdMoeda()	            	);
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

				strMensagem						=	"Registro incluido no sistema com sucesso!";

				//// e-Mail de aviso
				String txtFromEmail		=	"PortalInfinity<suporte@servicosespecializados.com.br>";
				String[] arrToEmail		=	new String[1];
				arrToEmail[0]			=	txtFromEmail;
				String[] arrCCEMail		=	null;
				String[] arrBCCEMail	=	null;
				String	txtAssunto		=	"Contrato novo || " + lCodigo;
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

	String sBr2							=	"&nbsp;&nbsp;&nbsp;";
	int 	iWhidt						=	Integer.parseInt(sWhidt);
	if ( iWhidt < 500 )
	{
		sBr2							=	"<br><br>";
	}
/*
	if ( txtAcao.equals("novo") || txtAcao.equals("modificar") && txtDlrBase.trim().length() == 0 )
	{
		Calendar cDtaIni				=	Calendar.getInstance();
		cDtaIni.add(Calendar.DATE, -4);
		Calendar cDtaFin				=	Calendar.getInstance();
		CADDolar _dolar					=	new CADDolar( cDtaIni, cDtaFin, 1, conn );
		if ( _dolar.next() )
		{
			txtDlrData					=	UTLUtils.getDia(_dolar.getDataBase());
			txtDlrBase					=	_dolar.getValor() + "";
			if ( bdValor == null || bdValor.doubleValue() == 0 )
			{
				txtDlrValor				=	UTLUtils.getValor(_dolar.getValor());
			}
			else
			{
				bdValor					=	bdValor.divide(new BigDecimal(_dolar.getValor()), RoundingMode.HALF_UP);
				txtDlrValor				=	UTLUtils.getValor(bdValor.doubleValue());
			}
		}
		else
		{
			txtDlrData					=	"00/00/0000";
			txtDlrBase					=	"1.0";
			txtDlrValor					=	"0,00";
		}
	}
*/
	strMensagem							=	strMensagem.replace('\'','�').replace('\n',' ');
        
	UTLCombo acesso						=	new UTLCombo(CADColaborador.CADASTRO);
	UTLCombo carteira					=	new UTLCombo(CADColaborador.CARTEIRA);
//	UTLCombo franquia					=	new CADFranquia().getCombo();
	CADFranquias _franquias				=	new CADFranquias( 0L, true, 0, conn );
	UTLCombo franquia					=	_franquias.getCombo();
//	UTLCombo meses						=	new UTLCombo("6|6 meses,12|12 meses,18|18 meses,24|24 meses,30|30 meses,36|36 meses");
	UTLCombo meses						=	new UTLCombo("24|24 meses,36|36 meses,48|48 meses");
       

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
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/javascript" src="inc/js/jquery.js"></script>
    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script-->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
    <script type="text/javascript" src="inc/js/solid.js"></script>
    <script type="text/javascript" src="inc/js/fontawesome.js"></script>
<link type="text/css" href="css/calendar-win2k-cold-2.css" rel="stylesheet" media="all" title="win2k-cold-2" />
<script type="text/javascript" src="inc/js/calendar-js.js"></script>
<script type="text/javascript" src="inc/js/calendar-br.js"></script>
<script type="text/javascript" src="inc/js/calendar-setup.js"></script>
<script type="text/javascript" src="inc/js/net.js"></script>
<script type="text/javascript" src="inc/cad/CADCpf.js"></script>
<script type="text/javascript" src="inc/cad/CADDlr.js"></script>
<script type="text/javascript" src="inc/cad/CADTax.js"></script>
<script type="text/Javascript">
strAviso = "<%=strMensagem%>";

function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
			if ( document.form1.txtAcao.value == "incluir" && confirm("Deseja incluir os DOCUMENTOS/COMPROVANTES agora?") == true ) {
				Submeter("Ca");
			} else {
				Submeter("V");
			}
			return;
		}
		if (strAviso == "Registro incluido no sistema com sucesso!" || strAviso == "Contrato enviado para an\341lise do Coordenador!") {
			Submeter("V");
			return;
		}
		
		if (strAviso == "Registro excluido com sucesso!") {
			if ( confirm("Deseja incluir um novo CONTRATO agora?") != true ) {
				Submeter("V");
				return;
			}
		}
	}

    Calendar.setup({ inputField : "txtDataPag", ifFormat : "dd/mm/y", button : "imgDataCadastro", align : "Bl", singleClick :true, atualizar : findDolar });
	

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	if (document.form1.txtCpf.value!="") {
		docto = "CPF";
		if ( document.form1.txtPais[document.form1.txtPais.selectedIndex].value != 124 ) {
			docto = "Passport";
		} else {
			document.form1.txtCpf.value = Formatar(document.form1.txtCpf.value);
		}
		document.getElementById('cabDoc').innerText = docto;
	}
	if ( document.form1.txtAcao.value == "modificar" ) {
		if ( document.form1.txtAss.value == "<%=CADColaborador.CADASTRO_CONSULTA%>" || document.form1.txtAss.value == "<%=CADColaborador.CADASTRO_FRANQUIA%>" ) {
			document.form1.txtAtual.style.backgroundColor = "#e6e6e6";
			document.form1.txtAtual.onfocus = OnFocus;
		}
		else
		{
			document.form1.txtCpf.style.backgroundColor = "#e6e6e6";
			document.form1.txtCpf.onfocus = OnFocus;
		}
	}
	
	if ( document.form1.txtReprovado.value == "S" && document.form1.txtLido.value == "N" ) {
		showAvisoRepovacao();
	} else {
		if ( document.form1.txtAprovar.value == "S" ) {
			document.form1.btnAprovar.focus();
		} else {
			if ( document.form1.txtCliente.value == "" || document.form1.txtCliente.value == "0" ) {
				document.form1.txtCpf.focus();
			} else {
				document.form1.txtNomCli.focus();
			}
		}
	}
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "V") {
		document.form1.txtAcao.value = "consultar";
		document.form1.action = "frmCliCnsN.jsp";
	}
	if (acao == "Cp") {
		document.form1.txtAcao.value="consultar";
		document.form1.action="frmCtaCnsN.jsp";
	}
	if (acao == "Ct") {
		document.form1.txtAcao.value="consultar";
		document.form1.action="frmCntCnsN.jsp";
	}
	if (acao == "E") {
		if ( confirm("Confirma a EXCLUS\303O do registro?") != true ) {
			return;
		}
		document.form1.txtAcao.value="excluir";
	}
	if (acao == "A" || acao == "Ap") {
		if (CampoVazio(document.form1.txtCpf.value)) {
			alert("Falta informar o CPF!");
			document.form1.txtCpf.focus();
			return;
		} else {
			document.form1.txtCpf.value = Limpa(form1.txtCpf);
		}
		if (CampoVazio(document.form1.txtNomCli.value)) {
			alert("Falta informar o nome!");
			document.form1.txtNomCli.focus();
			return;
		}
		if (CampoVazio(document.form1.txtIdt.value)) {
			alert("Falta informar a identidade!");
			document.form1.txtIdt.focus();
			return;
		}
		if (CampoVazio(document.form1.txtEnd.value)) {
			alert("Falta informar o endere\347o!");
			document.form1.txtEnd.focus();
			return;
		}
		if ( document.form1.txtCrt.selectedIndex == 0 ) {
			alert("Falta informar/selecionar a carteira!");
			document.form1.txtCrt.focus();
			return;
		}
		if ( parseInt(document.form1.txtFranquia[document.form1.txtFranquia.selectedIndex].value) == 0 ) {
			alert("Falta selecionar a franquia!");
			document.form1.txtFranquia.focus();
			return;
		}
		if (CampoVazio(document.form1.txtEnc.value)) {
			alert("Falta informar o endere\347o da carteira!");
			document.form1.txtEnc.focus();
			return;
		}
		if (CampoVazio(document.form1.txtEml.value)) {
			alert("Falta informar o e-Mail!");
			document.form1.txtEml.focus();
			return;
		}
		if ( valor( document.form1.txtDlrValor.value ) == 0 ) {
			alert("Falta informar o valor investido!");
			document.form1.txtDlrValor.focus();
			return;
		}
		if ( valor( document.form1.txtPercInv.value ) == 0 ) {
			alert("Falta informar o percentual do Investidor!");
			document.form1.txtPercInv.focus();
			return;
		}
		if ( valor( document.form1.txtPercClb.value ) > 2 ) {
			alert("Verifique o percentual do Coordenador!");
			document.form1.txtPercClb.select();
			document.form1.txtPercClb.focus();
			return;
		}
		if ( valor( document.form1.txtPercInv.value ) > 10 ) {
			alert("Verifique o percentual do Investodor!");
			document.form1.txtPercInv.select();
			document.form1.txtPercInv.focus();
			return;
		}
		if ( document.form1.txtCliente.value == "" || document.form1.txtCliente.value == "0" ) {
			document.form1.txtAcao.value = "incluir";
		} else {
			if ( acao == "Ap" ) {
				if ( confirm("Confirma a aprova\347\343o do Cadastro e Contrato?") != true ) return;
				document.form1.txtAcao.value = "aprovar";
			} else {
				document.form1.txtAcao.value = "atualizar";
			}
		}
		document.form1.action="frmCliCadN.jsp";
	}
	if (acao == "R" ) {
		if ( CampoVazio(document.getElementById('txtObs').value) ) {
			alert("Precisa preencher o motivo da Reprova\347\343o!");
			document.getElementById('txtObs').focus();
			return;
		}
		if ( confirm("Confirma a REPROVA\307\303O do Cadastro e Contrato?") != true ) return;
		document.form1.txtMotivo.value = document.getElementById('txtObs').value;
		document.form1.txtAcao.value = "reprovar";
	}
	if (acao == "Ca") {
		document.form1.txtAcao.value = "novo";
		document.form1.action="frmCtaCadN.jsp";
	}
	varSubmit = true;
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

function valor(a) {
	pt = /\./g;
	b = "0";
	if (a.length > 0) {
		b = a.replace(pt, "").replace(",", ".");
	}
	r = parseFloat(b)
	return r;
}
function changeDocument() {
	document.form1.txtCpf.value = "";
	document.form1.txtCpf.style.backgroundColor = "#fff";
	document.form1.txtAtual.style.backgroundColor = "#fff";
	document.form1.txtAtual.selectedIndex = -1;
	document.form1.txtNomCli.value = "";
	document.form1.txtNomCli.style.backgroundColor = "#fff";
	document.form1.txtIdt.value = "";
	document.form1.txtIdt.style.backgroundColor = "#fff";
	document.form1.txtEnd.value = "";
	document.form1.txtEnd.style.backgroundColor = "#fff";
	document.form1.txtCep.value = "";
	document.form1.txtCep.style.backgroundColor = "#fff";
	document.form1.txtCrt.value = "0";
	document.form1.txtCrt.style.backgroundColor = "#fff";
	document.form1.txtEnc.value = "";
	document.form1.txtEnc.style.backgroundColor = "#fff";
	document.form1.txtCal.value = "";
	document.form1.txtCal.style.backgroundColor = "#fff";
	document.form1.txtPix.value = "";
	document.form1.txtPix.style.backgroundColor = "#fff";
	document.form1.txtBnc.value = "";
	document.form1.txtBnc.style.backgroundColor = "#fff";
	document.form1.txtAgn.value = "";
	document.form1.txtAgn.style.backgroundColor = "#fff";
	document.form1.txtCta.value = "";
	document.form1.txtCta.style.backgroundColor = "#fff";
	document.form1.txtFav.value = "";
	document.form1.txtFav.style.backgroundColor = "#fff";
	document.form1.txtTlg.value = "";
	document.form1.txtTlg.style.backgroundColor = "#fff";
	document.form1.txtEml.value = "";
	document.form1.txtEml.style.backgroundColor = "#fff";
	docto = "CPF";
	if ( document.form1.txtPais[document.form1.txtPais.selectedIndex].value != 124 ) {
		docto = "Passport";
	}
	document.getElementById('cabDoc').innerText = docto;
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
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center" _bgcolor="#DBDCDC">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="98%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"         id="sWhidt"        value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"        id="sHeight"       value="<%=sHeight%>">
						<input type="hidden" name="txtAcao"        id="txtAcao"       value="<%=txtAcao%>">
						<input type="hidden" name="txtBusca"       id="txtBusca"      value="<%=txtBusca%>">
						<input type="hidden" name="txtSss"         id="txtSss"        value="<%=txtSss%>">
						<input type="hidden" name="txtAss"         id="txtAss"        value="<%=txtAss%>">
						<input type="hidden" name="txtUid"         id="txtUid"        value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"         id="txtFrq"        value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"         id="txtOwn"        value="<%=txtOwn%>">
						<input type="hidden" name="txtCliente"     id="txtCliente"    value="<%=txtCliente%>">
						<input type="hidden" name="txtContrato"    id="txtContrato"   value="<%=txtContrato%>">
						<input type="hidden" name="txtMotivo"      id="txtMotivo"     value="<%=txtMotivo%>">
						<input type="hidden" name="txtReprovado"   id="txtReprovado"  value="<%=txtReprovado%>">
						<input type="hidden" name="txtLido"        id="txtLido"       value="<%=txtLido%>">
						<input type="hidden" name="txtDolar"       id="txtDolar"      value="<%=txtDolar%>">
						<input type="hidden" name="txtDlrBase"     id="txtDlrBase"    value="<%=txtDlrBase%>">
						<input type="hidden" name="txtTaxa"        id="txtTaxa"       value="<%=txtTaxa%>">
						<input type="hidden" name="txtOrigem"      id="txtOrigem"     value="frmCliCadN.jsp">
						<input type="hidden" name="txtExiste"      id="txtExiste"     value="N">
						<input type="hidden" name="txtIdOrigem"    id="txtIdOrigem"   value="0">
						<input type="hidden" name="txtAprovar"     id="txtAprovar"    value="<%=(bAprovar ? "S" : "N")%>">

						<input type="hidden" name="txtCmpPercInv"  id="txtCmpPercInv" value="<%=txtCmpPercInv%>">
						<input type="hidden" name="txtCmpPercClb"  id="txtCmpPercClb" value="<%=txtCmpPercClb%>">
						<tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="30"><td colspan=2" valign="top">CONTRATO NOVO CADASTRO</td></tr>
						<tr class="cabAcesso" height="26">
							<td>Nacionalidade:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtPais" id="txtPais" _style="width:280px; background-color: #f0f8ff" ths="1" prv="20" nxt="2" onkeydown="javascript: return verTab(event);" onchange="javascript: changeDocument();">
									<option value="0"> -- selecione o pa&iacute;s --- </option>
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
						<tr class="cabAcesso" height="26">
							<td><span name="cabDoc" id="cabDoc">CPF</span>:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtCpf" id="txtCpf" size="14" maxlength="11" ths="2" prv="1" nxt="3" value="<%=txtCpf%>" onkeydown="javascript: return numeroValido(event);" onfocus="javascript: this.value = Limpa(this); this.select();" onblur="javascript: ValidarCGCCPF(0);"></td>
						</tr>
<%
	if ( (Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA) || (Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA) )
	{
%>						
						<tr class="cabAcesso" height="26">
							<td>Cliente:</td>
							<td>
								<select class="form-control shadow-sm col-lg-12" name="txtAtual" id="txtAtual" tabindex="-1" onchange="javascript: if ( this.selectedIndex > 0 ) ValidarCGCCPF(this[this.selectedIndex].value);">
<%
		if ( txtAcao.equals("novo") )
		{
			out.write("<option value=\"0\"> -- selecione o investidor de um de seus clientes -- </option>\n");
			CADCliente _cliente			=	new CADCliente(0, lColaborador, "", 0, 0, 0, 0, conn);
			while ( _cliente.next() )
			{
				out.write("<option value='" + _cliente.getId() + "'>");
				out.write(_cliente.getNome());
				out.write("</option>\n");
			}
		}
%>
								</select>
							</td>
						</tr>
<%
	}
%>
						<tr class="cabAcesso" height="26">
							<td>Nome:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtNomCli" id="txtNomCli" size="50" maxlength="60" ths="3" prv="2" nxt="4" onfocus="javascript: this.select();" value="<%=txtNomCli%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Identidade:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="text" name="txtIdt" id="txtIdt" size="18" maxlength="18" ths="4" prv="3" nxt="5" onfocus="javascript: this.select();" value="<%=txtIdt%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Endere&ccedil;o:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEnd" id="txtEnd" size="50" maxlength="90" ths="5" prv="4" nxt="6" onfocus="javascript: this.select();" value="<%=txtEnd%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>CEP:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" name="txtCep" id="txtCep" size="8" maxlength="8"  ths="6" prv="5" nxt="7" onfocus="javascript: this.select();" value="<%=txtCep%>" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr height="32">
							<td>Franquia:</td>
							<td><%=franquia.getCombo("txtFranquia", "class=\"form-control shadow-sm col-lg-5\" ths=\"7\" prv=\"6\" nxt=\"8\" onchange=\"javascript: buscarTaxa();\" onkeydown=\"javascript: verTab(event);\" ", txtFranquia)%></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Carteira:</td>
							<td><%=carteira.getCombo("txtCrt", "class=\"form-control shadow-sm\" ths=\"8\" prv=\"7\" nxt=\"9\" onkeydown=\"javascript: verTab(event);\" ", txtCrt)%></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>End.Carteira:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEnc" id="txtEnc" size="50" maxlength="50" ths="9" prv="8" nxt="10" onfocus="javascript: this.select();" value="<%=txtEnc%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>E.Alternativo:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtCal" id="txtCal" size="50" maxlength="50" ths="10" prv="9" nxt="11" onfocus="javascript: this.select();" value="<%=txtCal%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Chave PIX:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtPix" id="txtPix" size="50" maxlength="50" ths="11" prv="10" nxt="12" onfocus="javascript: this.select();" value="<%=txtPix%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Banco:</td>
							<td><input class="form-control shadow-sm col-lg-4" type="text" name="txtBnc" id="txtBnc" size="15" maxlength="12" ths="12" prv="11" nxt="13" onfocus="javascript: this.select();" value="<%=txtBnc%>" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Ag&ecirc;ncia:</td>
							<td><input class="form-control shadow-sm col-lg-3" type="text" name="txtAgn" id="txtAgn" size="5" maxlength="5" ths="13" prv="12" nxt="14" value="<%=txtAgn%>" onfocus="javascript: this.select();" onkeydown="javascript: return numeroValido(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Conta:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtCta" id="txtCta" size="20" maxlength="20" ths="14" prv="13" nxt="15" value="<%=txtCta%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Favorecido:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtFav" id="txtFav" size="50" maxlength="60" ths="15" prv="14" nxt="16" value="<%=txtFav%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>Telegram:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtTlg" id="txtTlg" size="50" maxlength="60" ths="16" prv="15" nxt="17" value="<%=txtTlg%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr class="cabAcesso" height="26">
							<td>e-Mail:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtEml" id="txtEml" size="50" maxlength="60" ths="17" prv="16" nxt="20" value="<%=txtEml%>" onfocus="javascript: this.select();" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr height="5"><td colspan="2">&nbsp;</td></tr>
						<tr class="cabAcesso" height="26">
							<td>Coordenador:</td>
							<td><input class="form-control shadow-sm" type="text" name="txtClb" id="txtClb" size="50" maxlength="60" tabindex="-1" value="<%=txtClb%>" style="font-weight: bold; background-color: #ffffdc;" onfocus="javascript: this.blur();"></td>
						</tr>
						<tr height="5"><td colspan="2">&nbsp;</td></tr>
						<tr height="32">
							<td>Prazo:</td>
							<td>
								<div class="grupo-coluna">
								<div class="grupo-coluna-l">
								<%=meses.getCombo("txtMes", "class=\"form-control shadow-sm col-lg-6\" _ths=\"0\" _prv=\"0\" _nxt=\"0\" onkeydown=\"javascript: verTab(event);\" ", txtMes)%>
								</div>
								<table border="0" cellpadding="0" cellspacing="0" wifth="100%">
								<tr><td width="80"><%=txtBtnArq%></td><td>&nbsp;&nbsp;&nbsp;</td><td><%=txtIcoDoc%></td></tr>
								</table>
								</div>
							</td>
						</tr>
						<tr height="32">
							<td>Valor invest.:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="26%" align="right"><input class="form-control shadow-sm col-lg-12" type="text" name="txtDlrValor" id="txtDlrValor" size="10" maxlength="12" ths="20" prv="17" nxt="23" style="text-align: right;" onfocus="javascript: this.select();" value="<%=txtDlrValor%>" onkeydown="javascript:return verNN(event, document.form1.txtMes, document.form1.txtPercInv);" onkeyup="javascript:verVV(this, 2, 7);" onblur="javascript: findDolar();"></td>
									<td width="3%">USD</td>
									<td width="24%" align="center">Dt.Cot.<input class="form-control shadow-sm col-lg-9" type="text" name="txtDlrData" id="txtDlrData" size="8" maxlength="2" tabindex="-1" style="text-align: right; background-color: #e6e6e6;" onfocus="javascript: this.blur();" value="<%=txtDlrData%>"></td>
									<td width="25%" align="right"><input class="form-control shadow-sm col-lg-11" type="text" name="txtValor" id="txtValor" size="6" maxlength="2" tabindex="-1" style="text-align: right;" onfocus="javascript: this.blur();" value="<%=txtValor%>"></td>
									<td width="3%">BRL</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="32">
							<td>% Investidor:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="30%"><input class="form-control shadow-sm col-lg-6" type="text" name="txtPercInv" id="txtPercInv" size="3" maxlength="6" style="background-color: #ECECEC; text-align: right;" onfocus="javascript: this.blur();" value="<%=txtPercInv%>"></td>
									<td width="30%"><!--Data taxa:--> </td>
									<td width="40%"><!--input class="form-control shadow-sm col-lg-7" type="text" name="txtDtaIni" id="txtDtaIni" size="6" onfocus="javascript: this.blur();" style="background-color: #e6e6e6;" value="<%=txtDtaIni%>"--></td>
								</tr>
								</table>
								<!--input class="form-control shadow-sm col-lg-2" bgcolor="#e6e6e6" type="text" name="txtPercInv" id="txtPercInv" size="3" tabindex="-1" maxlength="2" style="text-align: right;" onfocus="javascript: this.blur();" value="<=txtPercInv>" onkeydown="javascript: return numeroValido(event);"-->
							</td>
						</tr>
						<tr height="32">
							<td>% Comiss&atilde;o:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="30%"><input class="form-control shadow-sm col-lg-6" type="text" name="txtPercClb" id="txtPercClb" size="3" maxlength="3" style="background-color: #ECECEC; text-align: right;" onfocus="javascript: this.blur();" value="<%=txtPercClb%>"></td>
									<td width="30%"><!--Taxas informadas: --></td>
									<td width="40%">
										<!--div class="form-check">
											<input class="form-check-input" type="checkbox" name="txtInfTax" id="txtInfTax" <%=(txtInfTax.equals("S") ? "checked" : " ")%>  onfocus="javascript: this.blur();" value="S">
											<label class="form-check-label" for="txtInfTax">Sim</label>
										</div-->
									</td>
								</tr>
								</table>
								<!--input class="form-control shadow-sm col-lg-2" bgcolor="#e6e6e6" type="text" name="txtPercClb" id="txtPercClb" size="3" tabindex="-1" maxlength="2" style="text-align: right;" onfocus="javascript: this.blur();" value="<=txtPercClb>" onkeydown="javascript: return verTab(event);"-->
							</td>
						</tr>
						<tr height="32">
							<td>Data contrato:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="30%"><input title="data de pagamento do contrato" onfocus="javascript: window.status=this.title; this.select();" class="form-control shadow-sm col-lg-11" type="text" value="<%=txtDataPag%>" ths="8" prv="7" nxt="20" id="txtDataPag" name="txtDataPag" onblur="javascript: if (this.value != '') { if ( check_date(this)) findDolar();}" _onchange="javascript: if ( this.value.length() == 10 ) { findDolar(); }" onkeydown="javascript:return verTab(event);" onkeyup="javascript:formataData(event, this);" size="11" maxlength="10"></td>
									<td width="10%"><img src="img/calendario.gif" border="0" style="cursor: pointer;" id="imgDataCadastro" alt="data de pagamento do contrato" align="absmiddle" onMouseOver="javascript: window.status='Data de pagamento do contrato';return true;" onMouseOut="javascript: window.status='';return true;"></td>
									<td width="60%">&nbsp;</td>
								</tr>
								</table>
							</td>
						</tr>

						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									
<%
	if ( bAprovar )
	{
%>
									<br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAprovar" id="btnAprovar" onclick="javascript: Submeter('Ap');" value="Aprovar" ths="23" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									<br><br>
<%
	}
%>
									<input class="btn btn-dark btn-custom" type="button" name="btnVolta" id="btnVolta" onclick="javascript: Submeter('V');" value="Voltar" ths="21" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
									&nbsp;
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" id="btnAcao" onclick="javascript: Submeter('A');" value="<%=strBtn%>" ths="20" prv="12" nxt="21" onkeydown="javascript: return verTab(event);">
									<%=btnContratos%>
<%
	if ( (Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA || Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA ) && bExcluir )
	{
%>
									<br><br>
									<input class="btn btn-dark btn-custom" type="button" name="btnAcao" onclick="javascript: Submeter('E');" value="Excluir" ths="23" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>
									<br><br>
									<input class="btn btn-dark btn-custom" type="button" name="btnRep" onclick="javascript: loadReprovacao();" value="Reprovar" ths="23" prv="20" nxt="22" onkeydown="javascript: return verTab(event);">
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
				</tr>
				</table>
			</div>
			<!--/div-->
			<div class="col-sm text-center"></div>
        </div>
    </div>

<div id="divDisplayReprovacao" style="display:none; position:absolute; top:100px; left:200px; z-index:900;">
	<div class="panel-form">
		<table border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td background="img/_shadow-top.gif" width="10" height="10"><img src="img/_shadow-left-top-2.gif" width="10" height="10"></td>
			<td background="img/_shadow-top.gif" height="10" class="linhaTop" align="left"><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
			<td background="img/_shadow-right-top.gif"  width="10" height="10"><img src="img/_shadow-right-top-2.gif" width="10" height="10"></td>
		</tr>
		<tr>
			<td width="10" background="img/_shadow-left.gif" valign="top"><img src="img/_shadow-left-top.gif" width="10" height="10" border="0" alt=""></td>
			<td>
				<table border=0 align="center" cellspacing=0 cellpadding=0 bgcolor=#f2f2f2 width=440>
				<tr><td colspan=3 width=1 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td></tr>
				<tr>
					<td width=1 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
					<td align="center">
						<table border=0 cellspacing=0 cellpadding=0>
						<tr>
							<td width=423 align="center" _class="titform">MOTIVO DA REPROVA&Ccedil;&Atilde;O DO CONTRATO/CADASTRO</td>
							<td width=17><a href="/" onclick="javascript: BoxDisplayReprovacao.showHide(); return false;"><img src="img/SetaExit.gif" width=13 height=13 border=0 alt="fechar"></a></td>
						</tr>
						</table>
					</td>
					<td width=1 bgcolor=#444444 nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
				</tr>
				<tr><td colspan=3 bgcolor=#333333 nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
				<tr><td colspan=3 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
				<tr><td width=1 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
					<td align="center">
						<table border="0" cellspacing="0" cellpadding="0" width="438">
						<tr>
							<td width="5"><img src="img/trans1x1.gif" width=5 height=4 border=0 alt=""></td>
							<td width="100"><img src="img/trans1x1.gif" width=100 height=4 border=0 alt=""></td>
							<td width="333"><img src="img/trans1x1.gif" width=333 height=4 border=0 alt=""></td>
						</tr>
						<tr class="linha">
							<td><img src="img/trans1x1.gif" width=5 height=5 border=0 alt=""></td>
							<td colspan=2>
								<textarea class="input" name="txtObs" id="txtObs" rows="5" onfocus="javascript: displayLivre(document.getElementById('divExtensao'), this, 250);" onkeyup="javascript: return textCounter(document.getElementById('divExtensao'), this, 250);" style="width: 420;"></textarea>
								<span style="font-size:70%;">Livre para escrever: </span><span style="font-size:80%; position:static;" id="divExtensao" class="linha">250</span>
							</td>
						</tr>
						<tr><td colspan=3><img src="img/trans1x1.gif" height=4 border=0 alt=""></td></tr>
						<tr><td colspan=3 bgcolor=#333333 nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
						<tr><td colspan=3 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
						<tr><td colspan=3><img src="img/trans1x1.gif" height=7 border=0 alt=""></td></tr>
						<tr>
							<td colspan=3 align="center">
								<input type="button" class="btn btn-dark btn-custom3" name="btnRepSair" id="btnRepSair" onclick="javascript: BoxDisplayReprovacao.showHide();" value="Fechar">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-dark btn-custom3" onclick="javascript: document.getElementById('txtObs').value='';document.getElementById('txtObs').focus();" value="Limpar">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-dark btn-custom3" onclick="javascript: Submeter('R');" value="Reprovar">
							</td>
						</tr>
						<tr><td colspan=3><img src="img/trans1x1.gif" width=1 height=7 border=0 alt=""></td></tr>
						</table>
					</td>
					<td width=1 bgcolor=#44444 nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
				</tr>
				<tr><td colspan=3 width=1 bgcolor=#333333 nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td></tr>
				</table>
			</td>
			<td width="10" background="img/_shadow-right.gif" valign="top"><img src="img/_shadow-right-top.gif" width="10" height="10" border="0" alt=""></td>
		</tr>
		<tr>
			<td width="10" height="10"><img src="img/_shadow-bottom-left.gif" width="10" height="10" border="0" alt=""></td>
			<td height="10" background="img/_shadow-bottom.gif" align="right"><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
			<td width="10" height="10"><img src="img/_shadow-bottom-right.gif" width="10" height="10" border="0" alt=""></td>
		</tr>
		</table>
	</div>
</div>

<div id="divDisplayAviso" style="display:none; position:absolute; top:100px; left:200px; z-index:900;">
	<div class="panel-form">
		<table border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td background="img/_shadow-top.gif" width="10" height="10"><img src="img/_shadow-left-top-2.gif" width="10" height="10"></td>
			<td background="img/_shadow-top.gif" height="10" class="linhaTop" align="left"><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
			<td background="img/_shadow-right-top.gif"  width="10" height="10"><img src="img/_shadow-right-top-2.gif" width="10" height="10"></td>
		</tr>
		<tr>
			<td width="10" background="img/_shadow-left.gif" valign="top"><img src="img/_shadow-left-top.gif" width="10" height="10" border="0" alt=""></td>
			<td>
				<table border=0 align="center" cellspacing=0 cellpadding=0 bgcolor=#f2f2f2 width=500>
				<tr><td colspan=3 width=1 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td></tr>
				<tr>
					<td width=1 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
					<td align="center">
						<table border=0 cellspacing=0 cellpadding=0>
						<tr>
							<td width=483 align="center" _class="titform">MOTIVO DA REPROVA&Ccedil;&Atilde;O DO CONTRATO/CADASTRO</td>
							<td width=17><a href="/" onclick="javascript: BoxDisplayAviso.showHide(); return false;"><img src="img/SetaExit.gif" width=13 height=13 border=0 alt="fechar"></a></td>
						</tr>
						</table>
					</td>
					<td width=1 bgcolor=#444444 nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
				</tr>
				<tr><td colspan=3 bgcolor=#333333 nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
				<tr><td colspan=3 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
				<tr><td width=1 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
					<td align="center">
						<table border="0" cellspacing="0" cellpadding="0" width="498">
						<tr>
							<td width="5"><img src="img/trans1x1.gif" width=5 height=4 border=0 alt=""></td>
							<td width="100"><img src="img/trans1x1.gif" width=100 height=4 border=0 alt=""></td>
							<td width="333"><img src="img/trans1x1.gif" width=333 height=4 border=0 alt=""></td>
						</tr>
						<tr class="linha">
							<td><img src="img/trans1x1.gif" width=5 height=5 border=0 alt=""></td>
							<td colspan=2 align="center"><textarea class="input" name="txtAvs" id="txtAvs" rows="5" onfocus="javascript: this.blur();" style="width: 470;"><%=txtMotivo%></textarea></td>
						</tr>
						<tr><td colspan=3><img src="img/trans1x1.gif" height=4 border=0 alt=""></td></tr>
						<tr><td colspan=3 bgcolor=#333333 nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
						<tr><td colspan=3 bgcolor=#ffffff nowrap><img src="img/trans1x1.gif" height=1 border=0 alt=""></td></tr>
						<tr><td colspan=3><img src="img/trans1x1.gif" height=7 border=0 alt=""></td></tr>
						<tr>
							<td colspan=3 align="center">
								<input type="button" class="btn btn-dark btn-custom" name="btnAvsSair" id="btnAvsSair" onclick="javascript: BoxDisplayAviso.showHide();" value="Fechar">
								&nbsp;&nbsp;
								<input type="button" class="btn btn-dark btn-custom" name="btnAvsLido" id="btnAvsLido" onclick="javascript: marcarLido();" value="Lido">
							</td>
						</tr>
						<tr><td colspan=3><img src="img/trans1x1.gif" width=1 height=7 border=0 alt=""></td></tr>
						</table>
					</td>
					<td width=1 bgcolor=#44444 nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
				</tr>
				<tr><td colspan=3 width=1 bgcolor=#333333 nowrap><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td></tr>
				</table>
			</td>
			<td width="10" background="img/_shadow-right.gif" valign="top"><img src="img/_shadow-right-top.gif" width="10" height="10" border="0" alt=""></td>
		</tr>
		<tr>
			<td width="10" height="10"><img src="img/_shadow-bottom-left.gif" width="10" height="10" border="0" alt=""></td>
			<td height="10" background="img/_shadow-bottom.gif" align="right"><img src="img/trans1x1.gif" width=1 height=1 border=0 alt=""></td>
			<td width="10" height="10"><img src="img/_shadow-bottom-right.gif" width="10" height="10" border="0" alt=""></td>
		</tr>
		</table>
	</div>
</div>

<script type="text/Javascript">
// -------------------------- Taxa de Remunera��o/Comiss�o do novo contrato  --------------------------------- //
function buscarTaxa() {
	if ( document.form1.txtPais.selectedIndex < 1 ) {
		alert('Falta selecionar a nacionalidade!');
		document.form1.txtPais.focus();
		return;
	}
	if ( document.form1.txtCrt.selectedIndex < 1 ) {
		alert('Falta selecionar a Franquia!');
		document.form1.txtCrt.focus();
		return;
	}
	if ( CampoVazio(document.form1.txtDataPag.value) ) {
		return;
	}
	txtCli = "0";
	txtfrq = document.form1.txtCrt[document.form1.txtCrt.selectedIndex].value;
	txtPas = document.form1.txtPais[document.form1.txtPais.selectedIndex].value;
	variaveis = "cli=" + txtCli + "&frq=" + txtfrq + "&pas=" + txtPas + "&dta=" + document.form1.txtDataPag.value;
//	prompt( "Taxa", "frmCnsTax.jsp?" + variaveis );
	loadAval = new net.ContentLoader("frmCnsTax.jsp", showTaxa, null, "POST", variaveis);
}
function showTaxa(){
	_tax = eval("new CADTax.classe(" + this.req.responseText + ")");
//	alert(this.req.responseText);
	if ( _tax.getMensagem() != "" ) {
		alert(_tax.getMensagem());
	} else {
	    document.form1.txtTaxa.value = _tax.getId();
		document.form1.txtPercInv.value = _tax.getFormRemuneracaoObjetivo();
		document.form1.txtPercClb.value = _tax.getFormComissaoObjetivo();
		document.form1.txtCmpPercInv.value = _tax.getFormRemuneracaoObjetivo();
		document.form1.txtCmpPercClb.value = _tax.getFormComissaoObjetivo();
		document.form1.txtDtaIni.value = _tax.getDataInicio();
	}
}
function verInformeTaxa(){
	if ( valor(document.form1.txtPercInv.value) != valor(document.form1.txtCmpPercClb.value) || valor(document.form1.txtPercClb.value) != valor(document.form1.txtCmpPercClb.value) ){
		document.form1.txtInfTax.checked = true;
	} else {
		document.form1.txtInfTax.checked = false;
	}
}
// -------------------------- Taxa de Remunera��o/Comiss�o do novo contrato  --------------------------------- //

// -------------------------- C�lculo do Dolar do novo contrato  --------------------------------------------- //
function findDolar() {
// Campos:
// 	data = data base para pesquisa, se igual branco, busca a data atual;
// 	dias = dias anteriores � "data", se n�o informar, busca at� 4 dias;
//  valor = valor a ser convertido
	if ( valor(document.form1.txtDlrValor.value) == 0 || CampoVazio(document.form1.txtDlrValor.value) ) {
		document.form1.txtValor.value = "0,00";
		return;
	}
	if ( CampoVazio(document.form1.txtDlrData.value) || document.form1.txtDlrData.value == "00/00/0000" ) {
		document.form1.txtDlrData.value = document.form1.txtDataPag.value;
	}
//	alert("Valor: " + document.form1.txtValor.value + "\n\n" + document.form1.txtValor.value.length + "\n\nVazio: " + CampoVazio(document.form1.txtValor.value) + "\n\nValor: " + valor(document.form1.txtValor.value) );
	cData = "";
	if ( ! CampoVazio(document.form1.txtDataPag.value) ) {
		cData = document.form1.txtDataPag.value;
	}
	cValor = document.form1.txtDlrValor.value;
	variaveis = "dta=" + cData + "&cnv=BRL&vlr=" + cValor;
//	prompt( "Dolar", "frmCnsDlr.jsp?" + variaveis );
	loadAval = new net.ContentLoader("frmCnsDlr.jsp", calcDolar, null, "POST", variaveis);
}

function calcDolar() {
//	prompt( "Dolar", this.req.responseText );
	_dlr = eval("new CADDlr.classe(" + this.req.responseText + ")");
	if ( ! _dlr.isExiste() ) {
		alert(_dlr.getMensagem());
	} else {
		alert("Calulado: " + _dlr.getUsdForm() + " = " + _dlr.getRealForm());
		document.form1.txtDolar.value = _dlr.getId();
		document.form1.txtDlrBase.value = _dlr.getValor();
		document.form1.txtDlrData.value =  _dlr.getDataBase();
		document.form1.txtDlrValor.value =  _dlr.getUsdForm();
		document.form1.txtValor.value = _dlr.getRealForm();
	}
	buscarTaxa();
}
// -------------------------- C�lculo do Dolar do novo contrato  --------------------------------------------- //

// -------------------------- Aviso do motivo da reprovacao do novo contrato  -------------------------------- //
function showAvisoRepovacao() {
	BoxDisplayAviso.showHide();
	document.getElementById('btnAvsLido').focus();
}

function marcarLido(){
	variaveis = "cli=" + document.form1.txtCliente.value + "&campo=lido&valor=S";
	document.getElementById("divBtn").style.display = "none";
	document.getElementById("divBtn").style.visibility = "hidden";
	document.getElementById("divPro").style.display = "block";
	document.getElementById("divPro").style.visibility = "visible";
	loadAval = new net.ContentLoader("frmCliCadNRep.jsp", ajustarReprovacao, null, "POST", variaveis);
}

function ajustarReprovacao() {
	mensRet = this.req.responseText;
	alert(mensRet);
	if ( mensRet == "Registro marcado como lido!" ) {
		document.form1.txtLido = "S";
	}

	BoxDisplayAviso.showHide();
	
		document.getElementById("divBtn").style.display = "block";
	document.getElementById("divBtn").style.visibility = "visible";
	document.getElementById("divPro").style.display = "none";
	document.getElementById("divPro").style.visibility = "hidden";

	document.getElementById("btnArq").focus();
}

var BoxDisplayAviso = {
	_iframe: null,
	_show: false,

	showHide: function () {
		if ( ! document.getElementById("boxHideAviso") ) {
			this._iframe = document.createElement("iframe");
			this._iframe.setAttribute("id","boxHideAviso");
			this._iframe.setAttribute("src","blank.htm");
			this._iframe.setAttribute("scrolling","no");
			this._iframe.setAttribute("frameBorder","0");
			if ( ! document.all ) {
				this._iframe.setAttribute("allowTransparency","true");
			}
			this._iframe.style.display = "none";
			this._iframe.style.position = "absolute";
			this._iframe.style.top = "0";
			this._iframe.style.left = "0";
			this._iframe.style.width = "100%";
			this._iframe.style.height = "100%";
			this._iframe.style.zIndex = "10";
			document.body.appendChild(this._iframe);
			this._show = true;
			this.setStyle(this._iframe, "opacity", "0.5");
		}
		this._iframe.style.display = (this._show) ? "block" : "none";
		if ( document.getElementById("divDisplayAviso").style.display == "none" ) {
			document.getElementById("divDisplayAviso").style.display = "block";
		} else {
			document.getElementById("divDisplayAviso").style.display = "none";
		}
		this._show = (this._show) ? false : true;
	},
	
	setStyle: function(e, p, v) {
		if ( p == 'opacity' ) {
			if (window.ActiveXObject) {
				e.style.filter = "alpha(opacity=" + v*100 + ")";
			}
			this._iframe.style.opacity = v;
		} else {
			e.style[p] = v;
		}
	}
}
// -------------------------- Aviso do motivo da reprovacao do novo contrato  -------------------------------- //

// --------------------- Tratamento do motivo da reprovacao do novo contrato  -------------------------------- //
var iTextLength = 0;
function textCounter(destino, field, maxlimit) {
	if (field.value.length > maxlimit) {
		window.event.keyCode = null;
		alert("Voc� excedeu o limite de " + maxlimit + " caracteres");
		field.value = field.value.slice(0, maxlimit);
		return false;
	}
	destino.innerText = "" + (maxlimit - field.value.length);
	iTextLength = field.value.length
	return true;
}
function displayLivre(destino, field, maxlimit) {
	destino.innerText = "" + (maxlimit - field.value.length);
}
function loadReprovacao() {
	BoxDisplayReprovacao.showHide();
	document.getElementById('txtObs').focus();
}
var BoxDisplayReprovacao = {
	_iframe: null,
	_show: false,

	showHide: function () {
		if ( ! document.getElementById("boxHideReprovacao") ) {
			this._iframe = document.createElement("iframe");
			this._iframe.setAttribute("id","boxHideReprovacao");
			this._iframe.setAttribute("src","blank.htm");
			this._iframe.setAttribute("scrolling","no");
			this._iframe.setAttribute("frameBorder","0");
			if ( ! document.all ) {
				this._iframe.setAttribute("allowTransparency","true");
			}
			this._iframe.style.display = "none";
			this._iframe.style.position = "absolute";
			this._iframe.style.top = "0";
			this._iframe.style.left = "0";
			this._iframe.style.width = "100%";
			this._iframe.style.height = "100%";
			this._iframe.style.zIndex = "10";
			document.body.appendChild(this._iframe);
			this._show = true;
			this.setStyle(this._iframe, "opacity", "0.5");
		}
		this._iframe.style.display = (this._show) ? "block" : "none";
		if ( document.getElementById("divDisplayReprovacao").style.display == "none" ) {
			document.getElementById("divDisplayReprovacao").style.display = "block";
		} else {
			document.getElementById("divDisplayReprovacao").style.display = "none";
		}
		this._show = (this._show) ? false : true;
	},
	
	setStyle: function(e, p, v) {
		if ( p == 'opacity' ) {
			if (window.ActiveXObject) {
				e.style.filter = "alpha(opacity=" + v*100 + ")";
			}
			this._iframe.style.opacity = v;
		} else {
			e.style[p] = v;
		}
	}
}
// --------------------- Tratamento do motivo da reprovacao do novo contrato  -------------------------------- //
function OnFocus(e) {
	this.blur();
}
/*
function CampoVazio(Campo) {
	r = / /g;
	s = Campo.replace(r, "");
	if (s.length == 0) {
		return true;
	} else {
		return false;
	}
}
*/
function Limpa(Campo) {
	if ( CampoVazio(Campo.value) ) return "";
	return limpaString(Campo.value);
}
function limpaString(s) {
	return s.replace("/", "").replace("-", "").replace(".", "").replace(".", "").replace(".", "").replace(",", "");
}
function ValidarCGCCPF(id) {
	if ( document.form1.txtAss.value != "<%=CADColaborador.CADASTRO_CONSULTA%>" && document.form1.txtAss.value != "<%=CADColaborador.CADASTRO_FRANQUIA%>" ) return;
//	if ( id == 0 && document.form1.txtPais[document.form1.txtPais.selectedIndex].value != 124 ) return;
	document.form1.txtCpf.style.backgroundColor = "#fff";
	document.form1.txtNomCli.value = "";
	document.form1.txtNomCli.style.backgroundColor = "#fff";
	document.form1.txtIdt.value = "";
	document.form1.txtIdt.style.backgroundColor = "#fff";
	document.form1.txtEnd.value = "";
	document.form1.txtEnd.style.backgroundColor = "#fff";
	document.form1.txtCep.value = "";
	document.form1.txtCep.style.backgroundColor = "#fff";
	document.form1.txtCrt.value = "0";
	document.form1.txtCrt.style.backgroundColor = "#fff";
	document.form1.txtEnc.value = "";
	document.form1.txtEnc.style.backgroundColor = "#fff";
	document.form1.txtCal.value = "";
	document.form1.txtCal.style.backgroundColor = "#fff";
	document.form1.txtPix.value = "";
	document.form1.txtPix.style.backgroundColor = "#fff";
	document.form1.txtBnc.value = "";
	document.form1.txtBnc.style.backgroundColor = "#fff";
	document.form1.txtAgn.value = "";
	document.form1.txtAgn.style.backgroundColor = "#fff";
	document.form1.txtCta.value = "";
	document.form1.txtCta.style.backgroundColor = "#fff";
	document.form1.txtFav.value = "";
	document.form1.txtFav.style.backgroundColor = "#fff";
	document.form1.txtTlg.value = "";
	document.form1.txtTlg.style.backgroundColor = "#fff";
	document.form1.txtEml.value = "";
	document.form1.txtEml.style.backgroundColor = "#fff";
	if ( id == "0" && document.form1.txtPais[document.form1.txtPais.selectedIndex].value == 124 ) {
		document.form1.txtAtual.selectedIndex = -1;
		if ( CampoVazio(document.form1.txtCpf.value)) return;
		if (!(CheckCC( document.form1.txtCpf ))) {
			alert('CNPJ/CPF inv\341lido!');
			document.form1.txtCpf.value = "";
			document.form1.txtCpf.focus();
			return;
		}
	}
	variaveis = "cpf=" + limpaString(document.form1.txtCpf.value) + "&cli=" + id + "&clb=" + document.form1.txtUid.value + "&origem=novo";
	document.getElementById("divBtn").style.display = "none";
	document.getElementById("divBtn").style.visibility = "hidden";
	document.getElementById("divPro").style.display = "block";
	document.getElementById("divPro").style.visibility = "visible";
//	prompt( "frmCnsCpf.jsp", window.location.href.replace("frmCliCadN", "frmCnsCpf") + "?" + variaveis );
	loadAval = new net.ContentLoader("frmCnsCpf.jsp", consultaCpf, null, "POST", variaveis);
}

function consultaCpf() {
	_cpf = eval("new CADCpf.classe(" + this.req.responseText + ")");
	document.getElementById("divBtn").style.display = "block";
	document.getElementById("divBtn").style.visibility = "visible";
	document.getElementById("divPro").style.display = "none";
	document.getElementById("divPro").style.visibility = "hidden";
	
	if ( _cpf.isExiste() ) {
		if ( _cpf.isPermiteIncluir() ) {
			if ( confirm( _cpf.getMensagem() + "\nDeseja incluir um CONTRATO para este Cliente?\n\n") != true ) {
				document.form1.txtCpf.value = "";
				document.form1.txtCpf.focus();
			} else {
				for (i=0; i<document.form1.txtPais.length; i++) {
					if ( document.form1.txtPais[i].value == _cpf.getIdPais() ) {
						document.form1.txtPais.selectedIndex = i;
						break;
					}
				}
				changeDocument();
				document.form1.txtAtual.style.backgroundColor = "#e6e6e6";
				document.form1.txtCpf.value = _cpf.getCpfFormat();				
				document.form1.txtCpf.style.backgroundColor = "#e6e6e6";
				document.form1.txtNomCli.value = _cpf.getNome();
				document.form1.txtNomCli.style.backgroundColor = "#e6e6e6";
				document.form1.txtIdt.value = _cpf.getIdentidade();
				document.form1.txtIdt.style.backgroundColor = "#e6e6e6";
				document.form1.txtEnd.value = _cpf.getEndereco();
				document.form1.txtEnd.style.backgroundColor = "#e6e6e6";
				document.form1.txtCep.value = _cpf.getCep();
				document.form1.txtCep.style.backgroundColor = "#e6e6e6";
				document.form1.txtCrt.value = _cpf.getCarteira();
				document.form1.txtCrt.style.backgroundColor = "#e6e6e6";
				document.form1.txtEnc.value = _cpf.getEnderecoCarteira();
				document.form1.txtEnc.style.backgroundColor = "#e6e6e6";
				document.form1.txtCal.value = _cpf.getEnderecoAlternativo();
				document.form1.txtCal.style.backgroundColor = "#e6e6e6";
				document.form1.txtPix.value = _cpf.getPix();
				document.form1.txtPix.style.backgroundColor = "#e6e6e6";
				document.form1.txtBnc.value = _cpf.getBanco();
				document.form1.txtBnc.style.backgroundColor = "#e6e6e6";
				document.form1.txtAgn.value = _cpf.getAgencia();
				document.form1.txtAgn.style.backgroundColor = "#e6e6e6";
				document.form1.txtCta.value = _cpf.getContaCorrente();
				document.form1.txtCta.style.backgroundColor = "#e6e6e6";
				document.form1.txtFav.value = _cpf.getFavorecido();
				document.form1.txtFav.style.backgroundColor = "#e6e6e6";
				document.form1.txtTlg.value = _cpf.getTelegram();
				document.form1.txtTlg.style.backgroundColor = "#e6e6e6";
				document.form1.txtEml.value = _cpf.getEmail();
				document.form1.txtEml.style.backgroundColor = "#e6e6e6";
				if ( _cpf.isExiste() ) {
					document.form1.txtExiste.value = "S";
					document.form1.txtIdOrigem.value = _cpf.getIdOrigem();
				}
//				alert( "Paises: " + document.form1.txtPais.length );
				document.form1.txtDlrValor.focus();
			}
		} else {
			alert(_cpf.getMensagem());
			document.form1.txtCpf.value = "";
			document.form1.txtCpf.focus();
		}
	} else {
		document.form1.txtAtual.style.backgroundColor = "#e6e6e6";
	}
	buscarTaxa();
}

var Numeros = ""	;				// Variavel base para calculo CGC/CPF
function Numero ( nn ) {			// Funcao para testar se eh numerico
	var n = "" + nn;
	if (n=="1"||n=="2"||n=="3"||n=="4"||n=="5"||n=="6"||n=="7"||n=="8"||n=="9"||n=="0") {
		return true; 
	} else { 
		return false; 
	}
}
function Calculo ( Tipo ) {			// Tipo: 1=CPF, 2=CGC
var qtd = 0;
var aux = 0;
var DV1 = 0;
var DV2 = 0;
	if ( Tipo == 1 ) { 
		qtd = 9; 
		aux = 10;
	} else { 
		qtd = 13; 
		aux = 6;
	}
	DV2 = -1;
	DV1 = Digito(qtd, Tipo, aux, DV2);
	aux++ ;
	DV2 = Digito(qtd, Tipo, aux, DV1);
	if ( DV1 != Numeros.charAt(qtd) ) {
		return false
	}
	qtd++;
	if ( DV2 != Numeros.charAt(qtd) ) {
		return false;
	}
	return true
}
function Digito ( Qtd, Ind, Aux, DV) {
var vezes = 0;
var somatoria = 0;
var div = 0;
var mlt = Aux;
	for ( ; vezes < Qtd ; vezes++ ) {
		somatoria = somatoria + (Numeros.charAt(vezes) * mlt);
		mlt-- ;
		if ( mlt == 1 ) {
			mlt = 9 ;
		}
	}
	if ( DV != -1 ) {
		somatoria = somatoria + (DV * 2);
	}
	mlt = Math.floor(somatoria / 11) ;
	mlt = mlt * 11 ;
	somatoria = somatoria - mlt ;
	if ( somatoria > 1 ) { 
		return (11 - somatoria) 
	} else { 
		return 0 
	}
}
function CheckCC( Texto ) {		// Funcao controle do Teste de DV (digito verificador)
var chr = ""			;		// Caracteres para ajustar sem a formatacao
var l = 0				;		// Indice de pesquisa
var qtd = 0				;		// Quantidade de caracteres numericos
var Tx = Texto;
    Numeros = ""		;		// Inicializa a variavel do CGC/CPF
	for (l = 0; l < Tx.value.length ; l++) {
		if ( Numero(Tx.value.charAt(l)) ) {	// Verifica se eh numerico
			chr=chr+Tx.value.charAt(l);		// Extrai o caracter numerico
			qtd++							// Adiciona 1 a quantidade de numericos
		}	
	}
	if ( qtd > 11 ) { 				// Define o tipo de calculo: 1=CPF, 2=CGC
		l = 2; 
		qtd = 15;   
	} else {
		l = 1; 
		qtd = 11; 	
	}
var ini = qtd - chr.length;		// Defines zeros a esquerda
var lop = 0;
	while ( ini != lop ) {			// Preenche zeros a esquerda
		lop++ ;
		Numeros = Numeros + "0" ;
	}
	for (lop = 0; lop < qtd; lop++) { 	// Preenche com o numero digitado
		Numeros = Numeros + chr.charAt(lop) ;
	}
var nmr = "";
	if (l==1) { 
		nmr="CPF" 
	} else { 
		nmr="CGC" 
	}
	if ( Calculo(l) ) { 
		Texto.value = Formatar(chr);
		return true ;
	} else { 
		return false;
	}
}
function Formatar(Campo) {
	ret = "";
	Mascara = "";
	p   = Campo.length-1;
	if 	(p > 11) {
		Mascara = "00.xxx.xxx/xxxx-xx";
	} else {
		Mascara = "000.xxx.xxx-xx";
	}
	t   = Mascara.length-1;
    for (i=t; i>-1; i--) {
        if (Mascara.charAt(i) == 'x' || Mascara.charAt(i) == '0') {
            if (p>-1) {
                ret = Campo.charAt(p) + ret;
                p--;
            } else {
                if (Mascara.charAt(i) == '0') {
                   ret = Mascara.charAt(i) + ret;
                }
            }
        } else {
           ret = Mascara.charAt(i) + ret;
        }
    }
    return ret;
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
    
</body>
</html>

<%@ include file="inc/incRodape.jsp"%>
