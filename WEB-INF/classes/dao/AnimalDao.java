/***********************last update -01/17
*--name---        -line-
*SQLUpdate      | 32->51
*getPostList    | 53->95
*getPost        | 96->134
*getlikeList    | 135->169
*getReplyList   | 170->208
**getUserInfo   | 209->252
*like           | 253->290
*login          | 291->324
*follow         | 325->363
*getFollowerlist| 364->396
*getFolloingList| 397->429
*likeCheck      | --------
*followCheck    | --------
******************************************/

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
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
      st.executeUpdate();
    }catch(SQLException e){
      OraConnectionManager.getInstance().rollback();
      e.printStackTrace();
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
  public List getPostList(String uid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList postList = new ArrayList();
        try{

            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT distinct p.postID, u.username, u.IconPath, p.caption, p.imageURL, p.timestamp,"+
                         "(SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count,"+
                         "(SELECT count(*) FROM as_reply WHERE postId = p.postId) AS reply_count "+
                         "FROM as_post p JOIN as_follower f on(p.userId = f.userID) "+
                         "JOIN as_user u on(f.userID = u.userID) "+
                         "WHERE p.userID = f.userID and (f.observerID = ? or p.userId = ?)";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            st.setString(2, uid);
            rs = st.executeQuery();
            while(rs.next()){
                PostBean pb = new PostBean();
                pb.setPostId(rs.getString(1));
                pb.setUserName(rs.getString(2));
                pb.setIconPath(rs.getString(3));
                pb.setCaption(rs.getString(4));
                pb.setImageURL(rs.getString(5));
                pb.setTimestamp(rs.getString(6));
                pb.setLikeCount(rs.getString(7));
                pb.setReplyCount(rs.getString(8));
                postList.add(pb);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
    public PostBean getPost(String pid){
    PreparedStatement st = null;
    Connection cn = null;
    ResultSet rs = null;
    PostBean pb = new PostBean();
    try{
        cn = OraConnectionManager.getInstance().getConnection();
        String sql = "SELECT p.postID,u.username,u.IconPath,p.caption,p.imageURL,p.timestamp,"+
                      "(SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count,"+
                      "(SELECT count(*) FROM as_reply WHERE postId = p.postId) AS reply_count "+
                      "FROM as_post p LEFT JOIN as_user u on(p.userId = u.userId) WHERE p.postId = ?";
        st = cn.prepareStatement(sql);
        st.setString(1, pid);
        rs = st.executeQuery();
        rs.next();
        pb.setPostId(rs.getString(1));
        pb.setUserName(rs.getString(2));
        pb.setIconPath(rs.getString(3));
        pb.setCaption(rs.getString(4));
        pb.setImageURL(rs.getString(5));
        pb.setTimestamp(rs.getString(6));
        pb.setLikeCount(rs.getString(7));
        pb.setReplyCount(rs.getString(8));
    }catch (SQLException e) {
			OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
    return pb;
  }
  //getLikeList
  public ArrayList getLikeList(LikeBean lb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList likeList = new ArrayList();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT u.username, u.iconpath "+
                         "FROM as_like l LEFT JOIN as_user u on (u.userId = l.userId) "+ 
                         "WHERE postID = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, lb.getPostId());
            rs = st.executeQuery();
            while(rs.next()){
                lb.setUserName(rs.getString(1));
                lb.setIconPath(rs.getString(2));
                likeList.add(lb);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT u.username,r.reply,r.timestamp "+
                          "FROM as_reply r LEFT JOIN as_user u "+
                          "WHERE postID=? order by timestamp";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getPostId());
            rs = st.executeQuery();

            while(rs.next()){
                rb.setUserName(rs.getString(1));
                rb.setReply(rs.getString(2));
                rb.setTimestamp(rs.getString(3));
                replyList.add(rb);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
    public UserBean getUserInfo(String uid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        UserBean ub = new UserBean();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            // no state
            String sql = "SELECT u.loginid,u.username,u.password,u.iconpath,"+
                          "(SELECT count(*) FROM as_post WHERE userId = u.userId and state = 1) AS POST_COUNT,"+
                          "(SELECT count(*) FROM as_follower WHERE userId = u.userId) AS OBSERVER,"+
                          "(SELECT count(*) FROM as_follower WHERE observerId = u.userId) AS FOLLOWING "+
                          "FROM as_user u " +
                          "WHERE u.userID = " + uid;
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();

            rs.next();
            if(rs.getInt(5)==1){ 
                ub.setLoginId(rs.getString(1));
                ub.setUserName(rs.getString(2));
                ub.setPassword(rs.getString(3));
                ub.setIconImage(rs.getString(4));
                ub.setPostCount(rs.getString(5));
                ub.setObserver(rs.getString(6));
                ub.setFollowing(rs.getString(7));
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
        return ub;
    }
    //DoLike
    public void like(LikeBean lb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = null;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String select = "select likeId from as_like where userId = ? and postId = ?";
            st = cn.prepareStatement(select);
            st.setString(1, lb.getUserId());
            st.setString(2, lb.getPostId());
            rs = st.executeQuery();
            if(rs.next()){
                String likeId = rs.getString("likeId");
                sql = "delete from as_like where likeId = " + likeId;
                SQLUpdate(sql);
            }else{
                String uid = lb.getUserId();
                String pid = lb.getPostId();
                sql = "insert into as_like(likeid,userid,postid) values(as_seq_likeId.next_val, " + uid + ", " + pid + ")";
                SQLUpdate(sql);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
    //login
    public String Login(UserBean ub){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String result = null;
        try{
            String sql = "SELECT userId FROM as_user WHERE loginId = ? and password = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, ub.getLoginId());
            st.setString(2, ub.getPassword());
            rs = st.executeQuery();
            if(rs.next()){
                result = rs.getString(1);
            }else{
                //login fail
                result = null;
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
        return result;
    }
    //follow
    public void follow(FollowBean fb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = null;
        //userid == you || observerid == me
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String select = "SELECT userId, observerId FROM as_follower WHERE userId = ? AND observerId = ?";
            st = cn.prepareStatement(select);
            st.setString(1, fb.getUserId());
            st.setString(2, fb.getObserverId());
            rs = st.executeQuery();
            if(rs.next()){
                String uid = rs.getString("userId");
                sql = "delete from as_follower where userid = " + uid;
                SQLUpdate(sql);
            }else{
                String uid = fb.getUserId();
                String oid = fb.getObserverId();
                sql = "insert into as_follower(userId,observerId) values(" + uid + "," + oid + ")";
                SQLUpdate(sql);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
    //follower list
    public ArrayList getFollowerlist(String uid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<String> list = new ArrayList<String>();
        try{
            String sql = "SELECT u.iconPath, u.username, f.observerId " +
            "FROM as_follower f INNER JOIN as_user u on(u.userId = f.observerId) "+
            "WHERE f.userid = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            while(rs.next()){
                String follower = rs.getString(1);
                list.add(follower);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
        return list;
    }
    //
    public ArrayList getFollowinglist(String uid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<String> list = new ArrayList<String>();
        try{
            String sql = "SELECT u.iconPath, u.username, f.userId "+
                         "FROM as_follower f INNER JOIN as_user u on(u.userId = f.userId) "+
                         "WHERE f.observerId = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            while(rs.next()){
                String follower = rs.getString(1);
                list.add(follower);
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            e.printStackTrace();
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
        return list;
    }
}