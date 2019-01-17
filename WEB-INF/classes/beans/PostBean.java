package beans;

public class PostBean extends Bean{
	private String postId;
	private String userId;
	private String caption;
	private String imageURL;
	private String timestamp;
	private String userName;
	private String iconPath;
	private String likeCount;
	private String replyCount;

	public PostBean(){}

	public void setPostId(String pid){
		postId = pid;
	}
	public void setUserId(String uid){
		userId = uid;
	}
	public void setCaption(String cap){
		caption = cap;
	}
	public void setImageURL(String url){
		imageURL = url;
	}
	public void setTimestamp(String time){
		timestamp = time;
	}
	public void setUserName(String name){
		userName = name;
	}
	public void setIconPath(String ipath){
		iconPath = ipath;
	}
	public void setLikeCount(String lcount){
		likeCount = lcount;
	}
	public void setReplyCount(String rcount){
		replyCount = rcount;
	}

	public String getPostId(){
		return postId;
	}
	public String getUserId(){
		return userId;
	}
	public String getCaption(){
		return caption;
	}
	public String getImageURL(){
		return imageURL;
	}
	public String getTimestamp(){
		return timestamp;
	}
	public String getUserName(){
		return userName;
	}
	public String getIconPath(){
		return iconPath;
	}
	public String getLikeCount(){
		return likeCount;
	}
	public String getReplyCount(){
		return replyCount;
	}
}