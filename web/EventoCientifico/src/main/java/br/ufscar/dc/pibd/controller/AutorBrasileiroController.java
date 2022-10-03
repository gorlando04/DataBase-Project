package br.ufscar.dc.pibd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.pibd.domain.AutorBrasileiro;
import br.ufscar.dc.pibd.domain.Login;
import br.ufscar.dc.pibd.util.Erro;
import br.ufscar.dc.pibd.domain.AutorBrasileiro;
import br.ufscar.dc.pibd.dao.AutorBrasileiroDAO;

@WebServlet(urlPatterns = { "/autorBrasileiro/*" })
public class AutorBrasileiroController extends HttpServlet{

	private static final long serialVersionUID = 1L;

    private AutorBrasileiroDAO autorBrasileiroDao;
    
    @Override
    public void init() {
        autorBrasileiroDao = new AutorBrasileiroDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

		/*
		 * Login usuario = (Login) request.getSession().getAttribute("usuarioLogado");
		 * if (usuario == null) { Erro erro = new
		 * Erro("É necessário estar logado para acessar esta página.");
		 * request.setAttribute("mensagens", erro);
		 * response.sendRedirect("../views/login.jsp"); return; }
		 * 
		 * if (usuario.getMembroOrganizacaoBrasileiro() != null ||
		 * usuario.getMembroOrganizacaoEstrangeiro() != null ||
		 * usuario.getAvaliadorBrasileiro() != null || usuario.getAvaliadorEstrangeiro()
		 * != null) { Erro erro = new Erro();
		 * erro.add("Você não tem permissão para acessar esta página.");
		 * request.setAttribute("mensagens", erro); request.setAttribute("usuario",
		 * usuario); RequestDispatcher rd =
		 * request.getRequestDispatcher("/views/error.jsp"); rd.forward(request,
		 * response); return; }
		 */
        try {
            switch(action){
                case "/cadastro":
                    apresentaFormCadastro(request, response);
                    break;
                case "/insere":
                    insere(request, response);
                    break;
                case "/home":
                	apresentaHome(request, response);
                default:
                    Erro erro = new Erro();
                    erro.add("Erro 404:");
                    erro.add("Página não encontrada.");
                    request.setAttribute("mensagens", erro);
                    request.setAttribute("linkVoltar", "../home");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
                    dispatcher.forward(request, response);
            }
        } catch (RuntimeException | IOException | ServletException e){
            Erro erro = new Erro();
            erro.add("Erro ao processar a requisição.");
            erro.add(e.getMessage());
            request.setAttribute("mensagens", erro);
            request.setAttribute("linkVoltar", "../autor/home");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
            dispatcher.forward(request, response);
            throw new ServletException(e);
        }
    }
    
    private Map<Long, String> getAutorBrasileiro() {
        Map <Long,String> autores = new HashMap<>();
        for (AutorBrasileiro autorBrasileiro: new AutorBrasileiroDAO().getAll()) {
            autores.put(autorBrasileiro.getId(), autorBrasileiro.getPrimeiroNome());
        }
        return autores;
    }
    
    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/formularioAutor.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        String primeiroNome = request.getParameter("primeiroNome");
        String sobrenome = request.getParameter("sobrenome");
        String cep = request.getParameter("cep");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String filiacao = request.getParameter("filiacao");
        int ddi = Integer.parseInt(request.getParameter("ddi"));
        int ddd = Integer.parseInt(request.getParameter("ddd"));
        int prefixo = Integer.parseInt(request.getParameter("prefixo"));
        int numeroTelefone = Integer.parseInt(request.getParameter("numeroTelefone"));
        String login = request.getParameter("login");
        String dominio = request.getParameter("dominio");
        Long cpfPessoa = Long.parseLong(request.getParameter("cpf"));
        String pais = request.getParameter("pais");
        String estado = request.getParameter("estado");
        String cidade = request.getParameter("cidade");
        String bairro = request.getParameter("bairro");
        String logradouro = request.getParameter("logradouro");
        String complemento = request.getParameter("complemento");
 
        AutorBrasileiro autorBrasileiro = new AutorBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                cpfPessoa, pais, estado, cidade, bairro, logradouro, complemento);
        autorBrasileiroDao.insert(autorBrasileiro);
        response.sendRedirect("home");
    }

    private void apresentaHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/homeAutor.jsp");
        dispatcher.forward(request, response);
    }
	
}
