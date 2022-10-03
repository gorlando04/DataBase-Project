package br.ufscar.dc.pibd.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Formatter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.DateFormatter;

import br.ufscar.dc.pibd.dao.AbordagemDAO;
import br.ufscar.dc.pibd.domain.Abordagem;
import br.ufscar.dc.pibd.util.Erro;

@WebServlet(urlPatterns = { "/abordagem/*" })
public class AbordagemController extends HttpServlet{

	private static final long serialVersionUID = 1L;

    private AbordagemDAO abordagemDao;
    
    @Override
    public void init() {
        abordagemDao = new AbordagemDAO();
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
    
	/*
	 * private Map<Long, String> getAbordagem() { Map <Long,String> abordagens = new
	 * HashMap<>(); for (Abordagem abordagem: new AbordagemDAO().getAll()) {
	 * abordagens.put(abordagem.getIdAbordagem(), abordagem.getEmailPrincipal()); }
	 * return abordagens; }
	 */
    
    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/formularioAbordagem.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        int idCompostoPor = Integer.parseInt(request.getParameter("idCompostoPor"));
        String emailPrincipal = request.getParameter("emailPrincipal");
        LocalDate dataHoraAbordagem = LocalDate.parse(request.getParameter("dataHoraAbordagem"), formatter);
        String conteudo = request.getParameter("conteudo");
        String meioComunicacao1 = request.getParameter("meioComunicacao1");
        String meioComunicacao2 = request.getParameter("meioComunicacao2");
        String meioComunicacao3 = request.getParameter("meioComunicacao3");
 
        Abordagem abordagem = new Abordagem(idCompostoPor, emailPrincipal, dataHoraAbordagem, conteudo, meioComunicacao1, meioComunicacao2, meioComunicacao3);
        abordagemDao.insert(abordagem);
        response.sendRedirect("home");
    }

    private void apresentaHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/homeAbordagem.jsp");
        dispatcher.forward(request, response);
    }
}
