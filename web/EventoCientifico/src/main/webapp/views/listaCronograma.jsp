<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Cronograma Palestras</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Cronograma Palestras </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Cronograma Palestras</caption>
			<tr>	
				<th>Data da Palestra</th>
				<th>Hora da Palestra</th>
				<th>Tipo Evento</th>
				<th>Titulo Da Palestra</th>
				<th>Duracao Prevista</th>
				<th>Numero De Sala</th>
				<th>Predio</th>

			</tr>
			<c:forEach var="cronograma" items="${requestScope.listaCronograma}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${cronograma.dataDaPalestra}</td>
						<td>${cronograma.horaDaPalestra}</td>
						<td>${cronograma.tipoEvento}</td>
						<td>${cronograma.tituloDaPalestra}</td>
						<td>${cronograma.duracaoPrevista}</td>
						<td>${cronograma.numeroDeSala}</td>
						<td>${cronograma.predio}</td>
						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${cronograma.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${cronograma.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>