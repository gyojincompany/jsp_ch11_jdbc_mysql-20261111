package dto;

public class MemberDto {
	
	private String id;
	private String passwd;
	private String email;
	private String signuptime;	
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDto(String id, String passwd, String email, String signuptime) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.email = email;
		this.signuptime = signuptime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSignuptime() {
		return signuptime;
	}
	public void setSignuptime(String signuptime) {
		this.signuptime = signuptime;
	}
	
	
	
}
