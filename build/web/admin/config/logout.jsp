

<%
    session.invalidate(); // Encerra a sess�o do usu�rio.
    response.sendRedirect("../index.jsp?erro=4"); // Redireciona para login msg -> Sua sess�o foi encerrada.
%>