package beans;

public class UserBean extends Bean{
	private String userId;
	private String loginId;
	private String password;
	private String userName;
	private String iconImage;
	private String postCount;
	private String observer;
	private String following;

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
	public void setPostCount(String pcount){
		postCount = pcount;
	}
	public void setObserver(String ocount){
		observer = ocount;
	}
	public void setFollowing(String fcount){
		following = fcount;
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
	public String getPostCount(){
		return postCount;
	}
	public String getObserver(){
		return observer;
	}
	public String getFollowing(){
		return following;
	}
}