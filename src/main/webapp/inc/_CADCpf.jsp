var CADCpf	=  new Object();
CADCpf.classe=
	function(o){
		this.obj   = o;
	};
CADCpf.classe.prototype.getCpfFormat=
	function() {
		return this.obj.CpfFormat;
	};
CADCpf.classe.prototype.getCpf=
	function() {
		return this.obj.Cpf;
	};
CADCpf.classe.prototype.getNome=
	function() {
		return this.obj.Nome;
	};
CADCpf.classe.prototype.getMensagem=
	function() {
		return this.obj.Mensagem;
	};
CADCpf.classe.prototype.isExiste=
	function() {
		return (this.obj.Existe == "S");
	};
