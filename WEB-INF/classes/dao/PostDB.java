package dao;

import java.util.ArrayList;
import beans.PostBean;

public class PostDB {
	private static ArrayList post = new ArrayList();

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