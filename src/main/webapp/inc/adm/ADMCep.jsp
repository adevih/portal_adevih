var ADMCep	=  new Object();

ADMCep.classe=
	function(o){
		this.obj   = o;
	};
ADMCep.classe.prototype.getCep=
	function() {
		return this.obj.cep;
	};
ADMCep.classe.prototype.getUf=
	function() {
		return this.obj.uf;
	};
ADMCep.classe.prototype.getCidade=
	function() {
		return this.obj.cidade;
	};
ADMCep.classe.prototype.getBairro=
	function() {
		return this.obj.bairro;
	};
ADMCep.classe.prototype.getLogradouro=
	function() {
		return this.obj.logradouro;
	};
