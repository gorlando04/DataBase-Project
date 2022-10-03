package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.AvaliadorBrasileiro;

public class AvaliadorBrasileiroDAO<interval> extends GenericDAO{

	public void insert(AvaliadorBrasileiro avaliadorBrasileiro) {
		
		String sql = "call InsertAvaliadorBrasileiro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, avaliadorBrasileiro.getPrimeiroNome());
            statement.setString(2, avaliadorBrasileiro.getSobrenome());
            statement.setString(3, avaliadorBrasileiro.getCep());
            statement.setInt(4, avaliadorBrasileiro.getNumero());
            statement.setString(5, avaliadorBrasileiro.getFiliacao());
            statement.setInt(6, avaliadorBrasileiro.getDdi());
            statement.setInt(7, avaliadorBrasileiro.getDdd());
            statement.setInt(8, avaliadorBrasileiro.getPrefixo());
            statement.setInt(9, avaliadorBrasileiro.getNumeroTelefone());
            statement.setString(10, avaliadorBrasileiro.getLogin());
            statement.setString(11, avaliadorBrasileiro.getDominio());
            statement.setLong(12, avaliadorBrasileiro.getCpfPessoa());
            statement.setString(13, avaliadorBrasileiro.getPais());
            statement.setString(14, avaliadorBrasileiro.getEstado());
            statement.setString(15, avaliadorBrasileiro.getCidade());
            statement.setString(16, avaliadorBrasileiro.getBairro());
            statement.setString(17, avaliadorBrasileiro.getLogradouro());
            statement.setString(18, avaliadorBrasileiro.getComplemento());
            statement.setString(19, avaliadorBrasileiro.getPrazoRespConv());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public AvaliadorBrasileiro get(Long cpf) {
		AvaliadorBrasileiro avaliadorBrasileiro = null;

        String sql = "SELECT * from Avaliador, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Avaliador.idAvaliador = Pessoa.idPessoa";

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
                String prazoRespAvaliador = resultSet.getString("prazoRespAvaliador");

                avaliadorBrasileiro = new AvaliadorBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                        cpfPessoa, pais, estado, cidade, bairro, logradouro, complemento, prazoRespAvaliador);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return avaliadorBrasileiro;
    }
	
	public List<AvaliadorBrasileiro> getAll() {

        List<AvaliadorBrasileiro> listaAvaliadorBrasileiro = new ArrayList<>();

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
                String prazoRespConv = resultSet.getString("prazoRespConv");

                AvaliadorBrasileiro avaliadorBrasileiro = new AvaliadorBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                        cpfPessoa, pais, estado, cidade, bairro, logradouro, complemento, prazoRespConv);
                listaAvaliadorBrasileiro.add(avaliadorBrasileiro);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaAvaliadorBrasileiro;
    }
}
