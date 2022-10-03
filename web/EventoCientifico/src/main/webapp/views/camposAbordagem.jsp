<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table>
	<caption>
		<c:choose>
			<c:when test="${abordagem != null}">
                            Edição
                        </c:when>
			<c:otherwise>
                            Cadastro
                        </c:otherwise>
		</c:choose>
	</caption>
	<c:if test="${abordagem != null}">
		<input type="hidden" name="id" value="${abordagem.id}" />
	</c:if>
	<tr>
		<td><label for="idCompostoPor">idCompostoPor</label></td>
		<td><input type="text" id="idCompostoPor" name="idCompostoPor" size="45"
			required value="${abordagem.idCompostoPor}" /></td>
	</tr>
	<tr>
		<td><label for="emailPrincipal">emailPrincipal</label></td>
		<td><input type="email" id="emailPrincipal" name="emailPrincipal" size="45" required
			value="${abordagem.emailPrincipal}" /></td>
	</tr>
	<tr>
		<td><label for="dataHoraAbordagem">dataHoraAbordagem</label></td>
		<td><input type="date" id="dataHoraAbordagem" name="dataHoraAbordagem" required
			 value="${abordagem.dataHoraAbordagem}" /></td>
	</tr>
	<tr>
		<td><label for="conteudo">Conteudo</label></td>
		<td><input type="text" id="conteudo" name="conteudo" size="500"
			required value="${abordagem.conteudo}" /></td>
	</tr>
	<tr>
		<td><label for="meioComunicacao1">meioComunicacao1</label></td>
		<td><input type="text" id="meioComunicacao1" name="meioComunicacao1" size="50"
			required value="${abordagem.meioComunicacao1}" /></td>
	</tr>
	<tr>
		<td><label for="meioComunicacao2">meioComunicacao2</label></td>
		<td><input type="text" id="meioComunicacao2" name="meioComunicacao2" size="50"
			required value="${abordagem.meioComunicacao2}" /></td>
	</tr>
	<tr>
		<td><label for="meioComunicacao3">meioComunicacao3</label></td>
		<td><input type="text" id="meioComunicacao3" name="meioComunicacao3" size="50"
			required value="${abordagem.meioComunicacao3}" /></td>
	</tr>
	

	<tr>
		<td colspan="2" align="center"><input type="submit" value="Salva" id="submit"/></td>
	</tr>
</table>