package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.OraConnectionManager;
import beans.PostBean;

public class ReplyDao{
    public void reply(PostBean pb, String reply){
        Connection cn = null;
        PreparedStatement st = null;

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "insert into as_reply values(reply_sequence,?,?,?,sysdate)";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getUserId());
            st.setString(2, pb.getPostId());
            st.setString(3, reply);
            st.executeUpdate();
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
}
