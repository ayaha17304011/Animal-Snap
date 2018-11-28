package dao;
import beans.UserBean;
import java.util.ArrayList;

public class UserDB {
	private static ArrayList user = new ArrayList();

	public static void addUser(UserBean p) {
		user.add(p);
	}
	public static UserBean getUser(int index) {
		return (UserBean)user.get(index);
	}
	public static ArrayList getUserDB() {
		return user;
	}
}