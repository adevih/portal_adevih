<%@ include file="inc/incCabec.jsp"%><%
	String 	strDataFin					=	UTLUtils.getStringToString( request.getParameter("dta") );
	String 	strConv						=	UTLUtils.getStringToString( request.getParameter("cnv") );
	int iDias				    		=	UTLUtils.getStringToInt( request.getParameter("dias") ) * -1;
	double dValor						=	UTLUtils.getStringToDouble( request.getParameter("vlr") );
	BigDecimal	bdValorReal				=	new BigDecimal( 1.0D );
	BigDecimal	bdValorUsd				=	new BigDecimal( 1.0D );
	BigDecimal	bdValorRef				=	new BigDecimal( 1.0D );
	if ( strConv.equals("BRL") )
	{
		bdValorUsd						=	new BigDecimal(dValor);
	}
	else
	{
		bdValorReal						=	new BigDecimal(dValor);
	}
	if ( iDias == 0 )
	{
		iDias							=	-4;
	}

	String  strId						=	"0";
	String  strDataBase					=	UTLUtils.getBranco();
	String  strValor					=	UTLUtils.getBranco();
	String  strValorForm				=	UTLUtils.getBranco();
	String  strRealValor				=	UTLUtils.getBranco();
	String  strRealForm					=	UTLUtils.getBranco();
	String  strUsdValor					=	UTLUtils.getBranco();
	String  strUsdForm					=	UTLUtils.getBranco();
	String  strMensagem					=	UTLUtils.getBranco();
	String  strExiste					=	"S";

	Calendar cDtaIni					=	Calendar.getInstance();
	cDtaIni.add(Calendar.DATE, iDias);
	Calendar cDtaFin					=	Calendar.getInstance();

	if ( strDataFin.trim().length() > 0 )
	{
		cDtaFin							=	UTLUtils.converteData(strDataFin);
		cDtaIni							=	UTLUtils.converteData(strDataFin);
		cDtaIni.add(Calendar.DATE, iDias);
	}
	
	CADDolar _dolar						=	new CADDolar( cDtaIni, cDtaFin, 1, conn );
	if ( _dolar.next() )
	{
		strId							=	_dolar.getId() + "";
		strDataBase						=	UTLUtils.getDia(_dolar.getDataBase());
		strValor						=	_dolar.getValor() + "";
		strValorForm					=	UTLUtils.getCampoDecimal(_dolar.getValor(), 4);
		bdValorRef						=	new BigDecimal( _dolar.getValor() );
	}
	else
	{
		strDataBase						=	"00/00/0000";
		strValor						=	"1.0";
		strValorForm					=	"1,0000";
		strMensagem						=	"\\nATEN\\307\\303O:\\n\\nN\\u00E3o h\\341 data dispon\\355vel para c\\341lculo!\\n\\n";
		strExiste						=	"N";
	}


	if ( strConv.equals("BRL") )
	{
		strUsdValor						=	bdValorUsd.doubleValue() + "";
		strUsdForm						=	UTLUtils.getValor(bdValorUsd.doubleValue());
		bdValorReal						=	bdValorUsd.multiply(bdValorRef);
		strRealValor					=	bdValorReal.doubleValue() + "";
		strRealForm						=	UTLUtils.getValor(bdValorReal.doubleValue());
	}
	else
	{
		strRealValor					=	bdValorReal.doubleValue() + "";
		strRealForm						=	UTLUtils.getValor(bdValorReal.doubleValue());
		bdValorUsd						=	bdValorReal.divide(bdValorRef, RoundingMode.HALF_UP);
		strUsdValor						=	bdValorUsd.doubleValue() + "";
		strUsdForm						=	UTLUtils.getValor(bdValorUsd.doubleValue());
	}

	out.write("{\n");
	out.write("   \"Id\": ");
	out.write(strId);
	out.write(",\n   \"DataBase\":\"");
	out.write(strDataBase);
	out.write("\",\n   \"Valor\":\"");
	out.write(strValor);
	out.write("\",\n   \"ValorForm\":\"");
	out.write(strValorForm);
	out.write("\",\n   \"RealValor\":\"");
	out.write(strRealValor);
	out.write("\",\n   \"RealForm\":\"");
	out.write(strRealForm);
	out.write("\",\n   \"UsdValor\":\"");
	out.write(strUsdValor);
	out.write("\",\n   \"UsdForm\":\"");
	out.write(strUsdForm);
	out.write("\",\n   \"Mensagem\":\"");
	out.write(strMensagem);
	out.write("\",\n   \"Existe\":\"");
	out.write(strExiste);
	out.write("\"\n}\n");
	out.flush();
%><%@ include file="inc/incRodape.jsp"%>