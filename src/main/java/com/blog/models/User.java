package com.blog.models;

import java.sql.Timestamp;

public class User {

		private int id;
		private String nom;
		private String prenom;
		private String username;
		private String email;
		private String password;
		private String role;
		private Timestamp created_at;
		
		
		public User(String nom, String prenom, String username, String email, String password, String role) 
		{
			super();
			
			this.nom = nom;
			this.prenom = prenom;
			this.username = username;
			this.email = email;
			this.password = password;
			this.role = role;
			
		}

		public int getId() {
			return id;
		}

//		public void setId(int id) {
//			this.id = id;
//		}

		public String getNom() {
			return nom;
		}

		public void setNom(String nom) {
			this.nom = nom;
		}

		public String getPrenom() {
			return prenom;
		}

		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public Timestamp getCreated_at() {
			return created_at;
		}

//		public void setCreated_at(Date created_at) {
//			this.created_at = created_at;
//		}	
		
}
