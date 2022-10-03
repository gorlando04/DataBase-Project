<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Cronograma Edital</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Cronograma Edital </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronograma/cadastro">Adicione Novo cronograma</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Cronograma Edital</caption>
			<tr>	
				<th>Inicio PeriodoI</th>
				<th>Fim PeriodoI</th>
				<th>Inicio PeriodoS</th>
				<th>Fim PeriodoS</th>


			</tr>
			<c:forEach var="cronogramaEdital" items="${requestScope.listaCronogramaEdital}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${cronogramaEdital.inicioPeriodoI}</td>
						<td>${cronogramaEdital.fimPeriodoI}</td>
						<td>${cronogramaEdital.inicioPeriodoS}</td>
						<td>${cronogramaEdital.fimPeriodoS}</td>
						

						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${cronogramaEdital.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${cronogramaEdital.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>