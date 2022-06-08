package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JobDAO;
import model.Job;

@WebServlet(urlPatterns = {"/admin/JobCRUD", "/alumni/JobCRUD"})
public class JobCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JobDAO jobDao = new JobDAO();
	private String action;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getParameter("action");
		int jobID = Integer.parseInt(request.getParameter("jobID"));
		
		switch(action) {
		case "showJob":
			
			request.setAttribute("jobID", jobID);
			
			dispatcher = request.getRequestDispatcher("job.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "showJobToEdit":
			request.setAttribute("jobID", jobID);
			dispatcher = request.getRequestDispatcher("jobEdit.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "deleteJob":
			
			try {
				jobDao.deleteJob(jobID);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("jobMyJobs.jsp");
			break;
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action = request.getParameter("action");
		
		switch(action) {
		case "addJob":
			int alumniID = Integer.parseInt(request.getSession().getAttribute("userID").toString());
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String description = request.getParameter("description");
			
			Job j = new Job(title, location, description);
			
			try {
				jobDao.insertJob(j, alumniID);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("jobs.jsp");
			break;
		case "editJob":
			int jobID = Integer.parseInt(request.getParameter("jobID"));
			title = request.getParameter("title");
			location = request.getParameter("location");
			description = request.getParameter("description");
			
			j = new Job(jobID, title, location, description);
			
			try {
				jobDao.updateJob(j);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("jobMyJobs.jsp");
			break;
		}
	}

}
