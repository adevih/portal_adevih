        <nav id="sidebar">
            <div class="sidebar-header">
				<img class="g-2" src="img/logo_responsiva.png" width="160"/>
            </div>
            <ul class="list-unstyled components">
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
        
%>
<link rel="stylesheet" href="css/style.css">
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
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o das taxas de remunera&ccedil;&atilde;o" onclick="javascript: Submeter('Tax');"><img class="g-2" src="img/percent.png" width="20"/> TAXA DE REMUNERA&Ccedil;&Atilde;O</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de franquias" onclick="javascript: Submeter('Frq');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> FRANQUIA</a>
                </li>
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
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CONTRATO NOVO</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li>
-->
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CONTRATO NOVO</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li
-->
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="consulta do cadastro de contratos por franquia" onclick="javascript: Submeter('Ctf');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> CONTRATOS / FRANQUIA</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CONTRATO NOVO</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTO CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
-->
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_PAGAMENTOS )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTOS CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTOS COORDENADOR</a>
                </li>
<%
	}
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o das cota&ccedil;&otilde;es do dolar" onclick="javascript: Submeter('Dlr');"><img class="g-2" src="img/cotacao_dolar.png" width="20"/> COTA&Ccedil;&Atilde;O DOLAR</a>
                </li>
                <li>
                    <a href="#" title="altera&ccedil;&atilde;o da senha de acesso" onclick="javascript: Submeter('Pwd');"><img class="g-2" src="img/senha.png" width="20"/> SENHA</a>
                </li>
                <li>
                    <a href="#" title="sair do sistema" onclick="javascript: Submeter('Ext'); return false;"><img class="g-2" src="img/sair.png" width="20"/> SAIR</a>
                </li>
            </ul>
        </nav>


                    <%-- MOBILE --%>

        <nav id="sidebar" class="d-block d-lg-none">
            <div class="sidebar-header">
				<img class="g-2" src="img/logo_responsiva.png" width="160"/>
            </div>
            <ul class="list-unstyled components">
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
        
%>

<div class="offcanvas offcanvas-start text-bg-dark flex wrap" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header">
<div style="font-size:80%">&nbsp;&nbsp;&nbsp;<%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
</div>
<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center">
    <a class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('CliN')"><img class="align-items-center" src="img/contrato_1.png" width="20"/>NOVO CONTRATO</a>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cnt')">CONTRATOS</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">PAGAMENTOS COORDENADOR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">COTA��O DOLAR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">SENHA</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">SAIR</button>
    <img class=" mb-2 p-2 col-12 me-auto" src="img/logo_responsiva.png"/>
</div>
</div>
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
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o das taxas de remunera&ccedil;&atilde;o" onclick="javascript: Submeter('Tax');"><img class="g-2" src="img/percent.png" width="20"/> TAXA DE REMUNERA&Ccedil;&Atilde;O</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de franquias" onclick="javascript: Submeter('Frq');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> FRANQUIA</a>
                </li>
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
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CONTRATO NOVO</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li>
-->
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CONTRATO NOVO</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li
 -->
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
                <li>
                    <a href="#" title="consulta do cadastro de contratos por franquia" onclick="javascript: Submeter('Ctf');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> CONTRATOS / FRANQUIA</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de clientes" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> CONTRATO NOVO</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATOS</a>
                </li>
<!--
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTO CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
-->
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_PAGAMENTOS )
	{
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTOS CLIENTE</a>
                </li>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTOS COORDENADOR</a>
                </li>
<%
	}
%>
                <li>
                    <a href="#" title="manuten&ccedil;&atilde;o das cota&ccedil;&otilde;es do dolar" onclick="javascript: Submeter('Dlr');"><img class="g-2" src="img/cotacao_dolar.png" width="20"/> COTA&Ccedil;&Atilde;O DOLAR</a>
                </li>
                <li>
                    <a href="#" title="altera&ccedil;&atilde;o da senha de acesso" onclick="javascript: Submeter('Pwd');"><img class="g-2" src="img/senha.png" width="20"/> SENHA</a>
                </li>
                <li>
                    <a href="#" title="sair do sistema" onclick="javascript: Submeter('Ext'); return false;"><img class="g-2" src="img/sair.png" width="20"/> SAIR</a>
                </li>
            </ul>
        </nav>

