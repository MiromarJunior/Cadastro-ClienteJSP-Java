<%@page import="controller.ClienteController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service cliente</title>
</head>
<body>
	<%
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	ClienteController controller = new ClienteController();
	
	int id = Integer.parseInt(request.getParameter("idCliente"));
	
	String nomeCompleto = request.getParameter("name");
	String cpf = request.getParameter("cpf");
	String fone = request.getParameter("fone");
	String email = request.getParameter("email");
	String dataNasc = request.getParameter("data-nasc");
	
	String tipo = " ";
	if(request.getParameter("tipo") != null){
		tipo = request.getParameter("tipo");
	}
	;
	
	
	Cliente cli = new Cliente();
	cli.setId(id);
	
	
	if(tipo.equalsIgnoreCase("del")){
	
		if(controller.deleteCli(id)){
			response.sendRedirect("listarCliente.jsp?pmensagem=excluido");
		}else{
			response.sendRedirect("listarCliente.jsp?pmensagem=erroEx");
		}
		
	}else{
		
		cli.setNomeCompleto(nomeCompleto);
		cli.setCpf(cpf);
		cli.setTelefone(fone);
		cli.setEmail(email);
		cli.setDataNasc(sdf.parse(dataNasc));
		
		if (id > 0 ){
			if(controller.update(cli)){
				//response.sendRedirect("listarCliente.jsp?pmensagem=Cliente Alterado com Sucesso");		
				response.sendRedirect("listarCliente.jsp?pmensagem=sucessoU");	
			}else{
				response.sendRedirect("listarCliente.jsp?pmensagem=erroU");	
			}
			
		}else{
			if(controller.save(cli)){
						
				response.sendRedirect("listarCliente.jsp?pmensagem=sucesso");	
			}else{
				response.sendRedirect("listarCliente.jsp?pmensagem=erro");	
			}
			
		}
		
	}


	
	
	
	%>
<script type="text/javascript">
function name() {
	alert('<%=tipo%>'')
	
}
name();

</script>
</body>
</html>