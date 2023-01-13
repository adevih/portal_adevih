<%@ include file="inc/incCabec.jsp"%><%

	long lContrato						=	UTLUtils.getStringToLong( request.getParameter("cnt") );

	CADContrato _cntN					=	new CADContrato( lContrato, conn );

	CADCliente _novo					=	new CADCliente( _cntN.getIdCliente(), conn );

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
				out.println("json: " + _json.toString());

				_json.post(urlJson);

	if ( _json.getStatusCode() != 200 )

	{

		out.println("<br>Erro: " + _json.getStatusCode() + ", " + _json.getReason() + "<br>");

		UTLMail mail 		=	new UTLMail(dir_base);

		String	strProps	=	dir_base + "/Intranet/inf/prp/Mailinf.props";

		String[] files		=	null;

		String txtFromEmail	=	"suporte@servicosespecializados.com.br";

		String[] arrToEmail	=	new String[2];

		arrToEmail[0]		=	"Suporte Infinity<suporte@servicosespecializados.com.br>";

		arrToEmail[1]		=	"Igor<suporte@servicosespecializados.com.br>";

		String txtAssunto	=	"Falha envio JSon";

		String txtConteudo	=	"Status: " + _json.getStatusCode() + ", " + _json.getReason() + "\n\n" + _json.toString();

		mail.postMail(txtFromEmail, arrToEmail, null, null, txtAssunto, txtConteudo, txtConteudo, strProps, files);

	}

	out.println("<br>FIM<br>");

	////

%><%@ include file="inc/incRodape.jsp"%>

