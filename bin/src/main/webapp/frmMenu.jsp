<%@ include file="inc/incImport.jsp"%>
<%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );

	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}
%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Elysium Technology</title>

    <!-- Bootstrap CSS CDN -->
    <!--link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"-->
    
  
    <!-- Custom CSS -->
    <!--link rel="stylesheet" href="css/style.css"-->
	<style>
	.panel-form{
	margin-top: 90px;
	max-width: 400px;
}
.btn-custom{
	width: 49% !important;
}
h2{
	margin: 50px 0;
	color: #6c757d;
}
input, button{
	border-radius: 20px !important;
}
body {
	font-family: Helvetica, Sans Serif;
}

p {
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

.navbar {
    padding: 15px 10px;
    background: none !important;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 30px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

#sidebar {
    min-width: 300px;
    max-width: 300px;
    color: #fff;
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -300px;
}

#sidebar .sidebar-header {
    padding: 8px;
}

#sidebar #info{
	font-size: 0.8em;
	margin-top: 60px;
	text-align: center;
}

#sidebar ul.components {
    padding: 20px 0;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}
#sidebar ul li:hover {
    color: #000;
    background: #ECECEC;
    border-left: 5px solid #000;
}
#sidebar ul li a {
	color: #6c757d;
    padding: 5px;
    font-size: 0.9em;
    display: block;
    margin-left: 20px;
}

#sidebar ul li a:hover {
    color: #000;
    background: #ECECEC;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: #000;
}

#sidebar ul li a.sair{
	margin-top: 30px;
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width: 100%;
    /*min-height: 100vh;*/
    transition: all 0.3s;
    background: #ECECEC;
    /*padding: 20px;*/
}
	</style>

    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script-->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
    
    	
</head>
<script type="text/javascript" src="inc/js/net.js"></script>
<script type="text/javascript">
<!--
function show(e) {
//	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
//	alert(width);
}
function loadPage() {
//	alert('foco');
//	alert( document.getElementById("sidebar").className );
//	$('#sidebar').toggleClass('active');
//	document.getElementById("sidebarCollapse").click();
//	window.addEventListener('resize', show);
//var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
//	if ( width < 790 ) {
//		let div = document.querySelector("#sidebar");
//		$('#sidebar').toggleClass('active');
//	}
//	alert(width);
}
function loadForm(frm) {
//	alert(frm);
    variaveis = "";
	if ( document.form1 ) {
		inputs = document.getElementsByTagName("input");
		for (i=0; i<inputs.length; i++) {
			variaveis += inputs[i].name + "=" + inputs[i].value + "&";
		}
	}
	alert(variaveis);
	loadAval = new net.ContentLoader(frm, displayForm, null, "POST", variaveis);
}
function displayForm() {
	text = this.req.responseText;
//	alert(text);
	document.getElementById("frmLoad").innerHTML = text;
//	document.form1.busca.focus();
}
/*
function Submeter(acao) {
	if ( acao == "cli-new" ) {
		alert(document.getElementById("txtAcao").value);
		document.getElementById("txtAcao").value = "novo";
		loadForm("frmCliente.jsp");
	}
	if ( acao == "" ) {
	}
	return false;
}
*/
var varSubmit = false;
function Submeter(acao) {
	if (acao == "Ext") {
		document.form1.txtAcao.value="sair";
		document.form1.action="/";
	}
	if (acao == "Cli") {
		document.form1.action="frmCliCns.jsp";
	}
	if (acao == "Clb") {
		document.form1.action="frmClbCns.jsp";
	}
	if (acao == "Cnt") {
		document.form1.action="frmCntCns.jsp";
	}
	if (acao == "Ctf") {
		document.form1.action="frmCntFrqCns.jsp";
	}
	if (acao == "Cip") {
		document.form1.action="frmCipCns.jsp";
	}
	if (acao == "Cbp") {
		document.form1.action="frmCbpCns.jsp";
	}
	if (acao == "Pwd") {
		document.form1.action="frmPwd.jsp";
	}
	if (acao == "Dlr") {
		document.form1.action="frmDlrCns.jsp";
	}
	varSubmit = true;
	document.form1.submit();
}
//-->
</script>
<body onload="javascript: loadPage();">
    <!--div class="wrapper"-->
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <!--a href="frmMenu.jsp"><img class="g-2" src="img/logo_responsiva.png" width="160"/></a-->
                <img class="g-2" src="img/logo_responsiva.png" width="160"/>
            </div>
			<!--p id="info">PORTAL CORPORATIVO</p-->
            <ul class="list-unstyled components">
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('Cli'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de coordenador" onclick="javascript: Submeter('Clb');"><img class="g-2" src="img/coordenador.png" width="20"/> COORDENADOR</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="consulta do cadastro de contratos por franquia" onclick="javascript: Submeter('Ctf');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> CONTRATOS / FRANQUIA</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTO CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<!--			
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o do cadastro de cliente" onclick="javascript: Submeter('Cli');" value="Cliente" ths="1" nxt="2" prv="20" onkeydown="javascript: return verTab(event);">Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o do cadastro de coordenador" onclick="javascript: Submeter('Clb');" value="Coordenador"  ths="2" nxt="3" prv="1" onkeydown="javascript: return verTab(event);">Coordenador</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');" value="Contratos" ths="3" nxt="4" prv="2" onkeydown="javascript: return verTab(event);">Contratos</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="consulta do cadastro de contratos por franquia" onclick="javascript: Submeter('Ctf');" value="Contratos / Franquia" ths="4" nxt="5" prv="3" onkeydown="javascript: return verTab(event);">Contratos / Franquia</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');" value="Pagamentos Cliente" ths="5" nxt="6" prv="4" onkeydown="javascript: return verTab(event);">Pagamentos Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');" value="Pagamentos Coordenador" ths="6" nxt="7" prv="5" onkeydown="javascript: return verTab(event);">Pagamentos Coordenador</button>
-->									
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_EXECUTIVO )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('Cli'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTO CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<!--
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o do cadastro de cliente" onclick="javascript: Submeter('Cli');" value="Cliente" ths="1" nxt="2" prv="20" onkeydown="javascript: return verTab(event);">Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');" value="Contratos" ths="3" nxt="4" prv="2" onkeydown="javascript: return verTab(event);">Contratos</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');" value="Pagamentos Cliente" ths="4" nxt="5" prv="3" onkeydown="javascript: return verTab(event);">Pagamentos Cliente</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');" value="Pagamentos Coordenador" ths="5" nxt="20" prv="4" onkeydown="javascript: return verTab(event);">Pagamentos Coordenador</button>
-->
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<!--
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');" value="Contratos" ths="3" nxt="4" prv="2" onkeydown="javascript: return verTab(event);">Contratos</button>
									<br>
									<button class="btn btn-primary btn-lg btn-block" type="button" name="btnAcao" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');" value="Pagamentos Coordenador" ths="5" nxt="20" prv="4" onkeydown="javascript: return verTab(event);">Pagamentos Coordenador</button>
