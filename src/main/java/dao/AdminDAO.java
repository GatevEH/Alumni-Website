package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	private DatabaseConnection dc = new DatabaseConnection();
	
	public boolean checkAdminUsername(String username) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select user_name from  admins where user_name = ?");
		preparedStatement.setString(1, username);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) return true;
		
		return false;
	}
	
	public boolean checkAdminPassword(String password) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select admin_password from  admins where admin_password = ?");
		preparedStatement.setString(1, password);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) return true;
		
		return false;
	}
	
	public int getAdminID(String username, String password) throws ClassNotFoundException, SQLException {
		int adminId;
		
		Connection connection = dc.initializeConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("select id from  admins where user_name = ? and admin_password = ?");
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			adminId = resultSet.getInt("id");
			return adminId;
		}
			
		return 0;
	}
}
