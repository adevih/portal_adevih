function valor(a) {
	pt = /\./g;
	b = "0";
	if (a.length > 0) {
		b = a.replace(pt, "").replace(",", ".");
	}
	r = parseFloat(b);
	return r;
}

function _procTab(e, a) {
	o = window.event || e;
	tc = o.which || o.keyCode
	ac = a.split("|");
//	alert(tc);
	if (tc == 13) {
		for (i=0; i<ac.length; i++) {
			fc = ac[i].split(";");
			if ( tc == parseInt(fc[0]) ) {
				if ( fc[1] == "foco" ) {
//					alert(fc[2]);
					document.getElementById(fc[2]).focus();
					return false;
				}
			}
		}
		return false;
	}
	if (tc==9) return false;
	if (tc==27) {
		Submeter('#');
		return false;
	}
	return true;
}
// -------------------- Base Valor/Quantidade ------------------------------- //
var vv = false;		// 	Indica vírgula do ponto decimal;
var dd = false;		// 	Indica preenchimento das cadas decimais
var tt = false;		//	Indica preenchimento das casas não decimais
function _procNumber(e, a) {
	o = window.event || e;
	tc = o.which || o.keyCode
	ac = a.split("|");
	for (i=0; i<ac.length; i++) {
		fc = ac[i].split(";");
		if ( tc == parseInt(fc[0]) ) {
			if ( fc[1] == "foco" ) {
				document.getElementById(fc[2]).focus();
				return false;
			}
		}
	}

	if (tc==46) {
		x = e.target || e.srcElement;
		if ( x.value.length > 0 ) {
			x.value = x.value.substring(0, x.value.length - 1);
		}
		return true;
	}

	if (vv && (tc==188||tc==110)) return false;
	if (tc==9||tc==8||tc==109||tc==189) return true;
	if (dd) return false;
	if (tc==188||tc==110) return true;
	if (tt) return false;
	if ( (tc<96||tc>105) && (tc<48||tc>57) ) return false;
	return true;
}
function _procDecimal(campo, v, l) {
	cp = campo.value;
	ps = cp.indexOf(",");
	dd = false;
	tt = false;
	vv = false;
	if (ps > -1) {
		vv = true;
		if ((cp.length - (ps + 1)) == v) {
			dd = true;
		}
	} else {
		vv = false;
		if (cp.length == l) {
			tt = true;
		}
	}
}
// -------------------- Base Valor/Quantidade ------------------------------- //
