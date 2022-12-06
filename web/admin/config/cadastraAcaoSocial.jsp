
<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>



<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

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
            st.execute("INSERT INTO asociais(acaosocial,descricao,data,imagem) VALUES('" + acaosocial + "','" + descricao + "','" + data + "','" + imagem + "') ");
            response.sendRedirect("../aSociais.jsp?status=1"); //Adicionado com sucesso.
        } catch (Exception e) {
            out.print(e);
        }

    }

%>