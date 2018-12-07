package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.ReplyBean;

public class ReplyListDao extends AbstractDao{
    public ArrayList getReplyList(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList replyList = new ArrayList();
        ReplyBean rb = new ReplyBean();

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select * from as_reply where postID=? order by timestamp";
            st = cn.prepareStatement(sql);
            st.setInt(1, pb.getPostId());
            rs = st.executeQuery();

            while(rs.next()){
                rb.setusername(getUserName(rs.getString(2)));
                rb.setReply(rs.getString(4));
                rb.setTimestamp(rs.getString(5));
                replyList.add(ReplyBean);
            }
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
        return replyList;
    }
}
