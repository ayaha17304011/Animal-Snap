package beans;

public class UserBean extends Bean{
	private String userId;
	private String loginId;
	private String password;
	private String userName;
	private String iconImage;

	public UserBean(){};

	public void setUserId(String uid){
		userId = uid;
	}
	public void setLoginId(String logid){
		loginId = logid;
	}
	public void setPassword(String pass){
		password = pass;
	}
	public void setUserName(String name){
		userName = name;
	}
	public void setIconImage(String icon){
		iconImage = icon;
	}

	public String getUserId(){
		return userId;
	}
	public String getLoginId(){
		return loginId;
	}
	public String getPassword(){
		return password;
	}
	public String getUserName(){
		return userName;
	}
	public String getIconImage(){
		return iconImage;
	}
}