package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Job;

public class JobDAO {
	private DatabaseConnection dc = new DatabaseConnection();
	
	public void insertJob(Job j, int alumniID) throws SQLException, ClassNotFoundException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("insert into jobs (job_title, job_location, job_description, fk_alumni) values (?,?,?,?)");
		preparedStatement.setString(1, j.getJobTitle());
		preparedStatement.setString(2, j.getJobLocation());
		preparedStatement.setString(3, j.getJobDescription());
		preparedStatement.setInt(4, alumniID);
		
		preparedStatement.executeUpdate();
	}
	
	public void deleteJob(int id) throws SQLException, ClassNotFoundException {
		Connection connection = dc.initializeConnection();
		PreparedStatement statement = connection.prepareStatement("delete from jobs where job_id = ?");
		statement.setInt(1, id);
		statement.executeUpdate();
	}
	
	public void updateJob(Job j) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		PreparedStatement statement = connection.prepareStatement("update jobs set job_title = ?, job_description = ?, job_location=? where job_id = ?");
		
		statement.setString(1, j.getJobTitle());
		statement.setString(2, j.getJobDescription());
		statement.setString(3, j.getJobLocation());
		statement.setInt(4, j.getId());
		
		statement.executeUpdate();
	}
}
