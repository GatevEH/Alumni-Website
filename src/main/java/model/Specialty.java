package model;

public class Specialty {
	private int id;
	private String specialtyTitle;
	
	public Specialty() {}
	
	public Specialty(int id, String specialtyTitle) {
		this.id = id;
		this.specialtyTitle = specialtyTitle;
	}
	
	public Specialty(String specialtyTitle) {
		this.specialtyTitle = specialtyTitle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialtyTitle() {
		return specialtyTitle;
	}

	public void setSpecialtyTitle(String specialtyTitle) {
		this.specialtyTitle = specialtyTitle;
	}
}
