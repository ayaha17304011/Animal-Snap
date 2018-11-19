import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DAO{
	Connection cn;
	Statement st;
	ResultSet rs;
	
	public void getCn(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","info","pro");
			System.out.println("connect");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void post(String url, String caption){
		String sql = 
		"insert into posttest(postID, caption, imageURL, timestamp) values(test_seq.nextval, '" + caption + "', '" + url + "', default)";
		try{
			getCn();
			st=cn.createStatement();
			st.executeUpdate(sql);

			cn.commit();
			st.close();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public int postCount(){
		String sql = 
		"select count(*) from posttest";
		int count = 0;
		try{
			getCn();
			st=cn.createStatement();
			rs=st.executeQuery(sql);
			rs.next();
			count = rs.getInt(1);

			cn.commit();
			st.close();
			cn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}