/*
Script: modalwindow.js
	ModalWindow - Simple javascript popup overlay to replace builtin alert, prompt and confirm.

License:
	PHP-style license.

Copyright:
	Copyright (c) 2009 [Kieron Wilson](http://kd3sign.co.uk/).

Code & Documentation:
	http://kd3sign.co.uk/examples/modalwindow/

*/
var BlackBoxWindow = {
	_iframe: null,
	_show: false,

	showHide: function () {
		if ( ! document.getElementById("boxHide") ) {
			this._iframe = document.createElement("iframe");
			this._iframe.setAttribute("id","boxHide");
//			this._iframe.setAttribute("src","about:blank");
			this._iframe.setAttribute("src","../blank.htm");
			this._iframe.setAttribute("scrolling","no");
			this._iframe.setAttribute("frameBorder","0");
			if ( ! document.all ) {
				this._iframe.setAttribute("allowTransparency","true");
			}
			this._iframe.style.display = "none";
			this._iframe.style.position = "absolute";
			this._iframe.style.top = "0";
			this._iframe.style.left = "0";
			this._iframe.style.width = "100%";
			this._iframe.style.height = "100%";
			this._iframe.style.zIndex = "10";
//			bd = this._iframe.document.createElement("body");
//			bd.setAttribute("background-color","transparent");
//			bd.style.backgroundcolor = "transparent";
			document.body.appendChild(this._iframe);
			this._show = true;
		}
		this._iframe.style.display = (this._show) ? "block" : "none";
		this._show = (this._show) ? false : true;
	}
}


