
<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>
<%@ page import= "java.io.File" %>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String id = request.getParameter("id");
    String img = request.getParameter("imagem");
    
    Upload up = new Upload();
    up.setFolderUpload("assets");

    if (up.formProcess(getServletContext(), request)) {
    
        String imagem = up.getFiles().get(0);
        String acaosocial = up.getForm().get("acaosocial").toString();
        String descricao = up.getForm().get("descricao").toString();
        String data = up.getForm().get("data").toString();

        String url = "jdbc:postgresql://localhost:5432/assajhol";
        String usuario = "postgres";
        String senhaBD = "admin";

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.executeUpdate("UPDATE asociais set acaosocial = '"+acaosocial+"',descricao = '"+descricao+"',data = '"+data+"',imagem = '"+imagem+"' where id = '"+id+"'  ");
            
            File file = new File("C:\\Users\\Atendimento\\Documents\\NetBeansProjects\\Assajhol\\build\\web\\assets\\"+img);
            file.delete();
            
            response.sendRedirect("../aSociais.jsp?status=2"); //Atualizado com sucesso.
        } catch (Exception e) {
            out.print(e);
        }

    }

%>