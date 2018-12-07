package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.PostBean;

public class GetPostListDao{
    public List getPostList(){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList postList = new ArrayList();
        
        try{
            cn = OracleConnectionManager.getInstance().getConnection();
            String sql = "select postID,userID,caption,imageURL,timestamp from as_post";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            GetUserNameDao getName = new GetUserNameDao();
            while(rs.next()){
                String name = getName.getUserName(rs.getString(2));
                PostBean p = new PostBean();
                p.setPostId(rs.getString(1));
                p.setUserName(name);
                p.setCaption(rs.getString(3));
                p.setImageURL(rs.getString(4));
                p.setTimestamp(rs.getString(5));
                postList.add(p);
            }
        }catch(SQLException e){
            OracleConnectionManager.getInstance().rollback();
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
        return postList;
    }
}
