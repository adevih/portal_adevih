<%@ page import="java.io.*,java.nio.charset.StandardCharsets" %><%@ include file="/inc/incCabec.jsp" %><%
	long	lngArquivo					=	UTLUtils.getStringToLong( request.getParameter("fl") );
	CADContratoArquivo arquivo			=	new CADContratoArquivo( lngArquivo, conn );
	String txtNome						=	arquivo.getNomeArquivo();
	String sArq							=	arquivo.getPath().substring(arquivo.getPath().lastIndexOf("/")+1);
	CADArquivo _arq						=	new CADArquivo( arquivo.getIdArquivo(), conn );
	response.reset();
    response.setDateHeader("Expires", 0);
    response.setContentType("application/binary");
    response.setHeader("Content-Disposition", "inline; filename=\"" + txtNome + "\";");
	response.setContentLength(_arq.getConteudoArquivo().length);
	OutputStream os						=	null;
	try
	{
		os								=	response.getOutputStream();
		os.write( _arq.getConteudoArquivo(), 0,  _arq.getConteudoArquivo().length );
	}
	catch(Exception ex)
	{
		System.out.println("frmCtaDwn: Erro escrevendo Streams: "+ex.toString());
		ex.printStackTrace(System.out);
	}
	finally
	{
		try
		{
			if ( os != null )
			{
				os.flush();
				os.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println("frmCtaDwn: Erro fechando Streams: "+ex.toString());
		}
	}  
	try
	{
		response.flushBuffer();
	}
	catch(Exception ex)
	{
		System.out.println("frmCtaDwn: Erro flushing o response: "+ex.toString());
	}
%><%@ include file="/inc/incRodape.jsp"%>