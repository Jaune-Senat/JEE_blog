package com.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.blog.dao.DatabaseConnection;


/**
 * Servlet implementation class TestConnexionServlet
 */
@WebServlet("/test-bd")
public class TestConnexionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            Connection conn = DatabaseConnection.getConnection();
            
            if (conn != null && !conn.isClosed()) {
                out.println("<h1 style='color:green'>✅ Connexion à MySQL réussie!</h1>");
                out.println("<p>Base de données: test-etu</p>");
                DatabaseConnection.closeConnection(conn);
            } else {
                out.println("<h1 style='color:red'>❌ Échec de la connexion</h1>");
            }
            
        } catch (Exception e) {
            out.println("<h1 style='color:red'>❌ Erreur: " + e.getMessage() + "</h1>");
            e.printStackTrace();
        }
	}
}
