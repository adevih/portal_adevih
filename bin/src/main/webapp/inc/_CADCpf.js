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
CADCpf.classe.prototype.getIdentidade=
	function() {
		return this.obj.Identidade;
	};
CADCpf.classe.prototype.getTipoDocumento=
	function() {
		return this.obj.TipoDocumento;
	};
CADCpf.classe.prototype.getEndereco=
	function() {
		return this.obj.Endereco;
	};
CADCpf.classe.prototype.getCep=
	function() {
		return this.obj.Cep;
	};
CADCpf.classe.prototype.getCarteira=
	function() {
		return this.obj.Carteira;
	};
CADCpf.classe.prototype.getEnderecoCarteira=
	function() {
		return this.obj.EnderecoCarteira;
	};
CADCpf.classe.prototype.getEnderecoAlternativo=
	function() {
		return this.obj.EnderecoAlternativo;
	};
CADCpf.classe.prototype.getPix=
	function() {
		return this.obj.Pix;
	};
CADCpf.classe.prototype.getBanco=
	function() {
		return this.obj.Banco;
	};
CADCpf.classe.prototype.getAgencia=
	function() {
		return this.obj.Agencia;
	};
CADCpf.classe.prototype.getContaCorrente=
	function() {
		return this.obj.ContaCorrente;
	};
CADCpf.classe.prototype.getFavorecido=
	function() {
		return this.obj.Favorecido;
	};
CADCpf.classe.prototype.getTipoCadastro=
	function() {
		return this.obj.TipoCadastro;
	};
CADCpf.classe.prototype.getEmail=
	function() {
		return this.obj.Email;
	};
CADCpf.classe.prototype.getDataInativo=
	function() {
		return this.obj.DataInativo;
	};
CADCpf.classe.prototype.getTelegram=
	function() {
		return this.obj.Telegram;
	};
CADCpf.classe.prototype.getFranquia=
	function() {
		return this.obj.Franquia;
	};
CADCpf.classe.prototype.getIdOrigem=
	function() {
		return this.obj.IdOrigem;
	};
CADCpf.classe.prototype.getMensagem=
	function() {
		return this.obj.Mensagem;
	};
CADCpf.classe.prototype.isExiste=
	function() {
		return (this.obj.Existe == "S");
	};
CADCpf.classe.prototype.isPermiteIncluir=
	function() {
		return (this.obj.PermiteIncluir == "S");
	};
