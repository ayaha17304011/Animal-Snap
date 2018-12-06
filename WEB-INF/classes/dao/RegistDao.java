package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.UserBean;

public class RegistDao{
  public void Regist(UserBean ub){
    PreparedStatement st = null;
    try{
      Connection cn = null;
      cn = OracleConnectionManager.getInstance().getConnection();
      String sql = "insert into as_user(userId, LoginId, userName, password, iconPath) values(as_seq_userId.next_val, ?, ?, ?,'defaultIcon.jpg')";
      st = cn.prepareStatement(sql);
      st.setString(1,ub.getLoginId());
      st.setString(2,ub.getUserName());
      st.setString(3,ub.getPassword());

      st.executeUpdate();
    }catch (SQLException e) {
			OracleConnectionManager.getInstance().rollback();
		}finally{
			try{
				if(st!=null){
					st.close();
				}
			}catch(SQLException e){
        e.printStackTrace();
      }
		}
  }
}