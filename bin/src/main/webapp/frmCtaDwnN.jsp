<%@ page import="java.io.*" %><%@ include file="/inc/incCabec.jsp" %><%
	long	lngArquivo					=	UTLUtils.getStringToLong( request.getParameter("fl") );
	CADContratoArquivoNovo arquivo			=	new CADContratoArquivoNovo( lngArquivo, conn );
	String txtNome						=	arquivo.getNomeArquivo();
	File file							=	new File(arquivo.getPath());
    FileInputStream istr 				= 	null;
	response.reset();
    response.setContentType("application/binary");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + txtNome + "\";");
	boolean bWrite						=	false;
	try
	{
		istr 							= 	new FileInputStream(file);
		int curByte 					= 	-1;
		while( (curByte=istr.read()) !=-1)
		{
			out.write(curByte);
		}
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
			if ( istr != null )
			{
				istr.close();
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