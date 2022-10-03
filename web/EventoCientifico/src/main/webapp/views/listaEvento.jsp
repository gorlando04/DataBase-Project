<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Eventos</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Eventos </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/evento/cadastro">Adicione Novo Evento</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Eventos</caption>
			<tr>	
				<th>Sigla</th>
				<th>NomeExtenso</th>
				<th>Pais</th>
				<th>Estado</th>
				<th>Cidade</th>
				<th>Bairro</th>
				<th>Cep</th>
				<th>Numero</th>
				<th>Logradouro</th>
				<th>Complemento</th>
			</tr>
			<c:forEach var="evento" items="${requestScope.listaEvento}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${evento.sigla}</td>
						<td>${evento.nomeExtenso}</td>
						<td>${evento.pais}</td>
						<td>${evento.estado}</td>
						<td>${evento.cidade}</td>
						<td>${evento.bairro}</td>
						<td>${evento.cep}</td>
						<td>${evento.numero}</td>
						<td>${evento.logradouro}</td>
						<td>${evento.complemento}</td>
					
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${pacote.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${pacote.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>