<%@ page import="java.io.*" %><%@ include file="/inc/incCabec.jsp" %><%
	long	lngArquivo					=	UTLUtils.getStringToLong( request.getParameter("fl") );
	CADContratoArquivoNovo arquivo		=	new CADContratoArquivoNovo( lngArquivo, conn );
	String txtNome						=	arquivo.getNomeArquivo();

//	String sArq							=	arquivo.getPath().substring(arquivo.getPath().lastIndexOf("/")+1);
//	long lImage							=	Long.parseLong(sArq);
	CADArquivo _arq						=	new CADArquivo( arquivo.getIdArquivo(), conn );
	System.out.println("ID: " + arquivo.getIdArquivo() + ", Busca: " + _arq.getId() );

	String txtContent					=	null;
	if ( txtNome.toUpperCase().endsWith(".PNG") )
	{
		txtContent						=	"image/png";
	}
	if ( txtNome.toUpperCase().endsWith(".JPG") )
	{
		txtContent						=	"image/jpg";
	}
	if ( txtNome.toUpperCase().endsWith(".JPEG") )
	{
		txtContent						=	"image/jpeg";
	}
	if ( txtNome.toUpperCase().endsWith(".GIF") )
	{
		txtContent						=	"image/gif";
	}
	if ( txtNome.toUpperCase().endsWith(".PDF") )
	{
		txtContent						=	"application/pdf";
	}
//	File file							=	new File(arquivo.getPath());
//  FileInputStream istr 				= 	null;
	InputStream	istr					=	null;
	istr 								= 	new ByteArrayInputStream( _arq.getConteudoArquivo() );
	response.reset();
    response.setContentType(txtContent);
    response.setDateHeader("Expires", 0);
    response.setHeader("Content-Disposition", "inline; filename=\"" + txtNome + "\";");
//	response.setContentLength((int)file.length());
	response.setContentLength(_arq.getConteudoArquivo().length);
	try
	{
//		istr 							= 	new FileInputStream(file);
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