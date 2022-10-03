<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="br.ufscar.dc.pibd.domain.AutorBrasileiro"%>
<%@ page import="br.ufscar.dc.pibd.domain.AutorEstrangeiro"%>
<%@ page import="br.ufscar.dc.pibd.domain.AvaliadorBrasileiro"%>
<%@ page import="br.ufscar.dc.pibd.domain.AvaliadorEstrangeiro"%>
<%@ page import="br.ufscar.dc.pibd.domain.MembroOrganizacaoBrasileiro"%>
<%@ page import="br.ufscar.dc.pibd.domain.MembroOrganizacaoEstrangeiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
		String contextPath = request.getContextPath().replace("/", "");
%>
<div id="cabecalho">
<table>
    <tr>
        <td>
            <%-- <c:if test="${usuarioLogado != null}">
                <c:choose> 
            		<c:when test="${usuario.cliente.sexo == 'F'}"> 
            			<c:out value="Bem-vinda, "/>
            		</c:when>
                    <c:when test="${usuario.cliente.sexo == 'O'}">
                        <c:out value="Bem-vinde, "/>
                    </c:when>
            		<c:otherwise> 
            			<c:out value="Bem-vindo, "/>
            		</c:otherwise>
				</c:choose>
                <c:if test="${usuarioLogado.cliente != null}">${usuarioLogado.cliente.nome}</c:if><c:if test="${usuarioLogado.agencia != null}">${usuarioLogado.agencia.nome}</c:if>!
            </c:if> --%>
            <a href="/<%= contextPath%>/evento/lista">Lista de Eventos</a>
            <%-- <c:if test="${usuarioLogado.cliente != null}">
                <c:if test="${usuarioLogado.cliente.admin == 1}">
                    <a href="/<%= contextPath%>/agencia/lista">Lista de Agencias</a>
                    <a href="/<%= contextPath%>/cliente/lista">Lista de Clientes</a>
                </c:if>
            </c:if> --%>
            <%-- <c:if test="${usuarioLogado.agencia != null}">
                <a href="/<%= contextPath%>/pacote/listaPorAgencia">Pacotes Agência</a>
            </c:if>
            <c:if test="${usuarioLogado.cliente != null}">
                <a href="/<%= contextPath%>/compra/lista">Meus Pacotes</a>
            </c:if>
            <c:if test="${usuarioLogado == null}">
                <a href="/<%= contextPath%>/views/login.jsp">Login</a>
            </c:if> --%>
            <%-- <c:if test="${usuarioLogado != null}">
                <a href="/<%= contextPath%>/auth/logout">Logout</a>
            </c:if> --%>
        </td>
    </tr>
</table>
</div>  