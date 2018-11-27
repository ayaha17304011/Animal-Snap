package beans;

public class PostBean implements Bean{
	private String postId;
	private String userId;
	private String caption;
	private String imageURL;
	private String timestamp;

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
}