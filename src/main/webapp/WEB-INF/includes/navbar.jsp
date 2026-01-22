<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>
 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="fas fa-blog"></i> Mon Blog
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link ${pageActive == 'home' ? 'active' : ''}" href="${pageContext.request.contextPath}/">
                        <i class="fas fa-home"></i> Accueil
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link ${pageActive == 'articles' ? 'active' : ''}" href="${pageContext.request.contextPath}/articles">
                        <i class="fas fa-newspaper"></i> Articles
                    </a>
                </li>
                
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item">
                        <a class="nav-link ${pageActive == 'mes-articles' ? 'active' : ''}" href="${pageContext.request.contextPath}/mes-articles">
                            <i class="fas fa-file-alt"></i> Mes Articles
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link ${pageActive == 'nouvel-article' ? 'active' : ''}" href="${pageContext.request.contextPath}/nouvel-article">
                            <i class="fas fa-plus-circle"></i> Nouvel Article
                        </a>
                    </li>
                    
                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-cog"></i> Administration
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/articles">
                                    <i class="fas fa-newspaper"></i> Gérer Articles
                                </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/users">
                                    <i class="fas fa-users"></i> Gérer Utilisateurs
                                </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/categories">
                                    <i class="fas fa-tags"></i> Gérer Catégories
                                </a></li>
                            </ul>
                        </li>
                    </c:if>
                </c:if>
            </ul>
            
            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle"></i> ${sessionScope.user.prenom}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profil">
                                    <i class="fas fa-user"></i> Mon Profil
                                </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mes-articles">
                                    <i class="fas fa-file-alt"></i> Mes Articles
                                </a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                                    <i class="fas fa-sign-out-alt"></i> Déconnexion
                                </a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link ${pageActive == 'login' ? 'active' : ''}" href="${pageContext.request.contextPath}/login">
                                <i class="fas fa-sign-in-alt"></i> Connexion
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${pageActive == 'register' ? 'active' : ''}" href="${pageContext.request.contextPath}/register">
                                <i class="fas fa-user-plus"></i> Inscription
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>