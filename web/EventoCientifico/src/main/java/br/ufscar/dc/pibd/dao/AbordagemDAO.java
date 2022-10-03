package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Abordagem;

public class AbordagemDAO extends GenericDAO{

	public void insert(Abordagem abordagem) {
		
		String sql = "call InsertAbordagem(?, ?, ?, ?, ?, ?, ?) ";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setInt(1, abordagem.getIdCompostoPor());
            statement.setString(2, abordagem.getEmailPrincipal());
            statement.setDate(3, abordagem.getDataHoraAbordagem());
            statement.setString(4, abordagem.getConteudo());
            statement.setString(5, abordagem.getMeioComunicacao1());
            statement.setString(6, abordagem.getMeioComunicacao2());
            statement.setString(7, abordagem.getMeioComunicacao3());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	/*
	 * public Abordagem get(Long cpf) { Abordagem abordagem = null;
	 * 
	 * String sql =
	 * "SELECT * from Autor, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa"
	 * ;
	 * 
	 * try { Connection conn = this.getConnection(); PreparedStatement statement =
	 * conn.prepareStatement(sql);
	 * 
	 * statement.setLong(1, cpf); ResultSet resultSet = statement.executeQuery(); if
	 * (resultSet.next()) { String primeiroNome =
	 * resultSet.getString("primeiroNome"); String sobrenome =
	 * resultSet.getString("sobrenome"); String cep = resultSet.getString("cep");
	 * int numero = resultSet.getInt("numero"); String filiacao =
	 * resultSet.getString("filiacao"); int ddi = resultSet.getInt("ddi"); int ddd =
	 * resultSet.getInt("ddd"); int prefixo = resultSet.getInt("prefixo"); int
	 * numeroTelefone = resultSet.getInt("numeroTelefone"); String login =
	 * resultSet.getString("login"); String dominio =
	 * resultSet.getString("dominio"); Long cpfPessoa = resultSet.getLong("cpf");
	 * String pais = resultSet.getString("pais"); String estado =
	 * resultSet.getString("estado"); String cidade = resultSet.getString("cidade");
	 * String bairro = resultSet.getString("bairro"); String logradouro =
	 * resultSet.getString("logradouro"); String complemento =
	 * resultSet.getString("complemento");
	 * 
	 * abordagem = new Abordagem(idCompostoPor, emailPrincipal, dataHoraAbordagem,
	 * conteudo, meioComunicacao1, meioComunicacao2, meioComunicacao3);
	 * 
	 * }
	 * 
	 * resultSet.close(); statement.close(); conn.close(); } catch (SQLException e)
	 * { throw new RuntimeException(e); } return abordagem; }
	 * 
	 * public List<Abordagem> getAll() {
	 * 
	 * List<Abordagem> listaAbordagem = new ArrayList<>();
	 * 
	 * String sql =
	 * "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";
	 * 
	 * try { Connection conn = this.getConnection(); Statement statement =
	 * conn.createStatement();
	 * 
	 * ResultSet resultSet = statement.executeQuery(sql); while (resultSet.next()) {
	 * 
	 * int idCompostoPor = resultSet.getInt("idCompostoPor"); String emailPrincipal
	 * = resultSet.getString(""); Date dataHoraAbordagem =
	 * resultSet.getDate("cidade"); String bairro = resultSet.getString("bairro");
	 * String logradouro = resultSet.getString("logradouro"); String complemento =
	 * resultSet.getString("complemento");
	 * 
	 * Abordagem abordagem = new Abordagem(idCompostoPor, emailPrincipal,
	 * dataHoraAbordagem, conteudo, meioComunicacao1, meioComunicacao2,
	 * meioComunicacao3); listaAbordagem.add(abordagem); }
	 * 
	 * resultSet.close(); statement.close(); conn.close(); } catch (SQLException e)
	 * { throw new RuntimeException(e); } return listaAbordagem; }
	 */
}
