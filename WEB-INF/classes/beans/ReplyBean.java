package beans;

public class ReplyBean extends Bean{
	private String replyId;
	private String iconPath;
	private String userId;
	private String postId;
	private String reply;
	private String timestamp;
	private String userName;

	public ReplyBean() {}
	
	public void setReplyId(String rid){
		replyId = rid;
	}
	public void setIconPath(String icon){
		iconPath = icon;
	}
	public void setUserId(String uid){
		userId = uid;
	}
	public void setPostId(String pid){
		postId = pid;
	}
	public void setReply(String rep){
		reply = rep;
	}
	public void setTimestamp(String ts){
		timestamp = ts;
	}
	public void setUserName(String name){
		userName = name;
	}

	public String getReplyId(){
		return replyId;
	}
	public String getIconPath(){
		return iconPath;
	}
	public String getUserId(){
		return userId;
	}
	public String getPostId(){
		return postId;
	}
	public String getReply(){
		return reply;
	}
	public String getTimestamp(){
		return timestamp;
	}
	public String getUserName(){
		return userName;
	}
}