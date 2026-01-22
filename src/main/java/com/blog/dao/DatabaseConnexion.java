package com.blog.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnexion {
	
	
	private static final String URL = "jdbc:mysql://localhost:3306/jee_blog";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Mot de passe WAMP par défaut
    
    // Charger le driver JDBC
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver MySQL chargé avec succès!");
        } catch (ClassNotFoundException e) {
            System.err.println("Erreur de chargement du driver MySQL: " + e.getMessage());
        }
    }
    
    // Méthode pour obtenir une connexion
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    // Méthode pour fermer la connexion
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Connexion fermée.");
            } catch (SQLException e) {
                System.err.println("Erreur lors de la fermeture: " + e.getMessage());
            }
        }
    }
}
