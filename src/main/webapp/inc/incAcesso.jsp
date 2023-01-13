<%
//  --  Inicializa as variбveis de seзгo para a pбgina  --  //
	if (lngUSUARIO == null || lngUSUARIO.longValue() == 0)
	{
		Close(conn);
		response.reset();
		response.sendRedirect("../acsLogout.jsp"); 
		return ;
	}
	Long	lngEMPRESA					=	(Long)session.getAttribute("EMPRESA");
	Long	lngFILIAL					=	(Long)session.getAttribute("FILIAL");
	Long	lngSETOR					=	(Long)session.getAttribute("SETOR");
//
	Long	lngPORTADOR					=	(Long)session.getAttribute("PORTADOR");
	Long	lngTRANSPORTADOR			=	(Long)session.getAttribute("TRANSPORTADOR");
	Long	lngCLIENTE					=	(Long)session.getAttribute("CLIENTE");
	Long	lngFORNECEDOR				=	(Long)session.getAttribute("FORNECEDOR");
//
	String	strNOME						=	(String)session.getAttribute("NOME");
	String	strSENHA					=	(String)session.getAttribute("SENHA");
	String	strEMPRESA_NOME				=	(String)session.getAttribute("EMPRESA_NOME");
	String 	EMPRESA_LOGO				=	(String)session.getAttribute("EMPRESA_LOGO");
	String 	EMPRESA_BACK				=	(String)session.getAttribute("EMPRESA_BACK");
	String 	EMPRESA_CSS					=	(String)session.getAttribute("EMPRESA_CSS");
	String 	acsTITULO					=	"";
	long	intMENU						=	UTLUtils.getStringToLong( request.getParameter("acsMenu") );
%>