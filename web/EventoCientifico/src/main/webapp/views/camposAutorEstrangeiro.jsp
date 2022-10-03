<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table>
	<caption>
		<c:choose>
			<c:when test="${autorEstrangeiro != null}">
                            Edição
                        </c:when>
			<c:otherwise>
                            Cadastro
                        </c:otherwise>
		</c:choose>
	</caption>
	<c:if test="${autorEstrangeiro != null}">
		<input type="hidden" name="id" value="${autorEstrangeiro.id}" />
	</c:if>
	<tr>
		<td><label for="primeiroNome">primeiroNome</label></td>
		<td><input type="text" id="primeiroNome" name="primeiroNome" size="50"
			required value="${autorEstrangeiro.primeiroNome}" /></td>
	</tr>
	<tr>
		<td><label for="sobrenome">sobrenome</label></td>
		<td><input type="text" id="sobrenome" name="sobrenome" size="100" required
			value="${autorEstrangeiro.sobrenome}" /></td>
	</tr>
	<tr>
		<td><label for="cep">cep</label></td>
		<td><input type="text" id="cep" name="cep" size="10" required
			 value="${autorEstrangeiro.cep}" /></td>
	</tr>
	<tr>
		<td><label for="numero">numero</label></td>
		<td><input type="number" id="numero" name="numero" 
			required value="${autorEstrangeiro.numero}" /></td>
	</tr>
	<tr>
		<td><label for="filiacao">filiacao</label></td>
		<td><input type="text" id="filiacao" name="filiacao" size="50"
			required value="${autorEstrangeiro.filiacao}" /></td>
	</tr>
	<tr>
		<td><label for="ddi">ddi</label></td>
		<td><input type="number" id="ddi" name="ddi" 
			required value="${autorEstrangeiro.ddi}" /></td>
	</tr>
	<tr>
		<td><label for="ddd">ddd</label></td>
		<td><input type="number" id="ddd" name="ddd" 
			required value="${autorEstrangeiro.ddd}" /></td>
	</tr>
	<tr>
		<td><label for="prefixo">prefixo</label></td>
		<td><input type="number" id="prefixo" name="prefixo" 
			required value="${autorEstrangeiro.prefixo}" /></td>
	</tr>
	<tr>
		<td><label for="numeroTelefone">numeroTelefone</label></td>
		<td><input type="number" id="numeroTelefone" name="numeroTelefone" 
			required value="${autorEstrangeiro.numeroTelefone}" /></td>
	</tr>
	<tr>
		<td><label for="login">login</label></td>
		<td><input type="text" id="login" name="login" size="50"
			required value="${autorEstrangeiro.login}" /></td>
	</tr>
	<tr>
		<td><label for="dominio">dominio</label></td>
		<td><input type="text" id="dominio" name="dominio"  size="50"
			required value="${autorEstrangeiro.dominio}" /></td>
	</tr>
	<tr>
		<td><label for="nroPassaporte">nroPassaporte</label></td>
		<td><input type="text" id="nroPassaporte" name="nroPassaporte" size="20"
			required value="${autorEstrangeiro.nroPassaporte}" /></td>
	</tr>
	<tr>
		<td><label for="dataEmissao">dataEmissao</label></td>
		<td><input type="date" id="dataEmissao" name="dataEmissao" size="20"
			required value="${autorEstrangeiro.dataEmissao}" /></td>
	</tr>
	<tr>
		<td><label for="dataExpiracao">dataExpiracao</label></td>
		<td><input type="date" id="dataExpiracao" name="dataExpiracao" size="20"
			required value="${autorEstrangeiro.dataExpiracao}" /></td>
	</tr>
	<tr>
		<td><label for="govEmissor">govEmissor</label></td>
		<td><input type="text" id="govEmissor" name="govEmissor" size="20"
			required value="${autorEstrangeiro.govEmissor}" /></td>
	</tr>
	<tr>
		<td><label for="pais">pais</label></td>
		<td><input type="text" id="pais" name="pais"  size="20"
			required value="${autorEstrangeiro.pais}" /></td>
	</tr>
	<tr>
		<td><label for="estado">estado</label></td>
		<td><input type="text" id="estado" name="estado"  size="20"
			required value="${autorEstrangeiro.estado}" /></td>
	</tr>
	<tr>
		<td><label for="cidade">cidade</label></td>
		<td><input type="text" id="cidade" name="cidade"  size="35"
			required value="${autorEstrangeiro.cidade}" /></td>
	</tr>
	<tr>
		<td><label for="bairro">bairro</label></td>
		<td><input type="text" id="bairro" name="bairro"  size="35"
			required value="${autorEstrangeiro.bairro}" /></td>
	</tr>
	<tr>
		<td><label for="logradouro">logradouro</label></td>
		<td><input type="text" id="logradouro" name="logradouro"  size="25"
			required value="${autorEstrangeiro.logradouro}" /></td>
	</tr>
	<tr>
		<td><label for="complemento">complemento</label></td>
		<td><input type="text" id="complemento" name="complemento"  size="25"
			required value="${autorEstrangeiro.complemento}" /></td>
	</tr>
	

	<tr>
		<td colspan="2" align="center"><input type="submit" value="Salva" id="submit"/></td>
	</tr>
</table>