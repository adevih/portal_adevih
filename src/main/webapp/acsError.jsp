<%@ page isErrorPage = "true"%>
<%@ page import = "java.io.*,java.util.Enumeration" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta charset="ISO-8859-1">
<title>PortalFlex :: Erro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>
</head>
<style type="text/css">
body {background-color:#F8F8FF;background-image:url(<%=(request.getLocalPort() == 443 ? "https" : "http")%>://<%=request.getServerName()%>:<%=request.getLocalPort()%>/infinity/img/logo_infinity.png);background-repeat:no-repeat;background-position:right bottom;background-attachment:fixed;}
h3{font-family:Arial;color:000000;}
b{font-family:Arial;color:000000;font-size:11px}
p {font-family:Arial;font-size:14px;font-style:normal;font-weight:normal;color:000000;}
</style>
<body>
<h2> Erro na Aplica&ccedil;&atilde;o</h2>
<h3> Copie a mensagem abaixo e envie para <a href="mailto:suporte@servicosespecializados.com.br?subject=ErroAplicacao">suporte@servicosespecializados.com.br</a></h3>
<hr />
<b> Mensagem: <span style="color:red;font-family:verdana,arial;">
<script language="javascript" type="text/javascript">
document.write (document.location.href); 
</script> 
</span></b>
<pre>
<%
	StringWriter sw 					= 	new StringWriter();
	PrintWriter pw 						= 	new PrintWriter(sw);
	exception.printStackTrace(pw);
	out.print(sw);
	sw.close();
	pw.close();
%>
</pre>
<hr />
<h4> clique <a href="javascript:javascript:history.go(-1)">aqui</a> para voltar à página anterior ou clique <a href="/">aqui</a> para voltar ao menu principal</h4>
</body>
</html>