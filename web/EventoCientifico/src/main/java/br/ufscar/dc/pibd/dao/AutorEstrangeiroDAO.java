package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import br.ufscar.dc.pibd.domain.AutorEstrangeiro;

public class AutorEstrangeiroDAO extends GenericDAO{

	public void insert(AutorEstrangeiro autorEstrangeiro) {
		
		String sql = "call InsertAutorEstrangeiro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, autorEstrangeiro.getPrimeiroNome());
            statement.setString(2, autorEstrangeiro.getSobrenome());
            statement.setString(3, autorEstrangeiro.getCep());
            statement.setInt(4, autorEstrangeiro.getNumero());
            statement.setString(5, autorEstrangeiro.getFiliacao());
            statement.setInt(6, autorEstrangeiro.getDdi());
            statement.setInt(7, autorEstrangeiro.getDdd());
            statement.setInt(8, autorEstrangeiro.getPrefixo());
            statement.setInt(9, autorEstrangeiro.getNumeroTelefone());
            statement.setString(10, autorEstrangeiro.getLogin());
            statement.setString(11, autorEstrangeiro.getDominio());
            statement.setString(12, autorEstrangeiro.getNroPassaporte());
            statement.setDate(13, (Date) autorEstrangeiro.getDataEmissao());
            statement.setDate(14, (Date) autorEstrangeiro.getDataExpiracao());
            statement.setString(15, autorEstrangeiro.getGovEmissor());
            statement.setString(16, autorEstrangeiro.getPais());
            statement.setString(17, autorEstrangeiro.getEstado());
            statement.setString(18, autorEstrangeiro.getCidade());
            statement.setString(19, autorEstrangeiro.getBairro());
            statement.setString(20, autorEstrangeiro.getLogradouro());
            statement.setString(21, autorEstrangeiro.getComplemento());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public AutorEstrangeiro get(String nroPassaporte) {
		AutorEstrangeiro autorEstrangeiro = null;

        String sql = "SELECT * from Autor, Pessoa, Estrangeiro where Estrangeiro.nroPassaporte = ? and Estrangeiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, nroPassaporte);
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
                String numeroPassaporte = resultSet.getString("nroPassaporte");
                Date dataEmissao = resultSet.getDate("dataEmissao");
                Date dataExpiracao = resultSet.getDate("dataExpiracao");
                String govEmissor = resultSet.getString("govEmissor");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String logradouro = resultSet.getString("logradouro");
                String complemento = resultSet.getString("complemento");

                autorEstrangeiro = new AutorEstrangeiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                		numeroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, logradouro, complemento);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return autorEstrangeiro;
    }
	
	public List<AutorEstrangeiro> getAll() {

        List<AutorEstrangeiro> listaAutorEstrangeiro = new ArrayList<>();

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
                String numeroPassaporte = resultSet.getString("nroPassaporte");
                Date dataEmissao = resultSet.getDate("dataEmissao");
                Date dataExpiracao = resultSet.getDate("dataExpiracao");
                String govEmissor = resultSet.getString("govEmissor");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String logradouro = resultSet.getString("logradouro");
                String complemento = resultSet.getString("complemento");

                AutorEstrangeiro autorEstrangeiro = new AutorEstrangeiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                		numeroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, logradouro, complemento);
                listaAutorEstrangeiro.add(autorEstrangeiro);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaAutorEstrangeiro;
    }

}