var ModalWindow = {
	
	box: null,
	overlay: null,
	show: false,

	open: function() {
		var options = arguments[0] || {};
		var defaults = {
			'type': "alert",
			'opacity': "0.5",
			'width': null,
			'height': 'auto',
			'title': "Aviso",
			'text': "mensagem...",
			'yes_button': "Sim",
			'no_button': "Não",
			'cancel_button': "Cancela",
			'yes': null,
			'no': null,
			'show': false
		};

		for( key in defaults ) {
			this[key] = ( typeof options[key] != "undefined" ) ? options[key] : defaults[key] ;
		}
		
		this.close();
		if ( this.show ) {
			BlackBoxWindow.showHide();
		} else {
			showHideSelect();
		}
		this.initOverlay();
		this.initBox();
	},
	
	close: function() {
		showHideSelect();
		if( this.box && this.overlay ) {
			this.remove( this.box );
			this.box = null;
			this.remove( this.overlay );
			this.overlay = null;
		}
		this.removeEvent(document, "keyup", ModalWindow.keyup);
		this.opened = false;
	},
	
	option: function(method) {
		if( this[ method ] ) {
			if(this.type == "prompt") {
				this[ method ](this.input.value);
			} else this[ method ]();
		}
		this.close();
		if ( this.show ) {
			BlackBoxWindow.showHide();
		}
	},
	
	keyup: function(e) {
		if( ModalWindow.getKeyCode(e) == 13 ) {
			ModalWindow.option('yes');
		}
		if( ModalWindow.getKeyCode(e) == 27 ) {
			ModalWindow.option('no');
		}
	},
	
	initBox: function() {
		var dim = this.getPageSize();
		
		var boxWidth = ( ( this.width ) ? this.width : ( dim.pageWidth / 4 ) )  + "px";
		var boxHeight = ( typeof this.height == "string" ) ? "auto" : this.height + "px" ;
		
		var boxPosVCentre = ( typeof this.height == "string" ) ? 0 : ( ( dim.windowHeight / 2 ) - ( parseInt(boxHeight) / 2 ) ) ;
		var boxPosHCentre = ( ( dim.pageWidth / 2 ) - ( parseInt(boxWidth) / 2 ) );
		
		var boxPosTop = ( typeof this.height == "string" ) ? "110px" : boxPosVCentre + "px" ;
		var boxPosLeft = boxPosHCentre + "px";
		
		this.box = this.element("div", {
			'class': 'ModalWindowBox',
			'styles' : {
				'width': boxWidth,
				'height': boxHeight,
				'position': "absolute",
				'top': boxPosTop,
				'left': boxPosLeft,
				'z-Index': 1000,
				'zIndex': 1000
			}
		});
		this.inject(this.box);
		
		var container = this.element("div", {
			'class': "ModalWindowContainer"
		});

		container.appendChild(this.element("h3", {
			'html': this.title
		}));

		container.appendChild(this.element("p", {
			'html': this.text
		}));
		
		var buttonContainer = this.element("div", {
			'class': "ModalWindowButtons"
		});

		switch( this.type ) {
			case "alert" :
				
				if(this.yes != false) {
					buttonContainer.appendChild(this.element("a", {
						'html': this.yes_button,
						'href': "javascript:ModalWindow.close();"
					}));
					container.appendChild(buttonContainer);
				}

			break;
			case "confirm" :

				if(this.yes) {
					buttonContainer.appendChild(this.element("a", {
						'html': this.yes_button,
						'href': "javascript:ModalWindow.option('yes');",
						'style': "font-weight: bold;"
					}));
				}
				buttonContainer.appendChild(this.element("img", {
						'src': '../img/trans1x1.gif',
						'width': '18'
					}));

				if(this.no) {
					buttonContainer.appendChild(this.element("a", {
						'html': this.no_button,
						'href': "javascript:ModalWindow.option('no');"
					}));
				}
				if(this.cancel) {
					buttonContainer.appendChild(this.element("a", {
						'html': this.cancel_button,
						'href': "javascript:ModalWindow.close();"
					}));
				}

				container.appendChild(buttonContainer);

			break;
			case "prompt" :
				
				this.input = this.element("input", {
					'name': "prompt",
					'type': "text"
				});
				container.appendChild(this.input);

				if( this.yes ) {
					buttonContainer.appendChild(this.element("a", {
						'html': ModalWindow.yes_button,
						'href': "javascript:ModalWindow.option('yes');",
						'style': "font-weight: bold;"
					}));
				}
				if ( ModalWindow.cancel_button != null ) {
					buttonContainer.appendChild(this.element("a", {
						'html': ModalWindow.cancel_button,
						'href': "javascript:ModalWindow.close();"
					}));
				}

				container.appendChild(buttonContainer);
			
			break;
		}
		
		this.box.appendChild(container);
		
		if(this.input) this.input.focus();
		else this.box.getElementsByTagName('a')[0].focus();
		
		if(this.yes || this.yes != false) this.addEvent(document, "keyup", ModalWindow.keyup);
		showHideSelect();
		
	},
	
	initOverlay: function() {
		var dim = this.getPageSize();
		this.overlay = this.element("div", {
			'styles': {
				'backgroundColor': "black",
				'opacity': this.opacity,
				'position': "absolute",
				'top': "0px",
				'left': "0px",
				'width': dim.pageWidth + "px",
				'height': dim.pageHeight + "px",
				'z-Index': 999,
				'zIndex': 999
			}
		});
		this.inject(this.overlay);
	},
	
	inject: function(el) {
		document.body.appendChild( el );
	},
	
	remove: function(el) {
		document.body.removeChild( el );
	},
	
	element: function() {
		var tag = arguments[0], options = arguments[1];
		var el = document.createElement(tag);
		var attributes = {
			'html': 'innerHTML',
			'class': 'className',
			'for': 'htmlFor',
			'text': 'innerText'
		};
		if( options ) {
			if( typeof options == "object" ) {
				for( name in options ) {
					var value = options[name];
					if(name == "styles") {
						this.setStyles(el, value);
					} else if (attributes[name]) { 
						el[attributes[name]] = value; 
					} else { 
						el.setAttribute(name, value); 
					}
				}
			}
		}
		return el;
	},
	
	addEvent: function( o, e, f ) {
		if(o) {
			if( o.addEventListener ) o.addEventListener(e, f, false );
			else if( o.attachEvent ) o.attachEvent( 'on'+e , f);
		}
	},
	
	removeEvent: function( o, e, f ) {
		if(o) {
			if( o.removeEventListener ) o.removeEventListener( e, f, false );
			else if( o.detachEvent ) o.detachEvent( 'on'+e, f );
		}
	},
	
	getKeyCode: function(e) {
		if(!e) e = window.event ;
		return (e) ? (e.which || e.keyCode) : null ;
	},
	
	setStyles: function(e, o) {
		for( k in o ) {
			this.setStyle(e, k, o[k]);
		}
	},
	
	setStyle: function(e, p, v) {
		if ( p == 'opacity' ) {
			if (window.ActiveXObject) {
				e.style.filter = "alpha(opacity=" + v*100 + ")";
			}
			e.style.opacity = v;
		} else {
			e.style[p] = v;
		}
	},
		
	getPageSize: function() {
		var xScroll, yScroll;
		
		if (window.innerHeight && window.scrollMaxY) {	
			xScroll = window.innerWidth + window.scrollMaxX;
			yScroll = window.innerHeight + window.scrollMaxY;
		} else if (document.body.scrollHeight > document.body.offsetHeight) {
			xScroll = document.body.scrollWidth;
			yScroll = document.body.scrollHeight;
		} else {
			xScroll = document.body.offsetWidth;
			yScroll = document.body.offsetHeight;
		}
		
		var windowWidth, windowHeight;
	
		if (self.innerHeight) {
			if(document.documentElement.clientWidth){
				windowWidth = document.documentElement.clientWidth; 
			} else {
				windowWidth = self.innerWidth;
			}
			windowHeight = self.innerHeight;
		} else if (document.documentElement && document.documentElement.clientHeight) {
			windowWidth = document.documentElement.clientWidth;
			windowHeight = document.documentElement.clientHeight;
		} else if (document.body) {
			windowWidth = document.body.clientWidth;
			windowHeight = document.body.clientHeight;
		}	

		if(yScroll < windowHeight){
			pageHeight = windowHeight;
		} else { 
			pageHeight = yScroll;
		}

		if(xScroll < windowWidth){	
			pageWidth = xScroll;		
		} else {
			pageWidth = windowWidth;
		}
	
		return { 'pageWidth': pageWidth, 'pageHeight': pageHeight, 'windowWidth' : windowWidth, 'windowHeight': windowHeight };
	}
	
};

function showHideSelect() {
var inputCtrls = document.getElementsByTagName("select");
var inputCtrlsNo = inputCtrls.length;
	for (var x=0;x<inputCtrlsNo;x++) {
		inputCtrls[x].style.display = inputCtrls[x].style.display == "none" ? "block" : "none";
	}
}

function getRespSN(mensagem, titulo, callbackYes, callbackNo, show) {
	frm = false;
	if ( show ) {
		frm = true;
	}
	modalConfirm = {
		type: "confirm",
		title: titulo,
		text: mensagem,
		yes_button: "Sim",
		no_button: "Não",
		cancel_button: null,
		yes: callbackYes,
		no: callbackNo,
		show: frm
	};
	ModalWindow.open(modalConfirm);
}

