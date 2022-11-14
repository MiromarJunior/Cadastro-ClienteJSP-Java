package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexaoCliente;
import model.Cliente;

public class ClienteController {

	public boolean save(Cliente cliente) {

		String sql = "INSERT INTO CLIENTE(" + "NOME_COMPLETO,CPF,TELEFONE,EMAIL,DATA_NASC)" + " VALUES (?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement statement = null;
		try {
			conn = ConexaoCliente.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setString(1, cliente.getNomeCompleto());
			statement.setString(2, cliente.getCpf());
			statement.setString(3, cliente.getTelefone());
			statement.setString(4, cliente.getEmail());
			statement.setDate(5, new java.sql.Date(cliente.getDataNasc().getTime()));
			statement.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Erro ao tentar inserir : " + e);
		} finally {
			ConexaoCliente.closeConnection(conn, statement);
		}
		return false;

	}

	public boolean update(Cliente cliente) {

		String sql = "UPDATE CLIENTE SET NOME_COMPLETO = ?, CPF = ?, TELEFONE = ?, EMAIL = ?,"
				+ " DATA_NASC = ? "
				+ " WHERE CLIENTE_ID = ?";

		Connection conn = null;
		PreparedStatement statement = null;
		try {
			conn = ConexaoCliente.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setString(1, cliente.getNomeCompleto());
			statement.setString(2, cliente.getCpf());
			statement.setString(3, cliente.getTelefone());
			statement.setString(4, cliente.getEmail());
			statement.setDate(5, new java.sql.Date(cliente.getDataNasc().getTime()));
			statement.setInt(6, cliente.getId());
			statement.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
			System.out.println("Erro ao tentar alterar : " + e);
			return false;
		} finally {

			ConexaoCliente.closeConnection(conn, statement);
		}
		return true;

	}

	public boolean deleteCli(int clienteId) {
		System.out.println("valor : "+clienteId);
		String sql = "DELETE FROM CLIENTE WHERE CLIENTE_ID = ?";

		Connection conn = null;
		PreparedStatement statement = null;
		try {
			conn = ConexaoCliente.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, clienteId);
			statement.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Erro ao tentar exluir : " + e);
			return false;
		} finally {
			ConexaoCliente.closeConnection(conn, statement);
		}
		return true;
	}

	public List<Cliente> getAll() {
		String sql = "SELECT * FROM CLIENTE ";

		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		List<Cliente> listaCliente = new ArrayList<>();
		try {
			conn = ConexaoCliente.getConnection();
			statement = conn.prepareStatement(sql);			
			resultSet = statement.executeQuery();
			if(conn != null) {
				
		
			while(resultSet.next()) {
				Cliente cliente = new Cliente();
				cliente.setId(resultSet.getInt("CLIENTE_ID"));
				cliente.setNomeCompleto(resultSet.getString("NOME_COMPLETO"));
				cliente.setCpf(resultSet.getString("CPF"));
				cliente.setTelefone(resultSet.getString("TELEFONE"));
				cliente.setEmail(resultSet.getString("EMAIL"));
				cliente.setDataNasc(resultSet.getDate("DATA_NASC"));
				
				listaCliente.add(cliente);
			}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		System.out.println("Erro ao tentar listar clientes : " + e);
		} finally {
			ConexaoCliente.closeConnection(conn, statement, resultSet);
		}
		return listaCliente;
	}
        
        
	public Cliente getClienteId(int clienteid) {
		String sql = "SELECT * FROM CLIENTE WHERE CLIENTE_ID = ? ";

		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		Cliente cli = new Cliente();
		try {
			conn = ConexaoCliente.getConnection();
			statement = conn.prepareStatement(sql);	
			statement.setInt(1, clienteid);
			resultSet = statement.executeQuery();
			if(conn != null) {
				
		
			while(resultSet.next()) {
				Cliente cliente = new Cliente();
				cliente.setId(resultSet.getInt("CLIENTE_ID"));
				cliente.setNomeCompleto(resultSet.getString("NOME_COMPLETO"));
				cliente.setCpf(resultSet.getString("CPF"));
				cliente.setTelefone(resultSet.getString("TELEFONE"));
				cliente.setEmail(resultSet.getString("EMAIL"));
				cliente.setDataNasc(resultSet.getDate("DATA_NASC"));
				
				cli = cliente;
			}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		System.out.println("Erro ao tentar listar clientes : " + e);
		} finally {
			ConexaoCliente.closeConnection(conn, statement, resultSet);
		}
	
		return cli;
	}

	
	public String validaCampoStr(String valor) {
		if(valor != null) {
			return valor;
		}
		return "";
		
	}

}