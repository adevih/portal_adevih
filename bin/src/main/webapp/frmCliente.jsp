<%@ include file="inc/incCabec.jsp"%>
<%
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );
	String	txtTitulo					=	"CLIENTE CONSULTA";
	if ( txtAcao.equals("novo") )
	{
		txtTitulo						=	"CLIENTE NOVO";
	}
	else
	{
		txtAcao							=	"busca";
	}
%>
<h2><%=txtTitulo%></h2>
<form class="align-content-center" action="frmCliente.jsp" name="form1" id="form1" method="post">
	<input type="hidden" name="txtAcao" id="txtAcao" value="<%=txtAcao%>">
	<div class="mb-4">
		<input type="search" class="form-control shadow-sm" name="busca" id="busca" placeholder="Buscar" aria-describedby="emailHelp">
	</div>
	<div class="mb-4">
		<button type="button" class="btn btn-dark btn-custom" onclick="javascript: return Submeter('cli-shw');">
			Consultar
		</button>
		<button type="button" class="btn btn-dark btn-custom" onclick="javascript: return Submeter('cli-new');">
			Novo
		</button>
	</div>
</form>
<%@ include file="inc/incRodape.jsp"%>