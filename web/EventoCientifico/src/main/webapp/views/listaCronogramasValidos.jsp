<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Cronogramas Validos</title>
<script src="${pageContext.request.contextPath}/script/filter.js"></script>
<link rel="stylesheet" href="../style/styleSheet.css">
</head>
<body>


	<%@include file="cabecalho.jsp"%>
	<div align="center">
		<h1>Lista de Cronogramas Validos </h1>
		<h2>
			<a href="/<%=contextPath%>">Menu Principal</a> &nbsp;&nbsp;&nbsp;
			<%-- <c:if test="${usuario.membroOrganizacao != null}"><a href="/<%= contextPath%>/cronogramasValidos/cadastro">Adicione Novo cronogramasValidos</a></c:if> --%>
		</h2>
	</div>

	<div align="center">
		<table id="tabela">
			<caption>Lista de Cronogramas Validos</caption>
			<tr>	
				<th>Abordagem</th>
				<th>Cronograma Palestra</th>
				<th>Email Principal</th>
				<th>Data Hora Abordagem</th>


			</tr>
			<c:forEach var="cronogramasValidos" items="${requestScope.listacronogramasValidos}">
				<%-- <tr <c:if test="${usuarioLogado != null && usuarioLogado.cliente != null}"> onclick="compraPacote(${pacote.id})"</c:if>> --%>
			
						<td>${cronogramasValidos.abordagem}</td>
						<td>${cronogramasValidos.cronogramasValidosPalestra}</td>
						<td>${cronogramasValidos.emailPrincipal}</td>
						<td>${cronogramasValidos.dataHoraAbordagem}</td>
	
						
					<%-- <c:if test="${filtrado}">
					<td><a href="/<%= contextPath%>/pacote/edicao?id=${cronogramasValidos.id}" class="acoes">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="acoes"
						href="/<%= contextPath%>/pacote/remove?id=${cronogramasValidos.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este pacote? Removera tambem todas as compras realizadas pelos clientes');">
							Remoção </a></td></c:if> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>