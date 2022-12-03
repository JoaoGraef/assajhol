
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
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
        st.execute("INSERT INTO usuarios(nome,email,senha) VALUES('"+nome+"','"+email+"','"+senha+"') ");
        response.sendRedirect("../usuarios.jsp?erro=100");
    } catch (Exception e) {
        out.println(e);
    }
    
%>