
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String mensagem = request.getParameter("mensagem");
    
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
        st.execute("INSERT INTO contatos(nome,email,telefone,mensagem) VALUES('"+nome+"','"+email+"','"+telefone+"','"+mensagem+"') ");
        response.sendRedirect("../../index.jsp?erro=101");
    } catch (Exception e) {
        out.println(e);
    }
    
%>