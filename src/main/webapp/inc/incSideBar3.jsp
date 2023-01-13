        <nav id="sidebar" class="d-none d-lg-block h-100">
            <div class="sidebar-header d-flex flex-column align-content-center justify-content-center col-12">
				<img class="m-auto col-8" src="img/logo_responsiva.png">
            </div>
            <ul class="list-unstyled components">
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
%>
                <%-- <li>
                    <a  title="Dashboard" onclick="javascript: Submeter('Cliente');"><img class="g-2" src="img/coordenador.png" width="20"/> DASHBOARD</a>
                </li> --%>
                <li class="cttNovoCns">
                    <a  title="Maintance of Investor Register" onclick="Submeter('Cli'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> INVESTOR</a>
                </li>
                <li>
                    <a  title="Maintance of Coordinator Register" onclick="javascript: Submeter('Clb');"><img class="g-2" src="img/coordenador.png" width="20"/> COORDINATOR</a>
                </li>
                <li>
                    <a  title="Maintance of Contracts Register" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRACTS</a>
                </li>
                <li>
                    <a  title="Consultation of the Office's Register" onclick="javascript: Submeter('Ctf');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> OFFICE'S CONTRACTS</a>
                </li>
                <li>
                    <a  title="Maintance of Investor's Payment" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> INVESTOR'S PAYMENT</a>
                </li>
                <li>
                    <a  title="Maintance of Coordinator's Payment" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> COORDINATOR'S PAYMENT</a>
                </li>
                <li>
                    <a  title="Maintance of Remuneration's Tax" onclick="javascript: Submeter('Tax');"><img class="g-2" src="img/percent.png" width="20"/> REMUNERATION TAX</a>
                </li>
                <li>
                    <a  title="Maintance of Office's Register" onclick="javascript: Submeter('Frq');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> OFFICES</a>
                </li>
                <li class="cttNovoDol">
                    <a  title="Maintance of Dollar" onclick="javascript: Submeter('Dlr');"><img class="g-2 me-1" src="img/cotacao_dolar.png" width="25"/> DOLLAR</a>
                </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_EXECUTIVO )
	{
%>

                <li >
                    <a  title="Maintance of Investor Register" onclick="Submeter('Cli'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> INVESTOR</a>
                </li>
                <li>
                    <a  title="Maintance of Contracts Register" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRACTS</a>
                </li>
                <li>
                    <a  title="Maintance of Investor's Payment" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> INVESTOR'S PAYMENT</a>
                </li>
                <li>
                    <a  title="Maintance of Coordinator's Payment" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> COORDINATOR'S PAYMENT</a>
                </li>
                <li class="cttNovoDol">
                    <a  title="Maintance of Dollar" onclick="javascript: Submeter('Dlr');"><img class="g-2 me-1" src="img/cotacao_dolar.png" width="25"/> DOLLAR</a>
                </li>
                
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>                            <!-- COORDENADOR -->


    <li>
        <a  title="Dashboard" onclick="javascript: Submeter('Cliente');"><img class="g-2" src="img/dashboard.png" width="20"/> DASHBOARD</a>
    </li>
    <li class="cttNovoCns">
        <a  title="New Contract" onclick="Submeter('CliN'); return false;">
        <img class="g-2 me-1 " src="img/cliente.png" width="25"> NEW CONTRACT</a>
    </li>
<!--
    <li>
        <a  title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2 " src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
    </li>
-->
    <li class="cttNovoCon">
        <a  title="Maintance of Investor Register" onclick="javascript: Submeter('Cnt');"><img class="g-2 me-1" src="img/contrato.png" width="25"/> INVESTORS</a>
    </li>
    <%-- <li class="cttCli">
    <a title="Clientes" onclick="javascript: Submeter('Cliente');"> <img class="g-2 me-1" src="img/pagamento_cordenador.png" width="25"> CLIENTES</a>
    </li> --%>
    <li class="cttNovoPag">
        <a  title="Maintance of Coordinator's Payment" onclick="javascript: Submeter('Cbp');"><img class="g-2 me-1" src="img/pagamento_cordenador.png" width="25"/> COORDINATOR'S MONETIZATION</a>
    </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
%>

    <li>
        <a  title="Dashboard" onclick="javascript: Submeter('Cliente');"><img class="g-2" src="img/dashboard.png" width="20"/> DASHBOARD</a>
    </li>
                <li class="cttNovoCns">
                    <a  title="New Contract" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> NEW CONTRACT</a>
                </li>
<!--
                <li>
                    <a  title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li
-->
                <li>
                    <a  title="Maintance of Investor Register" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> INVESTORS</a>
                </li>
                <%-- <li class="cttCli">
                    <a title="Clientes" onclick="javascript: Submeter('Cliente');"> <img class="g-2 me-1" src="img/pagamento_cordenador.png" width="25"> CLIENTES</a>
                </li> --%>
                <li>
                    <a  title="Consultation of the Office's Register" onclick="javascript: Submeter('Ctf');"><img class="g-2" src="img/contrato_franquia.png" width="20"/> OFFICE'S CONTRACTS</a>
                </li>
                <li>
                    <a  title="Maintance of Coordinator's Payment" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> COORDINATOR'S PAYMENT</a>
                </li>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>
                <li class="cttNovoCns">
                    <a  title="New Contract" onclick="Submeter('CliN'); return false;"><img class="g-2" src="img/cliente.png" width="20"/> NEW CONTRACT</a>
                </li>
                <li>
                    <a  title="Maintance of Contracts Register" onclick="javascript: Submeter('Cnt');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRACTS</a>
                </li>
                <li class="cttNovoDol">
                    <a  title="Maintance of Dollar" onclick="javascript: Submeter('Dlr');"><img class="g-2 me-1" src="img/cotacao_dolar.png" width="25"/> DOLLAR</a>
                </li>
<!--
                <li>
                    <a  title="manuten&ccedil;&atilde;o do cadastro de contratos" onclick="javascript: Submeter('CntN');"><img class="g-2" src="img/contrato.png" width="20"/> CONTRATO NOVO</a>
                </li>
                <li>
                    <a  title="manuten&ccedil;&atilde;o de pagamentos a clientes" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> PAGAMENTO CLIENTE</a>
                </li>
                <li>
                    <a  title="manuten&ccedil;&atilde;o de pagamentos a coordenador" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> PAGAMENTO COORDENADOR</a>
                </li>
-->
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_PAGAMENTOS )
	{
%>
                <li>
                    <a  title="Maintance of Investor's Payment" onclick="javascript: Submeter('Cip');"><img class="g-2" src="img/pagamento_cliente.png" width="20"/> INVESTOR'S PAYMENT</a>
                </li>
                <li>
                    <a  title="Maintance of Coordinator's Payment" onclick="javascript: Submeter('Cbp');"><img class="g-2" src="img/pagamento_cordenador.png" width="20"/> COORDINATOR'S PAYMENT</a>
                </li>
                <li class="cttNovoDol">
                    <a  title="Maintance of Dollar" onclick="javascript: Submeter('Dlr');"><img class="g-2 me-1" src="img/cotacao_dolar.png" width="25"/> DOLLAR</a>
                </li>
<%
	}
