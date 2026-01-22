package com.blog.servlets;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
 
import com.blog.dao.UserDAO;
import com.blog.models.User;
import com.blog.passwordHash.PasswordUtil;
 
/**
* Servlet implementation class RegisterServlet
*/
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	private UserDAO userDAO;
    
    public void init() {
        userDAO = new UserDAO();
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		//Récupérer les données du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        String hashedPassword = PasswordUtil.hashPassword(password);
       
        User user = new User(nom, prenom, username, email, hashedPassword, role);
        
        
        
        boolean isRegistered = userDAO.registerUser(user);
        
        if (isRegistered) {
            request.setAttribute("message", "Inscription réussie!");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Erreur lors de l'inscription. L'utilisateur existe peut-être déjà.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
	}
 
}