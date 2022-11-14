package model;
import java.util.Date;

public class Cliente {
	
	private int clienteId;
	private String nomeCompleto;
	private String cpf;
	private String telefone;
	private String email;
	private Date dataNasc;
	
	
	public Cliente() {
		super();
		
	}
	
	
	public Cliente(Date dataNasc) {
		super();
		this.dataNasc = new Date();
	}
	public int getId() {
		return clienteId;
	}
	public void setId(int clienteId) {
		this.clienteId = clienteId;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDataNasc() {
		return dataNasc;
	}
	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}
	@Override
	public String toString() {
		return "Cliente [id=" + clienteId + ", nomeCompleto=" + nomeCompleto + ", cpf=" + cpf + ", telefone=" + telefone
				+ ", email=" + email + ", dataNasc=" + dataNasc + "]\n";
	}
	
	
	

}