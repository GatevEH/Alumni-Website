package model;

public class Job {
	private int id;
	private String jobTitle;
	private String jobLocation;
	private String jobDescription;
	
	public Job() {}
	
	public Job(int id, String jobTitle, String jobLocation, String jobDescription) {
		this.id = id;
		this.jobTitle = jobTitle;
		this.jobLocation = jobLocation;
		this.jobDescription = jobDescription;
	}
	
	public Job(String jobTitle, String jobLocation, String jobDescription) {
		this.jobTitle = jobTitle;
		this.jobLocation = jobLocation;
		this.jobDescription = jobDescription;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
}
