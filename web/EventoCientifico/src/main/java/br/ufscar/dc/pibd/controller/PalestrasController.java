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

import br.ufscar.dc.pibd.domain.Palestras;
//import br.ufscar.dc.pibd.domain.Login;
import br.ufscar.dc.pibd.util.Erro;
import br.ufscar.dc.pibd.dao.PalestrasDAO;

@WebServlet(urlPatterns = { "/palestras/*" }) // e essa url aqui??
public class PalestrasController extends HttpServlet{

	private static final long serialVersionUID = 1L;

    private PalestrasDAO palestrasDao;
    
    @Override
    public void init() {
        palestrasDao = new PalestrasDAO();
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
                // como fica esses rolês aqui?
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
            request.setAttribute("linkVoltar", "../palestra/home");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
            dispatcher.forward(request, response);
            throw new ServletException(e);
        }
    }
    
    private Map<Long, String> getPalestras() {
        Map <Int,String> palestras = new HashMap<>();
        for (Palestras palestras: new PalestrasDAO().getAll()) {
            palestras.put(palestras.getIdAbordagem(), palestras.getTituloDaPalestra());
        }
        return palestras;
    }
    
    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/formularioPalestra.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String tituloDaPalestra = request.getParameter("tituloDaPalestra");
        String resumoDaPalestra = request.getParameter("resumoDaPalestra");
        String materialDeApoio = request.getParameter("materialDeApoio");
 
        // precisa do id aqui?
        Palestras palestras = new Palestras(tituloDaPalestra, resumoDaPalestra, materialDeApoio);
        palestrasDao.insert(palestras);
        response.sendRedirect("home");
    }

    private void apresentaHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/homePalestra.jsp");
        dispatcher.forward(request, response);
    }
	
}
