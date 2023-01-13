function numeroValido(e) {
	o = window.event || e;
	tc = o.which || o.keyCode
	if ( tc==27 ) {
		Submeter('V');
		return false;
	}
	if ( tc == 9 || tc == 13 || tc == 38 || tc == 40 || tc == 37 || tc == 39 ) return tabE(e);
	if (tc==8||tc==109||tc==189) return true;
	if (tc==9) return false;
	if ((tc<96||tc>105)&&(tc<48||tc>57)) return false;
	return true;
}

function verTab(e) {
	o = window.event || e;
	tc = o.which || o.keyCode
	o = e.target || e.srcElement;
	if ( tc==27 ) {
		Submeter('V');
		return false;
	}
	if ( o.tagName == "BUTTON" && tc == 13 ) return true;
	if ( tc == 9 || tc == 13 || tc == 38 || tc == 40 || tc == 37 || tc == 39 ) return tabE(e);
	if (tc==8||tc==109||tc==189) return true;
	if (tc==9 || tc==13) return false;
	return true;
}

function tabE(e) {
	e = window.event || e;
	o = e.target || e.srcElement;
	kc  = e.which || e.keyCode;
	ret = null;
	if (o.tagName == "BUTTON" || o.tagName == "INPUT" && (o.type == "button" || o.type == "BUTTON") && kc == 13)	{
		o.click();
		return false;
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
			tabE(ret);
		} else {
			ret.focus();
		}
	}
	return false;
}
