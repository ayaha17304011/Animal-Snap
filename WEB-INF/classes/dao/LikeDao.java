package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplyDao extends AbstractDao{
    public void like(PostBean pb, int userid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String insert = "insert into as_like(likeid,userid,postid) values(like_sequence,?,?)";
            st = cn.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, pb.getPostId());
            rs = st.executeQuery();
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs!= null){
                    rs.close();
                }if(st!= null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
}
