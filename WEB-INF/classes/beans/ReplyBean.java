package beans;

public class ReplyBean implements Bean{
	private String replyId;
	private String userId;
	private String postId;
	private String reply;
	private String timestamp;

	public ReplyBean() {}

	public void setReplyId(String rid){
		replyId = rid;
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

	public String getReplyId(){
		return replyId;
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
}