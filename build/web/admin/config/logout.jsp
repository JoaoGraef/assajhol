

<%
    session.invalidate(); // Encerra a sessão do usuário.
    response.sendRedirect("../index.jsp?erro=4"); // Redireciona para login msg -> Sua sessão foi encerrada.
%>