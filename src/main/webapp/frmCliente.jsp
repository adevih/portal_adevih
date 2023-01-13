<%@ include file="inc/incCabec.jsp"%>
<%
	int 	EXIBIR_PROCURA				=	0;
	int		EXIBIR_CONSULTA				=	1;
	int		intExibir					=	0;
	String	txtAcao						=	UTLUtils.getStringToString( request.getParameter("txtAcao") );
	String	txtBusca					=	UTLUtils.getStringToString( request.getParameter("txtBusca") );
	String	txtSss						=	UTLUtils.getStringToString( request.getParameter("txtSss") );
	String	txtAss						=	UTLUtils.getStringToString( request.getParameter("txtAss") );
	String	txtUid						=	UTLUtils.getStringToString( request.getParameter("txtUid") );
	String	txtFrq						=	UTLUtils.getStringToString( request.getParameter("txtFrq") );
	String	txtOwn						=	UTLUtils.getStringToString( request.getParameter("txtOwn") );
	String 	txtOrdem					=	UTLUtils.getStringToString( request.getParameter("txtOrdem") );
	String 	txtFranquia					=	UTLUtils.getStringToString( request.getParameter("txtFranquia") );
	String 	txtCoord					=	UTLUtils.getStringToString( request.getParameter("txtCoord") );
    String 	txtFranquiaTitulo			=	"";
    long lCoord							=	0L;
    

	if ( txtOrdem.trim().length() == 0 )
	{
		txtOrdem						=	"1";
	}
	if ( ! txtSss.equals(session.getId()) )
	{
		txtSss							=	"...";
	}
	long lFranquia						=	0L;
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA )
	{
		lFranquia						=	UTLUtils.getStringToLong(txtFrq);
	}

	String	txtOrigem					=	UTLUtils.getStringToString( request.getParameter("txtOrigem") );

	String	sWhidt						=	request.getParameter("sWhidt");
	String	sHeight						=	request.getParameter("sHeight");
	int		iHeight						=	(int)(Integer.parseInt(sHeight) * 0.67);
	int 	iWhidt						=	Integer.parseInt(sWhidt);

	String	txtCodigo					=	UTLUtils.getStringToString( request.getParameter("txtCodigo") );
	String	txtColaborador				=	UTLUtils.getStringToString( request.getParameter("txtColaborador") );
	String	txtCliente					=	UTLUtils.getStringToString( request.getParameter("txtCliente") );
	String	txtCad						=	UTLUtils.getStringToString( request.getParameter("txtCad") );
	String	txtCrt						=	UTLUtils.getStringToString( request.getParameter("txtCrt") );
	String	txtTitulo					=	"";
	long 	lColaborador				=	0L;
	long 	lCliente					=	0L;

	if ( txtCliente.trim().length() > 0 )
	{
		lCliente						=	UTLUtils.getStringToLong( txtCliente );
	}
	if ( txtColaborador.trim().length() > 0 )
	{
		lColaborador					=	UTLUtils.getStringToLong( txtColaborador );
	}
