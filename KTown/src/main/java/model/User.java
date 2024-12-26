package model;

public class User extends Order{
	private int userid;
	private String username;
	private String password;
	private String useremail;
	private String country;
	
	public User(int userid,String username,String password,String useremail,String country) {
		super();
		this.setUserid(userid);
		this.setUsername(username);
		this.setPassword(password);
		this.setUseremail(useremail);
		this.setCountry(country);
	}

	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
