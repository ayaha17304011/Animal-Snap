package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.PostBean;

public class LikeDao{
    public void like(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "insert into as_like(likeid,userid,postid) values(like_sequence,?,?)";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getUserId());
            st.setString(2, pb.getPostId());
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
