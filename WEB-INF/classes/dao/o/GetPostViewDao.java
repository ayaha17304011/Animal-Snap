package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.PostBean;

public class GetPostViewDao{
  public PostBean getPost(PostBean pb){
    PreparedStatement st = null;
    try{
      Connection cn = null;
      ResultSet rs = null;
      cn = OraConnectionManager.getInstance().getConnection();
      String sql = "select postId, userId, caption, imageUrl ,timeStamp from as_post where postId = ?";
      st = cn.prepareStatement(sql);
      st.setString(1, pb.getPostId());
      rs = st.executeQuery();
      rs.next();
      GetUserNameDao getName = new GetUserNameDao();
      String name = getName.getUserName(rs.getString(2));
      pb.setPostId(rs.getString(1));
      pb.setUserName(name);
      pb.setCaption(rs.getString(3));
      pb.setImageURL(rs.getString(4));
      pb.setTimestamp(rs.getString(5));
    }catch (SQLException e) {
			OraConnectionManager.getInstance().rollback();
		}finally{
			try{
				if(st != null){
					st.close();
				}
			}catch(SQLException e){
        e.printStackTrace();
      }
		}
    return pb;
  }
}