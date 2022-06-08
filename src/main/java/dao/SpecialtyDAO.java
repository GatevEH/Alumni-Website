package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Specialty;

public class SpecialtyDAO {
	private DatabaseConnection dc = new DatabaseConnection();
	
	public void insertSpecialty(Specialty s, int adminID) throws ClassNotFoundException, SQLException {
					
		Connection connection = dc.initializeConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("insert into specialties (specialty, fk_admin) values (?, ?)");
		preparedStatement.setString(1, s.getSpecialtyTitle());
		preparedStatement.setInt(2, adminID);
						
		preparedStatement.executeUpdate();
		
	}
	
	public void updateSpecialty(Specialty s) throws ClassNotFoundException, SQLException {
		Connection connection = dc.initializeConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE specialties SET specialty = ? WHERE specialty_id = ?;");
					
		preparedStatement.setString(1, s.getSpecialtyTitle());
		preparedStatement.setInt(2, s.getId());
		preparedStatement.executeUpdate();
	}
}