%>
                
                <li class="cttNovoSen">
                    <a  title="Maintance of Password" onclick="javascript: Submeter('Pwd');"><img class="g-2 me-1" src="img/senha.png" width="25"/> PASSWORD</a>
                </li>
                <li>
                    <a  title="Exit" onclick="javascript: Submeter('Ext'); return false;"><img class="g-2 me-1" src="img/sair.png" width="25"/> EXIT</a>
                </li>
                <div class="offcanvas-body d-flex flex-column align-content-center justify-content-center col-12" style="background-color:#080808;">
                    <div class="text-center">WALLET ADDRESS</div>
    <div class="text-center" style="font-size:70%;" ><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto col-8" src="img/qrcode.jpeg">
    </div>
            </ul>
        </nav>


<%-- //////////// --%>


<nav id="sidebar2" class="d-block d-lg-none">
<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR )
	{
%>

        <%-- ADMINISTRATIVO --%>

        <div class="offcanvas offcanvas-start text-bg-dark flex wrap"   data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header" style="background-color:#080808;">

<div style="font-size:80%">User: <%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" style="background-color:#fff;" aria-label="Close"></button>
</div>
<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center" style="background-color:#080808;">
<img class=" mb-2 p-2 col-12 align-self-center" style="width:60%;" src="img/logo_responsiva.png"/>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cli')">INVESTOR</button>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Clb')">COORDINATOR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cnt')">CONTRACTS</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ctf')">OFFICE'S CONTRACTS</button>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cip')">INVESTOR'S PAYMENT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">COORDINATOR'S PAYMENT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Tax')">REMUNERATION TAX</button>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Frq')">OFFICES</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">DOLLAR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">PASSWORD</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">EXIT</button>
    <div class="text-center">WALLET</div>
    <div class="text-center col-12" style="font-size:70%;"><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto mt-0 col-4  " src="img/qrcode.jpeg">
    
