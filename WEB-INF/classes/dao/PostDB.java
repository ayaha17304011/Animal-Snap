package dao;

import java.util.ArrayList;
import beans.PostBean;

public class PostDB {
	private static ArrayList post = new ArrayList();

	static{
		for(int i = 0; i <= 2; i++){
			PostBean pb = new PostBean();
			pb.setImageURL("image"+ i +".jpg");
			pb.setCaption("Caption"+ i);
			post.add(pb);
		}
	}

	public static void addPost(PostBean p) {
		post.add(p);
	}
	public static PostBean getPost(int index) {
		return (PostBean)post.get(index);
	}
	public static ArrayList getPostDB() {
		return post;
	}
}