//-------------------------------------------------------------------------------------------------------------------------------	
        BigDecimal bTot					=	null;
		BigDecimal bCms					=	null;
		BigDecimal bPag				    =	null;
        BigDecimal bMdCnt				    =	new BigDecimal(UTLUtils.getStringToDouble( request.getParameter("txMdCnt") ));
        BigDecimal bMdCtm				    =	new BigDecimal(UTLUtils.getStringToDouble( request.getParameter("txMdCtm") ));
        lCoord						=	UTLUtils.getStringToLong( txtCoord );
        bPag						=	new BigDecimal(0);

        BigDecimal bTTot				=	new BigDecimal(UTLUtils.getStringToDouble( request.getParameter("txtTotInv") ));
		BigDecimal bTCms				=	new BigDecimal(UTLUtils.getStringToDouble( request.getParameter("txtTotCms") ));
		long lCoordenador				=	Long.parseLong(txtUid);
            
		CADContrato _contrato = null;
        CADClientePagamento _pag = null;
        CADColaboradorPagamento _cbpag = null;
        int i = 0;
        int x = 0;
        CADColaborador _colaborador		=	new CADColaborador( CADColaborador.BUSCA_CONTRATO, lFranquia, null, 0, 0, 0, 0, conn );
        int iAcesso						=	Integer.parseInt(txtAss);
		while ( _colaborador.next() )
		{
			if (_colaborador.getId() == lCoordenador )
			{
                    i = _colaborador.getNumeroContratos();
			}
		}
        //CADClientePagamento _pag	=	new CADClientePagamento( _contrato.getId(), 0L, null, null, 0, conn );
		//CADColaborador _colaborador		=	new CADColaborador( CADColaborador.BUSCA_CONTRATO, lFranquia, null, 0, 0, 0, 0, conn );
        //Puxando valor investido total

        if ( bTTot.doubleValue() == 0 && bTCms.doubleValue() == 0)
		{
            _contrato = new CADContrato( lCliente, lCoordenador, txtBusca, 0, 0, 0, 0, 0, conn );
            _contrato.getId();
            _contrato.getCliente().getNome();
            
			while ( _contrato.next() )
			{   
                _pag =	new CADClientePagamento( _contrato.getId(), 0L, null, null, 0, conn );
				bTTot =	bTTot.add(new BigDecimal(_contrato.getMoedaValor()));
                //
                bMdCnt = bMdCnt.add(new BigDecimal(_contrato.getMoedaValor() /_colaborador.getNumeroContratos()));
                
                while ( _pag.next() )
                {  
                    if ( _pag.getDataPagamento() != null )
                    {
                        bPag				=	bPag.add(new BigDecimal(_pag.getValorMoeda()));
                        bTCms = bTCms.add(new BigDecimal(_pag.getValorMoeda() * _contrato.getPercentualComissao()));      
                        bMdCtm = bMdCtm.add(new BigDecimal(_pag.getValorMoeda() /_colaborador.getNumeroContratos()));
                    } 
                    x = 1;
            }
            
            
		}    
        if(_contrato.next() == false){
                x = 2;
            }  
    }
    
		
		
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<link rel="icon" href="img/favIcon.png">
<link rel="stylesheet" href="css/style1.css">
<link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
    />
<title>Elysium Technology</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script type="text/javascript" src="inc/js/autotab.js"></script>
    <!-- Font Awesome JS -->
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
<script type="text/Javascript">


let html =
    `<div class="spinner-border" role="status">
        <span class="sr-only">Loading...</span>
    </div>`;
<%
    System.out.println(x);
    if(x == 0){
%>
       
    setTimeout(() => {
        this.document.querySelector(".invested").innerHTML = html
        this.document.querySelector(".comm").innerHTML = html
        this.document.querySelector(".paid").innerHTML = html
        this.document.querySelector(".contract").innerHTML = html
        this.document.querySelector(".mdContract").innerHTML = html
        this.document.querySelector(".mdCustomer").innerHTML = html
        Submeter()
    }, 1000)
<%    
    }
%> 
function Foco() {
	if ( document.form1.txtSss.value == "..." ) {
		Submeter("Ext");
	}

	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});

	let sidebar = document.querySelector(".cttDashboard")
	sidebar.style.background = "#0b7fab";


	document.onkeydown = OnKeyDown;

	if ( parseInt(document.getElementById("txtLidos").value) > 1 ) {
		document.getElementById("tbPes").getElementsByTagName("tr")[2].click();
	}
}


var varSubmit = false;
function Submeter(acao) {
<%@ include file="inc/js/incSideBar.js"%>
	varSubmit = true;
	document.form1.submit();
}
</script>
<body class="m-0 p-0 bg-black"  onload="javascript: Foco();">
    <div class="d-flex row flex-nowrap m-0 p-0 h-100 w-auto">
        <!-- Sidebar  -->
		<div class="p-0 m-0 w-auto h-100" style="background-color:#080808">
