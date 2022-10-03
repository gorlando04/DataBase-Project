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

import br.ufscar.dc.pibd.dao.EventoDAO;
import br.ufscar.dc.pibd.domain.Evento;
import br.ufscar.dc.pibd.domain.Login;
import br.ufscar.dc.pibd.util.Erro;


@WebServlet(urlPatterns = { "/evento/*" })
public class EventoController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

    private EventoDAO eventoDao;

    @Override
    public void init() {
        eventoDao = new EventoDAO();
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
		 * request.setAttribute("usuario", usuario);
		 */

        try {
            switch(action){
			/*
			 * case "/cadastro": autorizacao(request, response);
			 * apresentaFormCadastro(request, response); break; case "/insere":
			 * autorizacao(request, response); insere(request, response); break;
			 */
                case "/lista":
                    lista(request, response);
                    break;
                default:
                    Erro erro = new Erro();
                    erro.add("Erro 404:");
                    erro.add("Página não encontrada.");
                    request.setAttribute("mensagens", erro);
                    request.setAttribute("linkVoltar", "../evento/lista");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
                    dispatcher.forward(request, response);
            }
        } catch (RuntimeException | IOException | ServletException e){
            Erro erro = new Erro();
            erro.add("Erro ao processar a requisição.");
            erro.add(e.getMessage());
            request.setAttribute("mensagens", erro);
            request.setAttribute("linkVoltar", "../evento/lista");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
            dispatcher.forward(request, response);
            throw new ServletException(e);
        }
    }

    private Map<String, String> getEvento() {
        Map <String,String> eventos = new HashMap<>();
        for (Evento evento: new EventoDAO().getAll()) {
            eventos.put(evento.getSigla(), evento.getNomeExtenso());
        }
        return eventos;
    }

    private void lista(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        List<Evento> listaEvento = eventoDao.getAll();
        request.setAttribute("listaEvento", listaEvento);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/listaEvento.jsp");
        dispatcher.forward(request, response);
    }
    
    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("eventos", getEvento());       
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/formularioEvento.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String sigla = request.getParameter("sigla");
        String nomeExtenso = request.getParameter("nomeExtenso");
        String pais = request.getParameter("pais");
        String estado = request.getParameter("estado");
        String cidade = request.getParameter("cidade");
        String bairro = request.getParameter("bairro");
        String cep = request.getParameter("cep");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String logradouro = request.getParameter("logradouro");
        String complemento = request.getParameter("complemento");
        

        Evento evento = new Evento(sigla, nomeExtenso, pais, estado, cidade, bairro, cep, numero, logradouro, complemento);
        eventoDao.insert(evento);
        response.sendRedirect("lista");
    }

	/*
	 * private void autorizacao(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { Login usuario = (Login)
	 * request.getSession().getAttribute("usuarioLogado"); if (usuario == null) {
	 * response.sendRedirect("../views/login.jsp"); return; } if
	 * (usuario.getMembroOrganizacaoBrasileiro() == null &&
	 * usuario.getMembroOrganizacaoEstrangeiro() == null) { Erro erro = new Erro();
	 * erro.add("Você não tem permissão para acessar esta página.");
	 * request.setAttribute("mensagens", erro); request.setAttribute("usuario",
	 * usuario); request.setAttribute("linkVoltar", "../evento/lista");
	 * RequestDispatcher rd = request.getRequestDispatcher("/views/error.jsp");
	 * rd.forward(request, response); return; } }
	 */

}
