

<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>

<% 
    Connection con = null;
    Statement st = null; // instanciando Statement para executar QUERYS
    ResultSet rs = null; // instanciando ResultSet para navegar entre registros retornados
    
    String email = request.getParameter("email"); // Armazenando na variável "email" o que foi digitado no campo email do login.
    String senha = request.getParameter("senha"); // Armazenando na variável "senha" o que foi digitado no campo senha do login.
    String user = "";
    String pass = "";
    String NomeUser = "";
    
    if(email == "" || senha == ""){ // Verifica se existe campos em branco
        response.sendRedirect("../index.jsp?erro=1"); // Retorna para a tela do login com erro=1 
    }else{
        try{
            String url = "jdbc:postgresql://localhost:5432/assajhol";
            String usuario = "postgres";
            String senhaBD = "admin";
            
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            
            rs = st.executeQuery("select * from usuarios where email = '" + email + "' and senha = '" + senha + "' ");
            while (rs.next()) { 
                user = rs.getString(3); // Armazenando o email do banco de dados
                pass = rs.getString(4); // Armazenando a senha do banco de dados
                NomeUser = rs.getString(2); // Armazenando o nome do usuário do banco de dados
            }
            
        }catch(Exception e){ // Verifica se possui alguma excessão, erro da classe de conexão com o banco de dados.
            out.print (e); // Printa o erro
        }
        if(email.equals(user) && senha.equals(pass)){ // Verifica se usuário e senha são válidos, comparando a digitação com o banco.
            session.setAttribute("NomeUsuario", NomeUser); // Se tudo certo, cria a sessão com o nome do usuário
            response.sendRedirect("../home.jsp"); // Rediceiona para a páginina inicial do ADM
    }else{
            response.sendRedirect("../index.jsp?erro=2"); // Erro para usuário ou senha inválidos.
    }
    }
    

%>

