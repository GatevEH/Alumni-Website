package actions;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.AlumniDAO;
import model.Alumni;

@WebServlet(urlPatterns = {"/AlumniCRUD", "/admin/AlumniCRUD", "/alumni/AlumniCRUD"})
@MultipartConfig(maxFileSize = 16777215)
public class AlumniCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlumniDAO alumniDao = new AlumniDAO();
	private String action;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getParameter("action");
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		switch(action) {
		case "showAlumni":
			userID = Integer.parseInt(request.getParameter("userID"));
			request.setAttribute("userID", userID);
			dispatcher = request.getRequestDispatcher("user.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "showUnapprovedAlumni":
			userID = Integer.parseInt(request.getParameter("userID"));
			request.setAttribute("userID", userID);
			dispatcher = request.getRequestDispatcher("unapprovedUser.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "approveAlumni":
			try {
				userID = Integer.parseInt(request.getParameter("userID"));
				alumniDao.approveAlumni(userID);
				response.sendRedirect("unapprovedUsers.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			break;
			
		case "rejectAlumni":
			try {
				userID = Integer.parseInt(request.getParameter("userID"));
				alumniDao.rejectAlumni(userID);
				response.sendRedirect("unapprovedUsers.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action = request.getParameter("action");
		
		switch(action) {
		case "registerAlumni":
			try {
				String name = request.getParameter("firstname");
				String lname = request.getParameter("lastname");
				int classOf = Integer.parseInt(request.getParameter("classOf"));
				int specialty = Integer.parseInt(request.getParameter("specialty"));
				String employer = request.getParameter("employer");
				String position = request.getParameter("position");
				String email = request.getParameter("email");
				String number = request.getParameter("number");
				String userName = request.getParameter("username");
				String pass = request.getParameter("password");
			
				if(alumniDao.userNameExists(userName)) {
					request.setAttribute("exists", "true");
					RequestDispatcher dispatcher = request.getRequestDispatcher("alumniRegistration.jsp");
					dispatcher.forward(request, response);
				} else {
			        Part filePart = request.getPart("picture");
			        InputStream inputStream = filePart.getInputStream();
					
			        Alumni a = new Alumni(name, lname, classOf, email, inputStream, number, employer, position, userName, pass, false, false);
			        alumniDao.registerAlumni(a, specialty);
					response.sendRedirect("unapproved.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			break;
		}
	}

}