</div>
</div>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_EXECUTIVO )
	{
%>

                    <%-- EXECUTIVO --%>

<div class="offcanvas offcanvas-start text-bg-dark flex wrap"   data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header" style="background-color:#080808;">

<div style="font-size:80%">User: <%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" style="background-color:#fff;" aria-label="Close"></button>
</div>
<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center" style="background-color:#080808;">
<img class=" mb-2 p-2 col-12 align-self-center" style="width:60%;" src="img/logo_responsiva.png"/>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cli')">INVESTOR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cnt')">CONTRACTS</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cip')">INVESTOR'S PAYMENT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">COORDINATOR'S PAYMENT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">DOLLAR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">PASSWORD</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">EXIT</button>
    <div class="text-center">WALLET</div>
    <div class="text-center col-12" style="font-size:70%;"><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto mt-0 col-4  " src="img/qrcode.jpeg">
</div>
</div>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>                            <!-- COORDENADOR -->

<div class="offcanvas offcanvas-start text-bg-dark flex wrap w-100"  data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header" style="background-color:#080808;">
<div class="text-center" style="font-size:100%">User: <%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" style="background-color:#fff;" aria-label="Close"></button>
</div>
<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center col-12" style="background-color:#080808;">
<img class=" mb-2 p-2 col-12 align-self-center" style="width:60%;" src="img/logo_responsiva.png"/>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cliente')">DASHBOARD</button>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('CliN')">NEW CONTRACT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cnt')">INVESTORS</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">COORDINATOR'S PAYMENT</button>
    <%-- <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">COTA��O DOLAR</button> --%>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">PASSWORD</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">EXIT</button>
    <div class="text-center">WALLET</div>
    <div class="text-center col-12" style="font-size:70%;"><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto mt-0 col-4  " src="img/qrcode.jpeg">
</div>

</div>

            </ul>
        </nav>

<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
%>

                        <%-- FRANQUIA COORDENADOR --%>

<div class="offcanvas offcanvas-start text-bg-dark flex wrap"   data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header" style="background-color:#080808;">

<div style="font-size:80%">User: <%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" style="background-color:#fff;" aria-label="Close"></button>
</div>
<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center" style="background-color:#080808;">
<img class=" mb-2 p-2 col-12 align-self-center" style="width:60%;" src="img/logo_responsiva.png"/>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cliente')">DASHBOARD</button>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('CliN')">NEW CONTRACT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cnt')">INVESTORS</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ctf')">OFFICE'S CONTRACTS</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">COORDINATOR'S PAYMENT</button>
    <%-- <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">COTA��O DOLAR</button> --%>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">PASSWORD</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">EXIT</button>
    <div class="text-center">WALLET</div>
    <div class="text-center col-12" style="font-size:70%;"><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto mt-0 col-4  " src="img/qrcode.jpeg">
    
</div>
</div>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FINANCEIRO )
	{
%>

            <%-- FINANCEIRO --%>

<div class="offcanvas offcanvas-start text-bg-dark flex wrap"   data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header" style="background-color:#080808;">

<div style="font-size:80%">User: <%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" style="background-color:#fff;" aria-label="Close"></button>
</div>
<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center" style="background-color:#080808;">
<img class=" mb-2 p-2 col-12 align-self-center" style="width:60%;" src="img/logo_responsiva.png"/>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('CliN')">NEW CONTRACT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cnt')">CONTRACTS</button>
    <%-- <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ctf')">CONTRATOS / FRANQUIA</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">PAGAMENTOS COORDENADOR</button> --%>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">DOLLAR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">PASSWORD</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">EXIT</button>
    <div class="text-center">WALLET</div>
    <div class="text-center col-12" style="font-size:70%;"><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto mt-0 col-4  " src="img/qrcode.jpeg">
</div>
</div>
<%
	}
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_PAGAMENTOS )
	{
%>

        <%-- PAGAMENTOS --%>

        <div class="offcanvas offcanvas-start text-bg-dark flex wrap"   data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
<div class="offcanvas-header" style="background-color:#080808;">

<div style="font-size:80%">User: <%=txtOwn%></div>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" style="background-color:#fff;" aria-label="Close"></button>
</div>

<div class="offcanvas-body d-flex flex-column align-content-center justify-content-center" style="background-color:#080808;">
<img class=" mb-2 p-2 col-12 align-self-center" style="width:60%;" src="img/logo_responsiva.png"/>
    <button class="mb-2 m-0 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('CIP')">INVESTOR'S PAYMENT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Cbp')">COORDINATOR'S PAYMENT</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Dlr')">DOLLAR</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Pwd')">PASSWORD</button>
    <button class="mb-2 p-2 btn btn-outline-light btn-block col-12 me-auto" onclick="Submeter('Ext')">EXIT</button>
    <div class="text-center">WALLET</div>
    <div class="text-center col-12" style="font-size:70%;"><%out.write(crt);%></div>
    <div class="text-center">NETWORD: BEP-20</div>
    <div class="text-center">COIN: USDT</div>
    <img class="m-auto mt-0 col-4  " src="img/qrcode.jpeg">
    
</div>
</div>
<%
	}
%>

</nav>