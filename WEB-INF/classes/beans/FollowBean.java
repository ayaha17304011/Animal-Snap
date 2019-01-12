package beans;

public class FollowBean extends Bean{
	private String observerId;
	private String userId;

	public FollowBean(){};

	public void setUserId(String uid){
		userId = uid;
	}
  public void setObserverId(String oid){
    observerId = oid;
  }

	public String getUserId(){
		return userId;
	}
  public String getObserverId(){
    return observerId;
  }

}