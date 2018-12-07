package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplyDao extends AbstractDao{
    public void reply(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "insert into as_reply values(reply_sequence,?,?,?,sysdate)";
            st = cn.prepareStatement(sql);
            st.setInt(1, pb.getUserId());
            st.setInt(2, pb.getPostId());
            st.setString(3, pb.getReply());
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
