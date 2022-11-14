<%-- 
    Document   : cadastrarCliente
    Created on : 09/11/2022, 22:15:43
    Author     : JUNIOR-PC
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.ClienteController"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang=”pt-br”>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Clientes</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="cliente.css">
<script src="cliente.js"></script>

</head>
<body>
	<%
	
		ClienteController controller = new ClienteController();		
		Cliente cli = new Cliente();
		
		
		
		
		
		
		
	
	

	%>

	<div id="main-container">
		<h1>CADASTRAR NOVO CLIENTE</h1>
		
		<button style="margin-left:-15rem;" class="btn btn-outline-primary botoes" type="button" onclick="navegar('listarCliente.jsp')">LISTA CLIENTES</button>
		<form id="myForm" action="serviceCliente.jsp" method="post"
			onsubmit="return check_form()">
			
			<div class="full-box" style="display:none" >
				 
				<input class="text required" 
					type="text" name="idCliente" id="idCliente"   value="0"
					>
			</div>			

			<div class="full-box">
				<label for="name">Nome Completo</label> 
				
					 <input class="text required" type="text" name="name" id="name" placeholder="Digite seu nome" data-required data-min-length="3" data-max-length="100">
			</div>
			
			<div class="half-box spacing">
				<label for="cpf">CPF</label> <input class="text required"
					type="text" name="cpf" id="cpf" placeholder="Digite seu CPF" 
					maxlength="11"
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
			</div>
			<div class="half-box">
				<label for="email">E-mail</label> <input class="text required"
					type="email" name="email" id="email"  
					placeholder="Digite seu e-mail" data-min-length="2"
					data-email-validate>
			</div>
			<div class="half-box spacing">
				<label for="fone">Telefone</label> <input class="text required"
					type="text" name="fone" id="fone" maxlength="15"     />
			</div>
			<div class="half-box">
				<label for="data-nasc">Data Nascimento</label> <input
					class="text required" type="date" name="data-nasc" id="data-nasc"   >
			</div>

			<div class="full-box">
				<input class="text required" id="btn-submit" type="submit"
					value="Registrar">
			</div>
		</form>
	</div>
	<p class="error-validation template"></p>

</body>
<script type="text/javascript" src="valida.js"></script>
</html>