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

import dao.AlumniDAO;

@WebServlet("/AlumniLogin")
public class AlumniLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlumniDAO ad = new AlumniDAO();
       
    public AlumniLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			if(ad.checkUnapprovedStatusOfAlumni(ad.getAlumniID(username, password))) {
				//response.sendRedirect("deleted.jsp");
				request.setAttribute("verifier", "rejected");
				RequestDispatcher dispatcher = request.getRequestDispatcher("alumniLogin.jsp");
				dispatcher.forward(request, response);
			} else if(ad.chechAlumniUserName(username) == true && ad.checkAlumniPassword(password) == true && ad.chechApprovalStatusOfAlumni(ad.getAlumniID(username, password)) == true) {
				HttpSession session = request.getSession();
				session.setAttribute("userType", "alumni");
				session.setAttribute("userID", ad.getAlumniID(username, password));
				response.sendRedirect("alumni/home.jsp");
			} else if (ad.chechAlumniUserName(username) == true && ad.checkAlumniPassword(password) == true && ad.chechApprovalStatusOfAlumni(ad.getAlumniID(username, password)) == false) {
				//response.sendRedirect("unapproved.jsp");
				request.setAttribute("verifier", "unapproved");
				RequestDispatcher dispatcher = request.getRequestDispatcher("alumniLogin.jsp");
				dispatcher.forward(request, response);
			} else if(ad.chechAlumniUserName(username) || ad.checkAlumniPassword(password)) {
				request.setAttribute("verifier", "wrong username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("alumniLogin.jsp");
				dispatcher.forward(request, response);
				
			} else {
				request.setAttribute("verifier", "does not exist");
				RequestDispatcher dispatcher = request.getRequestDispatcher("alumniLogin.jsp");
				dispatcher.forward(request, response);
			}  
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
