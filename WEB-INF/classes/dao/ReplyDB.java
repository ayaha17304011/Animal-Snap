package dao;

import java.util.ArrayList;
import beans.ReplyBean;

public class ReplyDB {
	private static ArrayList<ReplyBean> reply = new ArrayList<ReplyBean>();

	public static void addReply(ReplyBean p) {
		reply.add(p);
	}
	public static ReplyBean getReply(int index) {
		return (ReplyBean)reply.get(index);
	}
	public static ArrayList getReplyDB() {
		return reply;
	}
}