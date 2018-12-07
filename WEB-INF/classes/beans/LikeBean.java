package beans;

public class LikeBean implements Bean{
	private String likeId;
	private String userId;
	private String postId;
	private String userName;

	public LikeBean(){};

	public void setLikeId(String likeid){
		likeId = likeid;
	}
	public void setUserId(String uid){
		userId = uid;
	}
	public void setPostId(String postid){
		postId = postid;
	}
	public void setUserName(String name){
		userName = name;
	}

	public String getUserId(){
		return userId;
	}
	public String getLikeId(){
		return likeId;
	}
	public String getPostId(){
		return postId;
	}
	public String getUserName(){
		return userName;
	}
}