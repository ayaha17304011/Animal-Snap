package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetUserInfoDao extends AbstractDao{
    public ArrayList getUserInfo(UserBean ub){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList userInfo = new ArrayList();

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select loginid,username,password,iconpath,state from as_user where userID=?";
            st = cn.prepareStatement(sql);
            st.setInt(1, ub.getUserId());
            rs = st.executeQuery();

            rs.next();
            if(rs.getInt(5)==1){ //state==0ÇÕëﬁâÔÇµÇΩÉÜÅ[ÉUÅ[
                ub.setLoginId(rs.getString(1));
                ub.setUserName(rs.getString(2));
                ub.setPassword(rs.getString(3));
                ub.setIconPath(rs.getString(4));
                userInfo.add(ub);
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
