<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Participantes Coordenacao Convite</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Participantes Coordenacao Convite </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Participantes Coordenacao Convite</caption>
			<tr>	
				<th>Sigla</th>
				<th>Edicao</th>
				<th>Nome Extenso</th>
				<th>Tipo</th>
				<th>idPessoa</th>
				<th>Primeiro Nome</th>
				<th>Sobrenome</th>

			</tr>
			<c:forEach var="participantesCoordenacaoConvite" items="${requestScope.listaParticipantesCoordenacaoConvite}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${participantesCoordenacaoConvite.sigla}</td>
						<td>${participantesCoordenacaoConvite.edicao}</td>
						<td>${participantesCoordenacaoConvite.nomeExtenso}</td>
						<td>${participantesCoordenacaoConvite.tipo}</td>
						<td>${participantesCoordenacaoConvite.idPessoa}</td>
						<td>${participantesCoordenacaoConvite.primeiroNome}</td>
						<td>${participantesCoordenacaoConvite.sobrenome}</td>

						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${participantesCoordenacaoConvite.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${participantesCoordenacaoConvite.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>