<%@ include file="inc/incSideBar2.jsp"%>
</div>
        <!-- Page Content  -->
        <div id="content" class="d-flex bg-black row p-0 m-0 flex-fill flex-grow-1 justify-content-center">
		<%@ include file="inc/incNavBar.jsp"%>
			<img class="my-5" src="img/logo_elysium.png" style="width: 350px!important; height: 200px!important;">
			<div class="panel-form w-100 ">

				<table class="d-none" border="0" cellpadding="0" cellspacing="0" width="100%" height="70%" align="center">
				<tr>
					<td width="100%" height="100%" align="center" valign="top">
						<table width="96%" border="0" cellpadding="0" cellspacing="0">
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="sWhidt"      id="sWhidt"      value="<%=sWhidt%>">
						<input type="hidden" name="sHeight"     id="sHeight"     value="<%=sHeight%>">
						<input type="hidden" name="txtFranquia" id="txtFranquia" value="<%=txtFranquia%>">
						<input type="hidden" name="txtAcao"     id="txtAcao"     value="">
						<input type="hidden" name="txtSss"      id="txtSss"      value="<%=txtSss%>">
						<input type="hidden" name="txtAss"      id="txtAss"      value="<%=txtAss%>">
						<input type="hidden" name="txtUid"      id="txtUid"      value="<%=txtUid%>">
						<input type="hidden" name="txtFrq"      id="txtFrq"      value="<%=txtFrq%>">
						<input type="hidden" name="txtOwn"      id="txtOwn"      value="<%=txtOwn%>">
						<tr>
							<td width="10%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
							<td width="90%"><img src="img/trans1x1.gif" width="100%" height="1" alt=""></td>
						</tr>
						</form>
						</table>
					</td>
				</tr>
				</table>

				<main class="d-flex justify-content-center align-items-center" id="teste" style="width: 100%; height: 25vh">
					<div class="row sparkboxes w-100 h-100 d-flex justify-content-center align-items-center">
						<div class="col-md-4 my-1 order-lg-1 order-1">
							<div class="box box1">
								<div class="details">
									<h3 class="invested" id="txtTotInv">$ <%=UTLUtils.getValor(bTTot.doubleValue())%></h3>
									<h4>Invested</h4>
								</div>
								<div id="spark1"></div>
							</div>
						</div>
						<div class="col-md-4 my-1 order-lg-2 order-3">
							<div class="box box2">
								<div class="details">
                                    <h3 class="paid">$ <%=UTLUtils.getValor(bPag.doubleValue())%></h3>
									<h4>Paid Out</h4>
									
								</div>
								<div id="spark2"></div>
							</div>
						</div>
						<div class="col-md-4 my-1 order-lg-3 order-5">
							<div class="box box3">
								<div class="details">
									<h3 class="comm">$ <%=UTLUtils.getValor(bTCms.doubleValue())%></h3>
									<h4>Commissions</h4>
								</div>
								<div id="spark3"></div>
							</div>
						</div>
						<div class="col-md-4 my-1 order-lg-4 order-2">
							<div class="box box4">
								<div class="details">
									<h3 class="contract"><%=i%></h3>
									<h4>Contracts</h4>
								</div>
								<div id="spark4"></div>
							</div>
						</div>
						<div class="col-md-4 my-1 order-lg-5 order-4">
							<div class="box box4">
								<div class="details">
									<h3 class="mdContract" id="txMdCnt">$ <%=UTLUtils.getValor(bMdCnt.doubleValue())%></h3>
									<h4>Invested<br>per Contracts</h4>
								</div>
								<div id="spark5"></div>
							</div>
						</div>
						<div class="col-md-4 my-1 order-lg-6 order-6">
							<div class="box box4">
								<div class="details">
									<h3 class="mdCustomer" id="txMdCtm">$ <%=UTLUtils.getValor(bMdCtm.doubleValue())%></h3>
									<h4>Paid Out<br>per Contract</h4>
								</div>
								<div id="spark6"></div>
							</div>
						</div>
					</div>
			    </main>
			</div>
        </div>
    </div>
