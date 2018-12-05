package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnectionManager {
  private static OracleConnectionManager oracn = null;
  private Connection cn = null;

  private OracleConnectionManager(){}

  public static OracleConnectionManager getInstance(){
    if(oracn == null){
      oracn = new OracleConnectionManager();
    }

    return oracn;
  }
  public Connection getConnection(){
    try{
      if(cn == null || cn.isClosed()){
        Class.forName("oracle.jdbc.driver.OracleDriver");
        cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","info","pro");
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