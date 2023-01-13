var r_start=new Date();
    r_start=Date.parse(r_start)/1000;
var r_counts=1740;


var net							=	new Object();
net.READY_STATE_UNINITIALIZED	=	0;
net.READY_STATE_LOADING			=	1;
net.READY_STATE_LOADED			=	2;
net.READY_STATE_INTERACTIVE		=	3;
net.READY_STATE_COMPLETE		=	4;

net.ContentLoader=
	function(url, onload, onerror, method, params, contentType) {
		this.req=null;
		this.onload	=onload;
		this.onerror=(onerror) ? onerror : this.defaultError;
		this.loadXMLDoc(url,method,params,contentType);
	}

net.ContentLoader.prototype.loadXMLDoc=
	function(url, method, params, contentType) {
		if (!method) {
			method="GET";
		}
		if (!contentType && method=="POST") {
			contentType='application/x-www-form-urlencoded';
		}
		if (window.XMLHttpRequest) {
			this.req=new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			this.req=new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (this.req) {
			try {
				var loader=this;
				this.req.onreadystatechange=
					function() {
						net.ContentLoader.onReadyState.call(loader);
					}
				this.req.open(method,url,true);
				if (contentType) {
					this.req.setRequestHeader('Content-Type', contentType);
				}
				this.req.send(params);
			} catch (err) {
				this.onerror.call(this);
			}
		}
	}

net.ContentLoader.onReadyState=
	function() {
		var req=this.req;
		var ready=req.readyState;
		if (ready==net.READY_STATE_COMPLETE) {
			var httpStatus=req.status;
			if (httpStatus==200 || httpStatus==0) {
				this.onload.call(this);
			} else {
				this.onerror.call(this);
			}
		}
	}

net.ContentLoader.prototype.defaultError=
	function() {
		alert("Erro leitura!\n\nreadyState:"+this.req.readyState+"\nstatus: "+this.req.status+"\nheaders: "+this.req.getAllResponseHeaders());
	}


function logoff() {
	new net.ContentLoader("acsLogoff.jsp", null, null, "GET", null);
	alert("\nFlexNet Informática\n\nSessão encerrada!       \n\n");
}

function r_Redir(){
  var r_now=new Date();
  r_now=Date.parse(r_now)/1000;
  var r_x=parseInt(r_counts-(r_now-r_start),10);
//  window.status = r_x;
  if(r_x>0){
    timerID=setTimeout("r_Redir()", 100)
  }else{
//    alert('ATENÇÃO:\n\nSolicitamos que não utilizem o sistema pelos próximo 10 minutos,\nestamos realizando manutenções necessárias para melhor atender suas necessidades.\n\nObrigado pela compreenção');
//    alert('ATENÇÃO:\n\nTempo de sessão expirou!       \n\n');
	window.onunload = logoff;
	window.onabort = logoff;
    self.close();
//    location.href="http://192.168.0.4/intranet/admSair.jsp";
  }
}

window.setTimeout('r_Redir()',100);
