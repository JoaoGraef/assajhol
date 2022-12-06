<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Configurações</div>
                <a class="nav-link" href="colaboradores.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                    Membros/Colaboradores
                </a>

                <a class="nav-link" href="usuarios.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    Usuários
                </a>
                
                 <a class="nav-link" href="contato.jsp">
                    <div class="sb-nav-link-icon"><i class="far fa-edit"></i></div>
                    Contato/Mensagem
                </a>
                
                <a class="nav-link" href="aSociais.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-file-image"></i></div>
                    Ações Sociais
                </a>


            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logado como:</div>
            <%
                String nomeUsuario = (String) session.getAttribute("NomeUsuario");                
                    out.print(nomeUsuario);
            %>
        </div>
    </nav>
</div>