<%-- 
    Document   : listarClientes
    Created on : 09/11/2022, 22:19:05
    Author     : JUNIOR-PC
--%>
<%@page import="java.util.List"%>
<%@page import="controller.ClienteController"%>
<%@page import="model.Cliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


<link rel="stylesheet" href="cliente.css">
</head>
<body>



	<%
	ClienteController controller = new ClienteController();
	List<Cliente> listaCli = controller.getAll();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyy");
	String res = request.getParameter("pmensagem");
	%>

	<div class="container-fluid" style="margin-top: 10px">
		<h1 class="titulo">Lista de Clientes</h1>
		<button class="btn btn-outline-primary botoes"
			onclick="navegar('alteraCliente.jsp?idCliente=0')">CADASTRAR</button>
		<button class="btn btn-outline-primary botoes"
			onclick="navegar('listarCliente.jsp')">LISTAR CLIENTE</button>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ALTERAÇÃO</th>
					<th>ID</th>
					<th>NOME</th>
					<th>CPF</th>
					<th>EMAIL</th>
					<th>TELEFONE</th>
					<th>DATA NASCIMENTO</th>

				</tr>
			</thead>

			<tbody>
				<%
				for (Cliente c : listaCli) {
				%>

				<tr>
					<td>
						<button class="btn btn-outline-info botoes" type="button">
							<%
							out.write(" <a style=text-decoration:none;color:black; type=button href=alteraCliente.jsp?idCliente=" + c.getId()
									+ "&segund=para>Editar</a>");
							%>
						</button>




						<p>
							<%

							%>
						</p>
						<button class="btn btn-outline-danger botoes" 
							onclick="excluir('<%=c.getId()%>')">EXCLUIR</button>
					</td>

					<td>
						<%
						out.write(String.valueOf(c.getId()));
						%>
					</td>
					<td>
						<%
						out.write(c.getNomeCompleto());
						%>
					</td>
					<td>
						<%
						out.write(c.getCpf());
						%>
					</td>
					<td>
						<%
						out.write(c.getEmail());
						%>
					</td>
					<td id="fone">
						<%
						out.write(c.getTelefone());
						%>
					</td>
					<td>
						<%
						out.write(sdf.format(c.getDataNasc()));
						%>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>


</body>
<script src="cliente.js"></script>
<script src="valida.js"></script>
<script>
function msgAlt(valor){
	
		if(valor == "sucessoU"){
			alert("Cliente Alterado com sucesso");
			return location.href="listarCliente.jsp";
		}else if(valor == "sucesso"){
			alert("Cliente Cadastrado com sucesso");
			return location.href="listarCliente.jsp";		
		}else if(valor == "erroU"){
			alert("Erro ao Tentar Alterar o cliente");
			return location.href="listarCliente.jsp";
			
		}else if(valor == "erro"){
			alert("Erro ao Tentar Cadastrar o cliente");
			return location.href="listarCliente.jsp";
			
		}
			
		
		
	
	

}

msgAlt("<%=res%>");


function excluir(id){	
	if(confirm("Deseja excluir o Cliente do ID "+id+" ?")){
	return location.href="serviceCliente.jsp?idCliente="+id+"&tipo=del";		
	}
}






</script>


</html>




<!-- 

<script type="text/javascript"> function display() {
		const urlParams = new URLSearchParams(window.location.search);
		var myParam = urlParams.get('pmensagem');
		var resp = "111"+
		console.log("001"000000000 )
		if(myParam != null){
			if(myParam == "sucessoU"){
				alert(resp);
				return myParam = null;				
			}else if(myParam == "sucesso"){
				alert("Cliente cadastrado com sucesso");
				return myParam = null;	
				
			}else{
				alert("Erro ao tentar alterar ou salvar cliente")
			}
			
		}
		
		
    }
    display();
    </script>


 -->