-->
<%
	}
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o das cota&ccedil;&otilde;es do dolar" onclick="javascript: Submeter('Dlr');"><img class="g-2" src="img/cotacao_dolar.png" width="20"/> COT&Ccedil;&Atilde;O DOLAR</a>
                </li>
                <li>
                    <a href="#" title="altera&ccedil;&atilde;o da senha de acesso" onclick="javascript: Submeter('Pwd');"><img class="g-2" src="img/senha.png" width="20"/> SENHA</a>
                </li>
                <li>
                    <a class="sair" href="#" title="sair do sistema" onclick="javascript: Submeter('Ext');"><img class="g-2" src="img/sair.png" width="20"/> SAIR</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="loadForm('frmCliente.jsp'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CLIENTE</a>
                </li>
                <li>
                    <a href="coordenador.html"><img class="g-2" src="img/coordenador.png" width="20"/> COORDENADOR</a>
                </li>
                <li>
                    <a href="#"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#"><img class="g-2" src="img/contrato_franquia.png" width="20"/> CONTRATOS / FRANQUIA</a>
                </li>
                <li>
                    <a href="#"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTO CLIENTE</a>
                </li>
                <li>
                    <a href="#"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
-->
            </ul>
        </nav>
        <!-- Page Content  -->
        <div id="content">
            <!--nav class="navbar navbar-expand-lg">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn">
                        <i class="fas fa-align-left"></i>
                        <span>Menu</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                </div>
            </nav>
            <div class="col-sm"></div-->
			<div class="col-sm">
				<div class="panel panel-form" name="frmLoad" id="frmLoad" >
				</div>
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt" id="sWhidt" value="<%=sWhidt%>">
						<input type="hidden" name="sHeight" id="sHeight" value="<%=sHeight%>">
						<input type="hidden" name="txtSss"  id="txtSss"  value="<%=txtSss%>">
						<input type="hidden" name="txtAss"  id="txtAss"  value="<%=txtAss%>">
						<input type="hidden" name="txtUid"  id="txtUid"  value="<%=txtUid%>">
						<input type="hidden" name="txtOwn"  id="txtOwn"  value="<%=txtOwn%>">
						<input type="hidden" name="txtAcao" id="txtAcao" value="">
						</form>
			</div>
			<!--div class="col-sm text-center"></div-->
        </div>
    <!--/div-->
    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <!--script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script-->
    <!--script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script-->
    <!--script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script-->

    <!--script type="text/javascript">
    //    $(document).ready(function () {
    //        $('#sidebarCollapse').on('click', function () {
    //            $('#sidebar').toggleClass('active');
    //        });
    //    });
    </script-->
</body>

</html>