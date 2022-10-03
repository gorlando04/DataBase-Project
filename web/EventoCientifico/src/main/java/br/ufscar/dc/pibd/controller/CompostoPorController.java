package br.ufscar.dc.pibd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.pibd.domain.CompostoPor;
import br.ufscar.dc.pibd.domain.Login;
import br.ufscar.dc.pibd.util.Erro;
import br.ufscar.dc.pibd.dao.CompostoPorDAO;


@WebServlet(urlPatterns = { "/compostoPor/*" })
public class CompostoPorController extends HttpServlet{

	private static final long serialVersionUID = 1L;

    private CompostoPorDAO compostoPorDao;
    
    @Override
    public void init() {
        compostoPorDao = new CompostoPorDAO();
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

        Login usuario = (Login) request.getSession().getAttribute("usuarioLogado");
        if (usuario == null) {
            Erro erro = new Erro("É necessário estar logado para acessar esta página.");
            request.setAttribute("mensagens", erro);
            response.sendRedirect("../views/login.jsp");
            return;
        }

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
            request.setAttribute("linkVoltar", "../compostoPor/home");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
            dispatcher.forward(request, response);
            throw new ServletException(e);
        }
    }
    
    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/formularioCompostoPor.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Long idPessoa = Long.parseLong(request.getParameter("idPessoa"));
        Long idComite = Long.parseLong(request.getParameter("idComite"));
        String ehResponsavel = request.getParameter("ehResponsavel");
        String ehCorresponsavel = request.getParameter("ehCorresponsavel");

    
        CompostoPor compostoPor = new CompostoPor(idPessoa, idComite, ehResponsavel, ehCorresponsavel);
        compostoPorDao.insert(compostoPor);
        response.sendRedirect("home");
    }

    private void apresentaHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute(getServletName(), response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/homeCompostoPor.jsp");
        dispatcher.forward(request, response);
    }
	
}
