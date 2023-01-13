<%@ include file="inc/incCabec.jsp"%><%
	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );

	String	txtMensagem					=	UTLUtils.getBranco();
	CADColaborador _colaborador		=	new CADColaborador( UTLUtils.getStringToLong(txtUid), conn );
	String	txtNome						=	_colaborador.getNome();

	if ( txtAcao.equals("alterar") )
	{
		String	txtPwdAtu				=	UTLUtils.getStringToString( request.getParameter("txtPwdAtu") );
		String	txtPwdNew				=	UTLUtils.getStringToString( request.getParameter("txtPwdNew") );
		try
		{
			if ( _colaborador.getSenha().equals(txtPwdAtu) )
			{
				_colaborador.setSenha(txtPwdNew);
				_colaborador.atualize(conn);
				txtMensagem				=	"Registro atualizado com sucesso!";
			}
			else
			{
				txtMensagem				=	"Senha atual não confere!";
			}
		}
		catch (SQLException e)
		{
			txtMensagem					=	"Erro: " + e;
		}
	}
	txtMensagem							=	txtMensagem.replace('\'','´').replace('\n',' ');
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Elysium Technology</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="inc/js/jquery.js"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
<script type="text/Javascript">
strAviso = "<%=txtMensagem%>";
function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}
	if (strAviso != "") {
		alert(strAviso);
		if (strAviso == "Registro atualizado com sucesso!") {
			Submeter("V");
			return;
		}
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	document.form1.txtPwdAtu.focus();
}

var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
//===============================================//
	if (acao == "A") {
		if ( CampoVazio(document.form1.txtPwdNew.value) ) {
			alert("Falta informar a Senha!");
			document.form1.txtPwdNew.focus();
			return;
		}
		if ( CampoVazio(document.form1.txtPwdRep.value) ) {
			alert("Falta informar a Senha!");
			document.form1.txtPwdRep.focus();
			return;
		}
		if ( document.form1.txtPwdNew.value != document.form1.txtPwdRep.value ) {
			alert("Senha não confere!");
			document.form1.txtPwdNew.select();
			document.form1.txtPwdNew.focus();
			return;
		}
		document.form1.txtAcao.value = "alterar";
		document.form1.action="frmPwd.jsp";
	}
	varSubmit = true;
	document.getElementById("divBtn").style.display = "none";
	document.getElementById("divBtn").style.visibility = "hidden";
	document.getElementById("divPro").style.display = "block";
	document.getElementById("divPro").style.visibility = "visible";
	document.form1.submit();
}

function CampoVazio(Campo) {
	r = / /g;
	s = Campo.replace(r, "");
	if (s.length == 0) {
		return true;
	} else {
		return false;
	}
}

function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}
</script>
<body leftmargin="0" topmargin="0" onload="javascript: Foco();">
    <div class="wrapper">
        <!-- Sidebar  -->
<%@ include file="inc/incSideBar.jsp"%>
        <!-- Page Content  -->
        <div id="content">
<%@ include file="inc/incNavBar.jsp"%>
			<div class="panel-form">

				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"  id="sWhidt"  value="<%=sWhidt%>">
						<input type="hidden" name="sHeight" id="sHeight" value="<%=sHeight%>">
						<input type="hidden" name="txtAcao" id="txtAcao" value="<%=txtAcao%>">
						<input type="hidden" name="txtSss"  id="txtSss"  value="<%=txtSss%>">
						<input type="hidden" name="txtAss"  id="txtAss"  value="<%=txtAss%>">
						<input type="hidden" name="txtUid"  id="txtUid"  value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"  id="txtFrq"  value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"  id="txtOwn"  value="<%=txtOwn%>">
						<tr>
							<td width="20%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="80%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						<tr class="selecF12" height="50"><td colspan="2" valign="top">SENHA DE ACESSO</td></tr>
						<tr >
							<td>Usu&aacute;rio:</td>
							<td><input class="form-control shadow-sm" style="background-color: #e6e6e6;" type="text" name="txtNome" id="txtNome" size="50" ths="0" prv="0" nxt="0" value="<%=txtNome%>" onfocus="javascript: this.blur();" onkeydown="javascript: return false;"></td>
						</tr>
						<tr >
							<td>Senha atual:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="password" name="txtPwdAtu" id="txtPwdAtu" ths="1" prv="4" nxt="2" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr >
							<td>Nova Senha:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="password" name="txtPwdNew" id="txtPwdNew" ths="2" prv="1" nxt="3" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr >
							<td>Repetir Senha:</td>
							<td><input class="form-control shadow-sm col-lg-5" type="password" name="txtPwdRep" id="txtPwdRep" ths="3" prv="2" nxt="20" onkeydown="javascript: return verTab(event);"></td>
						</tr>
						<tr height="30">
							<td colspan="2" valign="bottom">
								<div name="divBtn" id="divBtn" align="center" class="mb-4">
									<br>
									<input class="btn btn-dark btn-custom" onclick="javascript: Submeter('A');" type="button" name="btnAcao" value="Atualizar" ths="20" prv="3" nxt="21" onkeydown="javascript: return verTab(event);">
								</div>
								<div name="divPro" id="divPro" align="center" style="display: none; visibility: hidden;"><span class="tittab2b">Aguarde:&nbsp;&nbsp;</span><img src="img/progress.gif" border="0" alt="Aguarde, processando..." style="position: relative; top: 2px;"><span class="tittab2b">&nbsp;&nbsp;processando...</span></div>
							</td>
						</tr>
						</form>
						</table>
							
					</td>
				</tr>
				</table>

			</div>
			<div class="col-sm text-center"></div>
        </div>
    </div>

</body>
<script type="text/Javascript">
function tab(e) {
	e = window.event || e;
	o = e.target || e.srcElement;
	kc  = e.which || e.keyCode;
	ret = null;
	if (o.tagName == "INPUT" && (o.type == "button" || o.type == "BUTTON") && kc == 13) {
		o.click();
		return ;
	}
	if ( (o.tagName != "SELECT" && (kc == 40 || kc == 38 || kc == 13 || kc == 9)) || (o.tagName == "SELECT" && (kc == 37 || kc == 39 || kc == 13 || kc == 9)) ) {
		prv = o.getAttribute("prv");
		nxt = o.getAttribute("nxt");
		for (i=0;i<form1.length; i++) {
			if (o.tagName == "SELECT") {
				if (kc == 37) {
					if (form1[i].getAttribute("ths") == prv) {
						ret = form1[i];
						break;
					}
				} else {
					if (form1[i].getAttribute("ths") == nxt) {
						ret = form1[i];
						break;
					}
				}
			} else {
				if (kc == 38) {
					if (form1[i].getAttribute("ths") == prv) {
						ret = form1[i];
						break;
					}
				} else {
					if (form1[i].getAttribute("ths") == nxt) {
						ret = form1[i];
						break;
					}
				}
			}
		}
	}
	if (ret != null) {
		if (ret.style.display == "none") {
			tab(ret);
		} else {
			ret.focus();
		}
	}
}
</script>
</html>
<%@ include file="inc/incRodape.jsp"%>
