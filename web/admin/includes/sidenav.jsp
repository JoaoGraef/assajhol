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