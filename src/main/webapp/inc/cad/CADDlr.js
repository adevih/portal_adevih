var CADDlr	=  new Object();
CADDlr.classe=
	function(o){
		this.obj   = o;
	};
CADDlr.classe.prototype.getId=
	function() {
		return this.obj.Id;
	};
CADDlr.classe.prototype.getDataBase=
	function() {
		return this.obj.DataBase;
	};
CADDlr.classe.prototype.getValor=
	function() {
		return this.obj.Valor;
	};
CADDlr.classe.prototype.getValorForm=
	function() {
		return this.obj.ValorForm;
	};
CADDlr.classe.prototype.getValorReal=
	function() {
		return this.obj.RealValor;
	};
CADDlr.classe.prototype.getRealForm=
	function() {
		return this.obj.RealForm;
	};
CADDlr.classe.prototype.getUsdValor=
	function() {
		return this.obj.UsdValor;
	};
CADDlr.classe.prototype.getUsdForm=
	function() {
		return this.obj.UsdForm;
	};
CADDlr.classe.prototype.getMensagem=
	function() {
		return this.obj.Mensagem;
	};
CADDlr.classe.prototype.isExiste=
	function() {
		return (this.obj.Existe == "S");
	};
