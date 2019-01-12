/***********************last update -01/11 タナポン
*--name---     -line-
*SQLUpdate   | 31->49
*getPostList | 52->88
*getPost     | 90->123
*getlikeList | 125->157
*getReplyList| 160->195
*getUserInfo | 196->231
**getUserName| 238->267
*like        | 269->304
*
*
*
*
************************/

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Arraylist;
import java.util.List;

import beans.*;

public class AnimalDao{
  //insert delete update
  public void SQLUpdate(String sql){
    Connection cn = null;
    PreparedStatement st = null;
    try{
      cn = OraConnectionManager.getInstance().getConnection();
      st = cn.prepareStatement(sql);
      st = executeUpdate();
    }catch(SQLException e){
      OraConnectionManager.getInstance().rollback();
    }finally{
      try{
        if(st!= null){
           st.close();
         }
      }catch(SQLException ex){
         ex.printStackTrace();
      }
    }
  }

  //GetPostList
  public List getPostList(){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList postList = new ArrayList();
        
        try{
            cn = OraConnectionManager.getInstance().getConnection();
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
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return postList;
    }
    //GetPostView
    public PostBean getPost(PostBean pb){
    PreparedStatement st = null;
    try{
      Connection cn = null;
      ResultSet rs = null;
      cn = OraConnectionManager.getInstance().getConnection();
      String sql = "select postId, userId, caption, imageUrl ,timeStamp from as_post where postId = ?";
      st = cn.prepareStatement(sql);
      st.setString(1, pb.getPostId());
      rs = st.executeQuery();
      rs.next();
      GetUserNameDao getName = new GetUserNameDao();
      String name = getName.getUserName(rs.getString(2));
      pb.setPostId(rs.getString(1));
      pb.setUserName(name);
      pb.setCaption(rs.getString(3));
      pb.setImageURL(rs.getString(4));
      pb.setTimestamp(rs.getString(5));
    }catch (SQLException e) {
			OraConnectionManager.getInstance().rollback();
		}finally{
			try{
        if(rs != null){
          rs.close();
        }
				if(st != null){
					st.close();
				}
			}catch(SQLException e){
        e.printStackTrace();
      }
		}
    return pb;
  }
  //getLikeList
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
    //GetReplyList
    public ArrayList getReplyList(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList replyList = new ArrayList();
        ReplyBean rb = new ReplyBean();
        GetUserNameDao dao = new GetUserNameDao();

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select userid,reply,timestamp from as_reply where postID=? order by timestamp";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getPostId());
            rs = st.executeQuery();

            while(rs.next()){
                rb.setUserName(dao.getUserName(rs.getString(1)));
                rb.setReply(rs.getString(2));
                rb.setTimestamp(rs.getString(3));
                replyList.add(rb);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return replyList;
    }
    //GetUserInfo
    public ArrayList getUserInfo(UserBean ub){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList userInfo = new ArrayList();

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select loginid,username,password,iconpath,state from as_user where userID=?";
            st = cn.prepareStatement(sql);
            st.setString(1, ub.getUserId());
            rs = st.executeQuery();

            rs.next();
            if(rs.getInt(5)==1){ 
                ub.setLoginId(rs.getString(1));
                ub.setUserName(rs.getString(2));
                ub.setPassword(rs.getString(3));
                ub.setIconImage(rs.getString(4));
                userInfo.add(ub);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return userInfo;
    }

    /****************
    *--GetUserName--
    *>getPostLIst
    *>getPostView
    *>getReplyList
    *****************/
    public String getUserName(String uid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String name = null;
        
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select username from as_user where userid=?";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            rs.next();
            name = rs.getString(1);
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return name;
    }
    //DoLike
    public void like(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = null;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String select = "select likeId from as_like where userId = ? and postId = ?";
            st = cn.prepareStatement(select);
            st.setString(1, pb.getUserId());
            st.setString(2, pb.getPostId());
            rs = st.executeQuery();
            if(rs.next()){
                String likeId = rs.getString("likeId");
                sql = "delete from as_like where likeId = " + likeId;
                SQLUpdate(sql);
            }else{
                String uid = pb.getUserId();
                String pid = pb.getPostId();
                sql = "insert into as_like(likeid,userid,postid) values(as_seq_likeId.next_val, " + uid + ", " + pid + ")";
                SQLUpdate(sql);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }if(st != null){
                    st.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
}