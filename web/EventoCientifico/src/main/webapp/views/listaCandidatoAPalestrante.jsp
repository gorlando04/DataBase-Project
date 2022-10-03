<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Candidato a Palestrante</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Candidato a Palestrante </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Candidato a Palestrante</caption>
			<tr>	
				<th>Nome</th>
				<th>Area De Atuacao</th>
				<th>Uniclink</th>
				<th>Titulo</th>
				<th>Pessoa Que Indicou</th>
				<th>Email Principal</th>
				<th>Email</th>
				<th>Telefone</th>

			</tr>
			<c:forEach var="candidatoAPalestrante" items="${requestScope.listaCandidatoAPalestrante}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${candidatoAPalestrante.nome}</td>
						<td>${candidatoAPalestrante.areaDeAtuacao}</td>
						<td>${candidatoAPalestrante.uniclink}</td>
						<td>${candidatoAPalestrante.titulo}</td>
						<td>${candidatoAPalestrante.pessoaQueIndicou}</td>
						<td>${candidatoAPalestrante.emailPrincipal}</td>
						<td>${candidatoAPalestrante.email}</td>
						<td>${candidatoAPalestrante.telefone}</td>

						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${candidatoAPalestrante.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${candidatoAPalestrante.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>