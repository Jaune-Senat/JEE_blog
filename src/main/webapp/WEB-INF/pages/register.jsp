<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/includes/header.jsp"%>
<%@ include file="/WEB-INF/includes/navbar.jsp"%>

<c:set var="pageTitle" value="Inscription" scope="request" />
<c:set var="pageActive" value="register" scope="request" />

<div class="container">
	<div class="row justify-content-center align-items-center min-vh-100">
		<div class="col-md-6 col-lg-5">
			<div class="card shadow">
				<div class="card-body p-4">
					<h2 class="card-title text-center mb-4">Inscription</h2>
					<!-- Messages d'erreur -->
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
					<!-- Messages de succès -->
					<c:if test="${not empty message}">
						<div class="alert alert-success" role="alert">${message}</div>
					</c:if>
					<!-- Formulaire -->
					<form action="${pageContext.request.contextPath}/register"
						method="post">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="nom" class="form-label">Nom</label> <input
									type="text" class="form-control" id="nom" name="nom"
									value="${param.nom}" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="prenom" class="form-label">Prénom</label> <input
									type="text" class="form-control" id="prenom" name="prenom"
									value="${param.prenom}" required>
							</div>
						</div>
						<div class="mb-3">
							<label for="username" class="form-label">Nom
								d'utilisateur</label> <input type="text" class="form-control"
								id="username" name="username" value="${param.username}" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								value="${param.email}" required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Mot de passe</label> <input
								type="password" class="form-control" id="password"
								name="password" minlength="6" required>
							<div class="form-text">Minimum 6 caractères</div>
						</div>
						<div class="mb-3">
							<label for="role" class="form-label">Rôle</label> <select
								class="form-select" id="role" name="role" required>
								<option value="">-- Sélectionner un rôle --</option>
								<option value="USER" ${param.role == 'USER' ? 'selected' : ''}>Utilisateur</option>
								<option value="ADMIN" ${param.role == 'ADMIN' ? 'selected' : ''}>Administrateur</option>
								<option value="MODERATOR"
									${param.role == 'MODERATOR' ? 'selected' : ''}>Modérateur</option>
							</select>
						</div>
						<div class="d-grid mb-3">
							<button type="submit" class="btn btn-primary">S'inscrire</button>
						</div>
					</form>
					<div class="text-center">
						<p class="mb-0">
							Déjà inscrit? <a href="${pageContext.request.contextPath}/login">Se
								connecter</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/includes/footer.jsp"%>

