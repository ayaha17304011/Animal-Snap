package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OraConnectionManager {
  private static OraConnectionManager oracn = null;
  private Connection cn = null;

  private OraConnectionManager(){}

  public static OraConnectionManager getInstance(){
    if(oracn == null){
      oracn = new OraConnectionManager();
    }

    return oracn;
  }
  public Connection getConnection(){
    try{
      if(cn == null || cn.isClosed()){
        Class.forName("oracle.jdbc.driver.OracleDriver");
        cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","animal","pass");
      }
    }catch(ClassNotFoundException e){
      e.printStackTrace();
    }catch(SQLException e){
      e.printStackTrace();
    }
    return cn;
  }
  public void closeConnection(){
    try{
      if(cn != null || !(cn.isClosed())){
        cn.close();
      	cn = null;
      }
    }catch(SQLException e){
      e.printStackTrace();
    }
  }

  public void beginTransaction(){
    if(cn == null){
      cn = getConnection();
    }
    try{
      cn.setAutoCommit(false);
    }catch(SQLException e){
      e.printStackTrace();
    }
  }

  public void commit(){
    try{
      cn.commit();
    }catch(SQLException e){
      e.printStackTrace();
    }
  }

  public void rollback(){
    try{
      cn.rollback();
    }catch(SQLException e){
      e.printStackTrace();
    }
  }
}