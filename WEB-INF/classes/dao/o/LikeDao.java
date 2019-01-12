package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import beans.PostBean;

public class LikeDao{
    public void like(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = null;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String select = "select likeId from as_like where userId = ? and postId = ?";
            st = cn.prepareStatement(select);
            st.setString(1, pb.getUserId());
            st.setString(2, pb.getPostId());
            rs = st.executeQuery();
            if(rs.next()){
                String likeId = rs.getString("likeId");
                st = null;
                sql = "delete from as_like where likeId = ?";
                st = cn.prepareStatement(sql);
                st.setString(1, likeId);
                st.executeUpdate();
            }else{
                st = null;
                sql = "insert into as_like(likeid,userid,postid) values(as_seq_likeId.next_val,?,?)";
                st = cn.prepareStatement(sql);
                st.setString(1, pb.getUserId());
                st.setString(2, pb.getPostId());
                st.executeUpdate();
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
}
