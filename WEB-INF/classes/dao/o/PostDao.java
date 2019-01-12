package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import beans.PostBean;

public class PostDao{
  public void addPost(PostBean pb){
    Connection cn = null;
    PreparedStatement st = null;
    String sql = "insert into as_post(post_id, user_id, caption, imageURL, timestamp, state) values(as_seq_postId.next_val, ?, ?, ?, default, 1)";
    try{
      cn = OraConnectionManager.getInstance().getConnection();
      st = cn.prepareStatement(sql);
      st.setString(1,pb.getUserId());
      st.setString(2,pb.getCaption());
      st.setString(3,pb.getImageURL());
      st.executeUpdate();
    }catch(SQLException e){
      OraConnectionManager.getInstance().rollback();
    }finally{
      try{
        if(st!= null){
           st.close();
         }
      }catch(SQLException ex){
         ex.printStackTrace();
      }
    }
  }
}