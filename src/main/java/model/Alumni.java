package model;

import java.io.InputStream;

public class Alumni {
	private int id;
	private String firstName;
	private String lastName;
	private int classOf;
	private String email;
	private InputStream profilePicture;
	private String phoneNumber;
	private String employer;
	private String position;
	private String userName;
	private String password;
	private boolean approved;
	private boolean unapproved;
	
	public Alumni() {}
	
	public Alumni(String firstName, String lastName, int classOf, String email, InputStream profilePicture, String phoneNumber, String employer, String position, String userName, String password, boolean approved, boolean unapproved) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.classOf = classOf;
		this.email = email;
		this.profilePicture = profilePicture;
		this.phoneNumber = phoneNumber;
		this.employer = employer;
		this.position = position;
		this.userName = userName;
		this.password = password;
		this.approved = approved;
		this.unapproved = unapproved;
	}
	
	public Alumni(int id, String firstName, String lastName, String email, String phoneNumber, String employer, String position) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.employer = employer;
		this.position = position;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getClassOf() {
		return classOf;
	}

	public void setClassOf(int classOf) {
		this.classOf = classOf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public InputStream getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(InputStream profilePicture) {
		this.profilePicture = profilePicture;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmployer() {
		return employer;
	}

	public void setEmployer(String employer) {
		this.employer = employer;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public boolean isApproved() {
		return approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public boolean isUnapproved() {
		return unapproved;
	}

	public void setUnapproved(boolean unapproved) {
		this.unapproved = unapproved;
	}
}
