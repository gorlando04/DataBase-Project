<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Participantes Coordenacao Edicao</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Participantes Coordenacao Edicao </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Participantes Coordenacao Edicao</caption>
			<tr>	
				<th>Sigla</th>
				<th>Edicao</th>
				<th>Nome Extenso</th>
				<th>Tipo</th>
				<th>idPessoa</th>
				<th>Primeiro Nome</th>
				<th>Sobrenome</th>
				<th>ehResponsavel</th>

			</tr>
			<c:forEach var="participantesCoordenacaoEdicao" items="${requestScope.listaParticipantesCoordenacaoEdicao}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${participantesCoordenacaoEdicao.sigla}</td>
						<td>${participantesCoordenacaoEdicao.edicao}</td>
						<td>${participantesCoordenacaoEdicao.nomeExtenso}</td>
						<td>${participantesCoordenacaoEdicao.tipo}</td>
						<td>${participantesCoordenacaoEdicao.idPessoa}</td>
						<td>${participantesCoordenacaoEdicao.primeiroNome}</td>
						<td>${participantesCoordenacaoEdicao.sobrenome}</td>
						<td>${participantesCoordenacaoEdicao.ehResponsavel}</td>

						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${participantesCoordenacaoEdicao.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${participantesCoordenacaoEdicao.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>