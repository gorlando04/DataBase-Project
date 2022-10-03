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

import br.ufscar.dc.pibd.domain.CronogramaPalestra;
//import br.ufscar.dc.pibd.domain.Login;
import br.ufscar.dc.pibd.util.Erro;
import br.ufscar.dc.pibd.dao.CronogramaPalestraDAO;

@WebServlet(urlPatterns = { "/cronogramaPalestra/*" }) // e essa url aqui??
public class CronogramaPalestraController extends HttpServlet{

	private static final long serialVersionUID = 1L;

    private CronogramaPalestraDAO cronogramaPalestraDao;
    
    @Override
    public void init() {
        cronogramaPalestraDao = new CronogramaPalestraDAO();
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
                case "/lista":
                    lista(request, response);
                    break;
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
            request.setAttribute("linkVoltar", "../cronogramaPalestra/home");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
            dispatcher.forward(request, response);
            throw new ServletException(e);
        }
    }
    
    private Map<Long, String> getCronogramaPalestra() {
        Map <Int,Int> cronogramaPalestras = new HashMap<>();
        for (CronogramaPalestra cronogramaPalestra: new CronogramaPalestraDAO().getAll()) {
            cronogramaPalestras.put(cronogramaPalestra.getIdAbordagem(), cronogramaPalestra.getIdPalestra());
        }
        return cronogramaPalestras;
    }
    
    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/formularioCronogramaPalestra.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String tipoEvento = request.getParameter("tipoEvento");
        Date dataDaPalestra = request.getParameter("dataDaPalestra");
        Time horaDaPalestra = request.getParameter("horaDaPalestra");
        Interval duracaoPrevista = request.getParameter("duracaoPrevista");
        int numeroDeSala = request.getParameter("numeroDeSala");
        String predio = request.getParameter("predio");
 
        // precisa do id aqui?
        CronogramaPalestra cronogramaPalestra = new CronogramaPalestra(tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio);
        cronogramaPalestraDao.insert(cronogramaPalestra);
        response.sendRedirect("home");
    }

    private void apresentaHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/homeCronogramaPalestra.jsp");
        dispatcher.forward(request, response);
    }
	
}
