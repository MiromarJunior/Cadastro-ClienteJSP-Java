package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexaoCliente {

	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/clientedb";
	public static final String USER = "root";
	public static final String PASS = "";

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(DRIVER);
			return DriverManager.getConnection(URL, USER, PASS);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Erro ao tentar conectar : " + e);
			e.printStackTrace();
		}
		return null;

	}

	public static void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Erro ao fechar conexão : " + e);
			}
		}
	}

	public static void closeConnection(Connection connection, PreparedStatement statement) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Erro ao fechar conexão : " + e);
			}
		}
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Erro ao fechar statement : " + e);
			}
		}
	}

	public static void closeConnection(Connection connection, PreparedStatement statement, ResultSet resultSet) {

		try {
			if (connection != null) {
				connection.close();

			}
			if (statement != null) {
				statement.close();
			}
			if (resultSet != null) {
				statement.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Erro ao fechar Conexão : " + e);
		}
	}
	

}