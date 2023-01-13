<%@ include file="inc/incCabec.jsp"%><%
	long 	lngCli						=	UTLUtils.getStringToLong( request.getParameter("cli") );
	long 	lPais						=	UTLUtils.getStringToLong( request.getParameter("pas") );
	long 	lngFrq						=	UTLUtils.getStringToLong( request.getParameter("frq") );
	String 	strDtaRef					=	UTLUtils.getStringToString( request.getParameter("dta") );
	Calendar cDtaRef					=	null;
	if ( strDtaRef.trim().length() == 0 )
	{
		cDtaRef							=	Calendar.getInstance();
	}
	else
	{
		cDtaRef							=	UTLUtils.converteData(strDtaRef);
	}
//	CADCliente _cliente					=	new CADCliente( lngCli, conn );
//	long	lPais						=	_cliente.getIdPais();
	CADTaxa _taxa						=	new CADTaxa( lPais, lngFrq, cDtaRef, 0, conn );
	_taxa.isFind( lPais, lngFrq );
	out.write("{\n");
	out.write(" \"Id\":" + _taxa.getId());
	out.write(",\n \"IdPais\":" + _taxa.getIdPais());
	out.write(",\n \"IdFranquia\":" + _taxa.getIdFranquia());
	out.write(",\n \"DataInicio\":\"");
	out.write(UTLUtils.getDia(_taxa.getDataInicio()));
	out.write("\",\n \"DataFinal\":\"");
	out.write(UTLUtils.getDia(_taxa.getDataFinal()));
	
	out.write("\",\n \"RemuneracaoObjetivo\":" + _taxa.getRemuneracaoObjetivo());
	out.write(",\n \"RemuneracaoEfetivo\":" + _taxa.getRemuneracaoEfetivo());
	out.write(",\n \"ComissaoObjetivo\":" + _taxa.getComissaoObjetivo());
	out.write(",\n \"ComissaoEfetivo\":" + _taxa.getComissaoEfetivo());
	
	out.write(",\n \"FormRemuneracaoObjetivo\":\"" + UTLUtils.getCampo(_taxa.getRemuneracaoObjetivo(), 3));
	out.write("\",\n \"FormRemuneracaoEfetivo\":\"" + UTLUtils.getCampo(_taxa.getRemuneracaoEfetivo(), 3));
	out.write("\",\n \"FormComissaoObjetivo\":\"" + UTLUtils.getCampo(_taxa.getComissaoObjetivo(), 3));
	out.write("\",\n \"FormComissaoEfetivo\":\"" + UTLUtils.getCampo(_taxa.getComissaoEfetivo(), 3));

	out.write("\",\n \"Mensagem\":\"");
	if ( _taxa.getId() == 0 )
	{
		out.write("Registro n\u00E3o localizado!");
	}
	out.write("\"\n}\n");
	out.flush();
%><%@ include file="inc/incRodape.jsp"%>