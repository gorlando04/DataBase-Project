<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro encontrado</title>
        <link rel="stylesheet" href="../style/styleSheet.css">
    </head>
    <body>
        <div align="center" id="errorPage">
        <h1>Erro encontrado</h1>
        <c:if test="${mensagens.existeErros}">
            <div id="erro">
                <ul>
                    <c:forEach var="erro" items="${mensagens.erros}">
                        <li> ${erro} </li>
                        </c:forEach>
                </ul>
            </div>
        </c:if>
        <c:if test="${linkVoltar != null}">
            <a href="${linkVoltar}">Voltar</a>
        </c:if>
        </div>
    </body>
</html>