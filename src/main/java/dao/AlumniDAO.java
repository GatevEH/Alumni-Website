package dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import model.Alumni;

public class AlumniDAO {
	private DatabaseConnection dc = new DatabaseConnection();
	
	public void registerAlumni(Alumni a, int specialtyID) throws SQLException, ClassNotFoundException {
		Connection connection = dc.initializeConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("insert into alumnis (first_name, last_name, class_of, email, profile_picture, phone_number, user_name, user_password, fk_specialty, approved, unapproved, employer, position) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		preparedStatement.setString(1, a.getFirstName());
		preparedStatement.setString(2, a.getLastName());
		preparedStatement.setInt(3, a.getClassOf());
		preparedStatement.setString(4, a.getEmail());
		preparedStatement.setBlob(5, a.getProfilePicture());
		preparedStatement.setString(6, a.getPhoneNumber());
		preparedStatement.setString(7, a.getUserName());
		preparedStatement.setString(8, a.getPassword());
		preparedStatement.setInt(9, specialtyID);
		preparedStatement.setBoolean(10, false);
		preparedStatement.setBoolean(11, false);
		preparedStatement.setString(12, a.getEmployer());
		preparedStatement.setString(13, a.getPosition());
		
		preparedStatement.executeUpdate();
	}
	
	public boolean chechAlumniUserName(String userName) throws SQLException, ClassNotFoundException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select user_name from alumnis where user_name = ?");
		preparedStatement.setString(1, userName);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) return true;
		
		return false;
	}
	
	public boolean checkAlumniPassword(String password) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select user_password from alumnis where user_password = ?");
		preparedStatement.setString(1, password);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) return true;
		
		return false;
	}
	
	public int getAlumniID(String username, String password) throws ClassNotFoundException, SQLException {
		int alumniId;
		
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select alumni_id from  alumnis where user_name = ? and user_password = ?");
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			alumniId = resultSet.getInt("alumni_id");
			return alumniId;
		}
			
		return 0;
	}
	
	public String getAlumniPhoto(int alumniId) throws ClassNotFoundException, SQLException, IOException {
		String profilePicture = null;
		
		Connection connection = dc.initializeConnection();
		PreparedStatement ps = connection.prepareStatement("select profile_picture from alumnis where alumni_id=?");
		ps.setInt(1, alumniId);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Blob picture = rs.getBlob("profile_picture");
		
			InputStream inputStream = picture.getBinaryStream();
	        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	        byte[] buffer = new byte[4096];
	        int bytesRead = -1;
	         
	        while ((bytesRead = inputStream.read(buffer)) != -1) {
	            outputStream.write(buffer, 0, bytesRead);                  
	        }
	         
	        byte[] imageBytes = outputStream.toByteArray();
	        
	        profilePicture = Base64.getEncoder().encodeToString(imageBytes);
	    }	
        return profilePicture;
	}
	
	public boolean chechApprovalStatusOfAlumni(int alumniID) throws SQLException, ClassNotFoundException {
		boolean status;
		
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select approved from alumnis where alumni_id = ?");
		preparedStatement.setInt(1, alumniID);
		
		ResultSet resultSet =  preparedStatement.executeQuery();
		if(resultSet.next()) {
			status = resultSet.getBoolean("approved");
			return status;
		}
		return false;
	}
	
	public boolean checkUnapprovedStatusOfAlumni(int alumniID) throws ClassNotFoundException, SQLException {
		boolean status;
		
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select unapproved from alumnis where alumni_id = ?");
		preparedStatement.setInt(1, alumniID);
		
		ResultSet resultSet =  preparedStatement.executeQuery();
		if(resultSet.next()) {
			status = resultSet.getBoolean("unapproved");
			return status;
		}
		return false;
	}
	
	
	public void approveAlumni(int alumniID) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("update alumnis set approved = ? where alumni_id = ?");
		preparedStatement.setBoolean(1, true);
		preparedStatement.setInt(2, alumniID);
		
		preparedStatement.executeUpdate();
	}
	
	public void rejectAlumni(int alumniID) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("update alumnis set unapproved = ? where alumni_id = ?");
		preparedStatement.setBoolean(1, true);
		preparedStatement.setInt(2, alumniID);
		
		preparedStatement.executeUpdate();
	}
	
	public boolean userNameExists(String username) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("select user_name from alumnis where user_name = ?");
		
		preparedStatement.setString(1, username);
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			return true;
		}
		
		return false;
	}
}
