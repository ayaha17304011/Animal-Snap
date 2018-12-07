package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.LikeBean;

public class GetLikeListDao{
    public ArrayList getLikeList(LikeBean lb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList likeList = new ArrayList();
        GetUserNameDao getName = new GetUserNameDao();

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select userid from as_like where postID=? order by timestamp";
            st = cn.prepareStatement(sql);
            st.setString(1, lb.getPostId());
            rs = st.executeQuery();

            while(rs.next()){
                lb.setUserName(getName.getUserName(rs.getString(1)));
                likeList.add(lb);
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
        return likeList;
    }
}
