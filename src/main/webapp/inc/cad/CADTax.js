var CADTax	=  new Object();
CADTax.classe=
	function(o){
		this.obj   = o;
	};
 
CADTax.classe.prototype.getId=
	function() {
		return this.obj.Id;
	};
CADTax.classe.prototype.getIdPais=
	function() {
		return this.obj.IdPais;
	};
CADTax.classe.prototype.getIdFranquia=
	function() {
		return this.obj.IdFranquia;
	};
CADTax.classe.prototype.getDataInicio=
	function() {
		return this.obj.DataInicio;
	};
CADTax.classe.prototype.getDataFinal=
	function() {
		return this.obj.DataFinal;
	};

CADTax.classe.prototype.getRemuneracaoObjetivo=
	function() {
		return this.obj.RemuneracaoObjetivo;
	};
CADTax.classe.prototype.getRemuneracaoEfetivo=
	function() {
		return this.obj.RemuneracaoEfetivo;
	};
CADTax.classe.prototype.getComissaoObjetivo=
	function() {
		return this.obj.ComissaoObjetivo;
	};
CADTax.classe.prototype.getComissaoEfetivo=
	function() {
		return this.obj.ComissaoEfetivo;
	};

CADTax.classe.prototype.getFormRemuneracaoObjetivo=
	function() {
		return this.obj.FormRemuneracaoObjetivo;
	};
CADTax.classe.prototype.getFormRemuneracaoEfetivo=
	function() {
		return this.obj.FormRemuneracaoEfetivo;
	};
CADTax.classe.prototype.getFormComissaoObjetivo=
	function() {
		return this.obj.FormComissaoObjetivo;
	};
CADTax.classe.prototype.getFormComissaoEfetivo=
	function() {
		return this.obj.FormComissaoEfetivo;
	};

CADTax.classe.prototype.getMensagem=
	function() {
		return this.obj.Mensagem;
	};
