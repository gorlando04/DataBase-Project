<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Candidato Membro Responsavel</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Candidato Membro Responsavel </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Candidato Membro Responsavel</caption>
			<tr>	
				<th>Nome</th>
				<th>Area De Atuacao</th>
				<th>Uniclink</th>
				<th>Titulo</th>
				<th>Pessoa Que Indicou</th>
				<th>Email Principal</th>
				<th>Contato Pessoa Indicou</th>


			</tr>
			<c:forEach var="candidatoMembroResponsavel" items="${requestScope.listaCandidatoMembroResponsavel}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${candidatoMembroResponsavel.nome}</td>
						<td>${candidatoMembroResponsavel.areaDeAtuacao}</td>
						<td>${candidatoMembroResponsavel.uniclink}</td>
						<td>${candidatoMembroResponsavel.titulo}</td>
						<td>${candidatoMembroResponsavel.pessoaQueIndicou}</td>
						<td>${candidatoMembroResponsavel.emailPrincipal}</td>
						<td>${candidatoMembroResponsavel.contatoPessoaIndicou}</td>
						

						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${candidatoMembroResponsavel.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${candidatoMembroResponsavel.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>