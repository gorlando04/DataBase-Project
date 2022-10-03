<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Tentativas Contato</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Tentativas Contato </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Tentativas Contato</caption>
			<tr>	
				<th>Nome</th>
				<th>Primeiro Nome</th>
				<th>Sobrenome</th>
				<th>Email Principal</th>
				<th>Email</th>
				<th>Telefone</th>
				<th>Data Hora Abordagem </th>

			</tr>
			<c:forEach var="tentativasContato" items="${requestScope.listaTentativasContato}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${tentativasContato.nome}</td>
						<td>${tentativasContato.primeiroNome}</td>
						<td>${tentativasContato.sobrenome}</td>
						<td>${tentativasContato.emailPrincipal}</td>
						<td>${tentativasContato.email}</td>
						<td>${tentativasContato.telefone}</td>
						<td>${tentativasContato.dataHoraAbordagem }</td>

						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${tentativasContato.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${tentativasContato.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>