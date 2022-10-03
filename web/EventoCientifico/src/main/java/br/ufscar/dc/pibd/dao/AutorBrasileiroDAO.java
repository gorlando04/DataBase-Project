package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.math.BigInteger;

import br.ufscar.dc.pibd.domain.AutorBrasileiro;

public class AutorBrasileiroDAO extends GenericDAO{

	public void insert(AutorBrasileiro autorBrasileiro) {
	
		String sql = "call InsertAutorBrasileiro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, autorBrasileiro.getPrimeiroNome());
            statement.setString(2, autorBrasileiro.getSobrenome());
            statement.setString(3, autorBrasileiro.getCep());
            statement.setInt(4, autorBrasileiro.getNumero());
            statement.setString(5, autorBrasileiro.getFiliacao());
            statement.setInt(6, autorBrasileiro.getDdi());
            statement.setInt(7, autorBrasileiro.getDdd());
            statement.setInt(8, autorBrasileiro.getPrefixo());
            statement.setInt(9, autorBrasileiro.getNumeroTelefone());
            statement.setString(10, autorBrasileiro.getLogin());
            statement.setString(11, autorBrasileiro.getDominio());
            statement.setLong(12, autorBrasileiro.getCpfPessoa());
            statement.setString(13, autorBrasileiro.getPais());
            statement.setString(14, autorBrasileiro.getEstado());
            statement.setString(15, autorBrasileiro.getCidade());
            statement.setString(16, autorBrasileiro.getBairro());
            statement.setString(17, autorBrasileiro.getLogradouro());
            statement.setString(18, autorBrasileiro.getComplemento());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public AutorBrasileiro get(Long cpf) {
		AutorBrasileiro autorBrasileiro = null;

        String sql = "SELECT * from Autor, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, cpf);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String primeiroNome = resultSet.getString("primeiroNome");
                String sobrenome = resultSet.getString("sobrenome");
                String cep = resultSet.getString("cep");
                int numero = resultSet.getInt("numero");
                String filiacao = resultSet.getString("filiacao");
                int ddi = resultSet.getInt("ddi");
                int ddd = resultSet.getInt("ddd");
                int prefixo = resultSet.getInt("prefixo");
                int numeroTelefone = resultSet.getInt("numeroTelefone");
                String login = resultSet.getString("login");
                String dominio = resultSet.getString("dominio");
                Long cpfPessoa = resultSet.getLong("cpf");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String logradouro = resultSet.getString("logradouro");
                String complemento = resultSet.getString("complemento");

                autorBrasileiro = new AutorBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                        cpfPessoa, pais, estado, cidade, bairro, logradouro, complemento);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return autorBrasileiro;
    }
	
	public List<AutorBrasileiro> getAll() {

        List<AutorBrasileiro> listaAutorBrasileiro = new ArrayList<>();

        String sql = "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
            	String primeiroNome = resultSet.getString("primeiroNome");
                String sobrenome = resultSet.getString("sobrenome");
                String cep = resultSet.getString("cep");
                int numero = resultSet.getInt("numero");
                String filiacao = resultSet.getString("filiacao");
                int ddi = resultSet.getInt("ddi");
                int ddd = resultSet.getInt("ddd");
                int prefixo = resultSet.getInt("prefixo");
                int numeroTelefone = resultSet.getInt("numeroTelefone");
                String login = resultSet.getString("login");
                String dominio = resultSet.getString("dominio");
                Long cpfPessoa = resultSet.getLong("cpf");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String logradouro = resultSet.getString("logradouro");
                String complemento = resultSet.getString("complemento");

                AutorBrasileiro autorBrasileiro = new AutorBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                        cpfPessoa, pais, estado, cidade, bairro, logradouro, complemento);
                listaAutorBrasileiro.add(autorBrasileiro);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaAutorBrasileiro;
    }
}
