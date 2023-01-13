function _backgroundColor(_color) {
	var _corAnt = "";
	_funf = "function () {_corAnt=this.style.backgroundColor;this.style.backgroundColor='" + _color + "';";
	_funb = "function () {this.style.backgroundColor=_corAnt;";
	var f = 0;
	inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++) {
		if ( inputs[i].className == "input" || inputs[i].className == "input2" ) {
			var _onfocus = inputs[i].onfocus + "";
			var _onblur = inputs[i].onblur + "";
			if ( _onfocus.indexOf("{") > -1 ) {
				for (f=_onfocus.length;f>1;f--) {
					if (_onfocus.charAt(f) == '}' ) {
						break;
					}
				}
				_onfocus = _funf + _onfocus.substring(_onfocus.indexOf("{")+1, f);
			} else {
				_onfocus = _funf;
			}
			if ( _onblur.indexOf("{") > -1 ) {
				for (f=_onblur.length;f>1;f--) {
					if (_onblur.charAt(f) == '}' ) {
						break;
					}
				}
				_onblur = _funb + _onblur.substring(_onblur.indexOf("{")+1, f);
			} else {
				_onblur = _funb;
			}
			eval("inputs[i].onfocus=" + _onfocus + "};");
			eval("inputs[i].onblur=" + _onblur +"};" );
		}
	}
}