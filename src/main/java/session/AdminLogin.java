package session;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDAO;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO adminDao = new AdminDAO();

    public AdminLogin() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			if(adminDao.checkAdminUsername(username) == true && adminDao.checkAdminPassword(password) == true) {
				HttpSession session = request.getSession();
				session.setAttribute("userType", "admin");
				session.setAttribute("userID", adminDao.getAdminID(username, password));
				response.sendRedirect("admin/home.jsp");
			} else if(adminDao.checkAdminUsername(username) == true || adminDao.checkAdminPassword(password) == true) {
				request.setAttribute("verifier", "wrong username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("verifier", "does not exist");
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
				dispatcher.forward(request, response);			}  
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
