
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<%
    String id = request.getParameter("id");
    String nome = request.getParameter("nome");
    String telefone = request.getParameter("telefone");
    String endereco = request.getParameter("endereco");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/assajhol";
    String usuario = "postgres";
    String senhaBD = "admin";
    
    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url, usuario, senhaBD);
        st = con.createStatement();
        st.executeUpdate("update colaboradores set nome = '"+nome+"', telefone='"+telefone+"', endereco='"+endereco+"' where id='"+id+"' ");
        response.sendRedirect("../colaboradores.jsp?status=2"); //Registro atualizado com sucesso.
    } catch (Exception e) {
        out.println(e);
    }
    
%>