<script src="apexcharts.js"></script>
<script>
	window.Apex = {
        chart: {
        animations: {
            enabled: true,
            easing: 'easeinout',
            speed: 800,
            animateGradually: {
                enabled: true,
                delay: 250
            },
            dynamicAnimation: {
                enabled: true,
                speed: 350
            }
        },
        foreColor: '#ccc',
        toolbar: {
            show: false
        },
        },
        stroke: {
        width: 3
        },
        dataLabels: {
        enabled: false
        },
        tooltip: {
        theme: 'dark'
        },
        grid: {
        borderColor: "#535A6C",
        xaxis: {
            lines: {
            show: true
            }
        }
        }
    };
  
    var spark1 = {
        chart: {
        id: 'spark1',
        group: 'sparks',
        type: 'line',
        height: 80,
        sparkline: {
            enabled: true
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            opacity: 0.2,
        }
        },
        series: [{
        data: [12, 14, 2, 47, 32, 44, 14, 55, 41, 69]
        }],
        stroke: {
        curve: 'smooth'
        },
        markers: {
        size: 0
        },
        grid: {
        padding: {
            top: 20,
            bottom: 10,
            left: 110
        }
        },
        colors: ['#0B7FAB'],
        tooltip: {
        x: {
            show: false
        },
        y: {
            title: {
            formatter: function formatter(val) {
                return '';
            }
            }
        }
        }
    }
    
    var spark2 = {
        chart: {
        id: 'spark2',
        group: 'sparks',
        type: 'line',
        height: 80,
        sparkline: {
            enabled: true
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            opacity: 0.2,
        }
        },
        series: [{
        data: [12, 14, 2, 47, 32, 44, 14, 55, 41, 69]
        }],
        stroke: {
        curve: 'smooth'
        },
        grid: {
        padding: {
            top: 20,
            bottom: 10,
            left: 110
        }
        },
        markers: {
        size: 0
        },
        colors: ['#0B7FAB'],
        tooltip: {
        x: {
            show: false
        },
        y: {
            title: {
            formatter: function formatter(val) {
                return '';
            }
            }
        }
        }
    }
    
    var spark3 = {
        chart: {
        id: 'spark3',
        group: 'sparks',
        type: 'line',
        height: 80,
        sparkline: {
            enabled: true
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            opacity: 0.2,
        }
        },
        series: [{
        data: [19, 45, 66, 32, 56, 31, 44, 33, 45, 74]
        }],
        stroke: {
        curve: 'smooth'
        },
        markers: {
        size: 0
        },
        grid: {
        padding: {
            top: 20,
            bottom: 10,
            left: 110
        }
        },
        colors: ['#0B7FAB'],
        xaxis: {
        crosshairs: {
            width: 1
        },
        },
        tooltip: {
        x: {
            show: false
        },
        y: {
            title: {
            formatter: function formatter(val) {
                return '';
            }
            }
        }
        }
    }
    
    var spark4 = {
        chart: {
        id: 'spark4',
        group: 'sparks',
        type: 'bar',
        height: 80,
        sparkline: {
            enabled: true
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            opacity: 0.2,
        }
        },
        series: [{
        data: [15, 75, 47, 65, 14, 32, 19, 54, 44, 61]
        }],
        stroke: {
        curve: 'smooth'
        },
        markers: {
        size: 0
        },
        grid: {
        padding: {
            top: 20,
            bottom: 10,
            left: 110
        }
        },
        colors: ['#0B7FAB'],
        xaxis: {
        crosshairs: {
            width: 1
        },
        },
        tooltip: {
        x: {
            show: false
        },
        y: {
            title: {
            formatter: function formatter(val) {
                return '';
            }
            }
        }
        }
    }

    var spark5 = {
        chart: {
        id: 'spark5',
        group: 'sparks',
        type: 'bar',
        height: 80,
        sparkline: {
            enabled: true
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            opacity: 0.2,
        }
        },
        series: [{
        data: [15, 75, 47, 65, 14, 32, 19, 54, 44, 61]
        }],
        stroke: {
        curve: 'smooth'
        },
        markers: {
        size: 0
        },
        grid: {
        padding: {
            top: 20,
            bottom: 10,
            left: 110
        }
        },
        colors: ['#0B7FAB'],
        xaxis: {
        crosshairs: {
            width: 1
        },
        },
        tooltip: {
        x: {
            show: false
        },
        y: {
            title: {
            formatter: function formatter(val) {
                return '';
            }
            }
        }
        }
    }

    var spark6 = {    
        chart: {
        id: 'spark6',
        group: 'sparks',
        type: 'bar',
        height: 80,
        sparkline: {
            enabled: true
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            opacity: 0.2,
        }
        },
        series: [{
        data: [15, 75, 47, 65, 14, 32, 19, 54, 44, 61]
        }],
        stroke: {
        curve: 'smooth'
        },
        markers: {
        size: 0
        },
        grid: {
        padding: {
            top: 20,
            bottom: 10,
            left: 110
        }
        },
        colors: ['#0B7FAB'],
        xaxis: {
        crosshairs: {
            width: 1
        },
        },
        tooltip: {
        x: {
            show: false
        },
        y: {
            title: {
            formatter: function formatter(val) {
                return '';
            }
            }
        }
        }
    }
  
    new ApexCharts(document.querySelector("#spark1"), spark1).render();
    new ApexCharts(document.querySelector("#spark2"), spark2).render();
    new ApexCharts(document.querySelector("#spark3"), spark3).render();
    new ApexCharts(document.querySelector("#spark4"), spark4).render();
    new ApexCharts(document.querySelector("#spark5"), spark5).render();
    new ApexCharts(document.querySelector("#spark6"), spark6).render();
    
    chartArea.render();
</script>
</body>
</html>
<%@ include file="inc/incRodape.jsp"%>
