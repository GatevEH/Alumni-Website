package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SpecialtyDAO;
import model.Specialty;

@WebServlet(urlPatterns = {"/admin/SpecialtyCRUD"})
public class SpecialtyCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SpecialtyDAO specialtyDao = new SpecialtyDAO();
	private String action;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getParameter("action");
		
		switch(action) {
		case "showSpecialtyToEdit":
			int specialtyID = Integer.parseInt(request.getParameter("specialtyID"));
			request.setAttribute("specialtyID", specialtyID);
			dispatcher = request.getRequestDispatcher("specialtyEdit.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action = request.getParameter("action");
		
		switch(action) {
		case "addSpecialty":
			int adminID = Integer.parseInt(request.getSession().getAttribute("userID").toString());
			String specialtyName = request.getParameter("specName");
			
			Specialty s = new Specialty(specialtyName);
			
			try {
				specialtyDao.insertSpecialty(s, adminID);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("specialties.jsp");
			break;
			
		case "editSpecialty":
			int specialtyID = Integer.parseInt(request.getParameter("specialtyID"));
			specialtyName = request.getParameter("specName");
			
			s = new Specialty(specialtyID, specialtyName);
			
			try {
				specialtyDao.updateSpecialty(s);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("specialties.jsp");
			break;
		}
	}

}
