<%-- <%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_ADMINISTRADOR || Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FINANCEIRO || Integer.parseInt(txtAss) == CADColaborador.CADASTRO_FRANQUIA || Integer.parseInt(txtAss) == CADColaborador.CADASTRO_PAGAMENTOS)
	{
%>
<link rel="stylesheet" href="./css/style.css">
<% } %>

<%
	if ( Integer.parseInt(txtAss) == CADColaborador.CADASTRO_CONSULTA )
	{
%>


<% } %> --%>
<link rel="stylesheet" href="./css/style1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
        <!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/solid.min.js" integrity="sha512-dcTe66qF6q/NW1X64tKXnDDcaVyRowrsVQ9wX6u7KSQpYuAl5COzdMIYDg+HqAXhPpIz1LO9ilUCL4qCbHN5Ng==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js" integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

        // let i = +localStorage.getItem("i");
        // window.addEventListener("storage", storageChanged, false);
        // localStorage.setItem("i", i+1);

        // function storageChanged(event) {
        //     if ( event.newValue <= i ){
        //     window.open("index.jsp", "_self");
        //     window.close();
        //     }
        //     else{
        //         localStorage.setItem("i", i+1); // torna-se o novo dono
        //     }
        // }
</script>

<nav class="navbar d-inline-flex row col-12 m-0 p-0 text-center h-auto justify-content-evenly">
        <%-- <button type="button" id="sidebarCollapse"  class="btn btn-dark d-inline-block d-none d-lg-block  d- ml-auto bnormal">
            <i class="fas fa-align-justify bnormal" style="color:#fff;"></i>
                <span style="color:#fff;">Menu</span>
        </button> --%>
		<span class="col-6 col-lg-12 m-0 p-0 text-center" style="font-size:100%; color:#fff;">User: <%=txtOwn%> </span>
        <%-- <span class="col-6 col-lg-12 m-0 p-0 text-center" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Hash: <%out.write(crt);%></span> --%>
            <button class="btn btn-dark d-block d-lg-none m-1 col-2" type="button" data-bs-toggle="offcanvas" data-target="#navbarSupportedContent" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-align-justify"></i>
            </button>
</nav>