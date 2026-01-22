<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 
<%@ include file="/WEB-INF/includes/header.jsp" %>
<%@ include file="/WEB-INF/includes/navbar.jsp" %>
 
<c:set var="pageTitle" value="Accueil" scope="request"/>
<c:set var="pageActive" value="home" scope="request"/>
 
 
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="jumbotron text-center">
                <h1 class="display-4">Bienvenue sur Mon Blog</h1>
                
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <p class="lead">Bonjour ${sessionScope.user.prenom} ${sessionScope.user.nom}!</p>
                        <p>Vous êtes connecté en tant que <strong>${sessionScope.user.role}</strong></p>
                        <hr class="my-4">
                        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/nouvel-article" role="button">
                            <i class="fas fa-plus-circle"></i> Créer un article
                        </a>
                        <a class="btn btn-secondary btn-lg" href="${pageContext.request.contextPath}/mes-articles" role="button">
                            <i class="fas fa-file-alt"></i> Mes articles
                        </a>
                    </c:when>
                    <c:otherwise>
                        <p class="lead">Partagez vos idées et découvrez des articles passionnants</p>
                        <hr class="my-4">
                        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/register" role="button">
                            <i class="fas fa-user-plus"></i> S'inscrire
                        </a>
                        <a class="btn btn-secondary btn-lg" href="${pageContext.request.contextPath}/login" role="button">
                            <i class="fas fa-sign-in-alt"></i> Se connecter
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
 
<%@ include file="/WEB-INF/includes/footer.jsp" %>