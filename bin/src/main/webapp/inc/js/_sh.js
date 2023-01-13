var lTop, lLeft;
var helpTop				= 100;
var helpLeft			= 200;
var helpShow			= true;
var helpMove			= false;
var frmHelp				= null;

function mouseDown() {
var mp;
	helpMove = false;
	mp = findMoveable(window.event.srcElement);
	if (!window.event.altKey) {
		if ((mp) && (mp.name=='divLista')) {
			helpMove = true;
			frmHelp  = mp;
		}
	}
	lLeft = window.event.x;
	lTop = window.event.y;
}
document.onmousedown = mouseDown;
function mouseMove() {
var i, dLeft, dTop;
	if (window.event.button == 1 && (helpMove)) {
	    sx = window.event.x;
		sy = window.event.y;
	    dLeft = sx - lLeft;
		dTop = sy - lTop;
		moveElement(frmHelp, dLeft, dTop);
		lLeft = sx;
		lTop = sy;
		return false;
	}
}
document.onmousemove = mouseMove;
function mouseUp() {
	if 	(helpMove) {
		tm = document.all["divLista"].style.left;
		Lf = parseInt(tm.substring(0, tm.lastIndexOf("px")));
		tm = document.all["divLista"].style.top;
		Tp = parseInt(tm.substring(0, tm.lastIndexOf("px")));
		if (Lf != helpLeft) {
			tm = document.all["divLista"].style.left;
			tm = tm.substring(0, tm.lastIndexOf("px"));
			setCookieValue('helpLeft', tm);
			helpLeft = parseInt(tm.substring(0, tm.lastIndexOf("px")));
		}
		if (Tp  != helpTop) {
			tm = document.all["divLista"].style.top;
			tm = tm.substring(0, tm.lastIndexOf("px"));
			setCookieValue('helpTop', tm);
			helpTop = parseInt(tm.substring(0, tm.lastIndexOf("px")));
		}
	}
	helpMove = false;
}
document.onmouseup = mouseUp;
function moveElement(mp, dLeft, dTop) {
var e;
	e = mp;
    e.style.posTop += dTop;
    e.style.posLeft += dLeft;
}
function findMoveable(e) {
	if (e.name=='divLista') {
		return e;
	}
	if (e.tagName == "BODY")
		return null;
	return findMoveable(e.parentElement);
}
function rfalse() {
	return false;
}
document.onselectstart = rfalse;
function showIni() {
	if (getCookie('helpShow')=='true')
		getHelp();
}
function getHelp() {
	document.all["divLista"].style.left = getPosicao('helpLeft', helpLeft);
	document.all["divLista"].style.top  = getPosicao('helpTop', helpTop);
	setCookieValue('helpShow', helpShow);
	if (helpShow) {
		document.all["divLista"].style.display    = 'block';
		document.all["divLista"].style.visibility = 'visible';
		helpShow = false;
	} else {
		document.all["divLista"].style.visibility = 'hidden';
		document.all["divLista"].style.display    = 'none';
		helpShow = true;
	}
	return false;
}

function setCookieValue(name,value) {
	var expdate = new Date ();
	FixCookieDate (expdate);
	expdate.setTime (expdate.getTime() + (60 * 60 * 360000));
	SetCookie(name, value, expdate, null, null);
}
function FixCookieDate (date) {
	var base = new Date(0);
	var skew = base.getTime();
	if (skew > 0)
	    Date.setTime (date.getTime() - skew);
}
function SetCookie (name,value,expires,path,domain,secure) {
	document.cookie = name + "=" + escape (value) + ((expires) ? "; expires=" + expires.toGMTString() : "") + ((path) ? "; path=" + path : "") + ((domain) ? "; domain=" + domain : "") + ((secure) ? "; secure" : ""); 
}
function getPosicao(Nome, Posicao) {
	ret = parseInt("0");
	tmp = getCookie(Nome);
	if (tmp == null) {
		setCookieValue(Nome, Posicao);
		ret = Posicao;
	} else {
               if (tmp.length>0) {
                  ret = parseInt(tmp);
               }
	}
	return ret;
}
function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) { 
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1) 
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		} 
	}
}
