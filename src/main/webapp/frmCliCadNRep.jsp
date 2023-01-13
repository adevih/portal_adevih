<%@ include file="inc/incCabec.jsp"%><%
	long	lngCliente					=	UTLUtils.getStringToLong( request.getParameter("cli") );
	String 	strCampo					=	UTLUtils.getStringToString( request.getParameter("campo") );
	String 	strValor					=	UTLUtils.getStringToString( request.getParameter("valor") );
	String	strRet						=	UTLUtils.getBranco();
	CADClienteNovo _clienteNovo			=	new CADClienteNovo( lngCliente, conn );
	if ( strCampo.equals("lido") )
	{
		_clienteNovo.setVisto( UTLUtils.getStringToBoolean(strValor) );
		try
		{
			_clienteNovo.atualize(conn);
			if ( _clienteNovo.isVisto() )
			{
				strRet					=	"Registro marcado como lido!";
			}
			else
			{
				strRet					=	"Registro marcado n\\343o como lido!";
			}
		}
		catch (SQLException e)
		{
			strRet						=	"Erro: " + e.toString();
		}
	}
	out.write(strRet);
	out.flush();
%><%@ include file="inc/incRodape.jsp"%>