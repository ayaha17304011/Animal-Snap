/***********************last update -01/24
*--name---          -line-
*SQLUpdate        | 32->51
*getPostList      | 53->95
*getPost          | 96->134
*getlikeList      | 135->169
*getReplyList     | 170->208
**getUserInfo     | 209->252
*like             | 253->290
*login            | 291->324
*follow           | 325->363
*getFollowerlist  | 364->396
*getFolloingList  | 397->429
*search           | 435->477
*getUserPosts     | 493~
*getNextReplyCount| 530~
*getMyLike        | 561~
*followCheck      | --------
*likeCheck        | --------
******************************************/
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import ex.*;
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
            String sql = "SELECT * from (select distinct p.postID, u.username, u.IconPath, p.caption, p.imageURL, to_char(p.timestamp,'yyyy/mm/dd hh24:mi') as timestamp, u.userId,"+
                         "(SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count, "+
                         "(SELECT count(*) FROM as_reply WHERE postId = p.postId) AS reply_count "+
                         "FROM as_user u LEFT JOIN as_post p on(u.userId = p.userId) "+
                         "LEFT JOIN as_follower f on(u.userID = f.userId) "+
                         "WHERE (u.userId = ? or f.observerId = ?) and p.state = 1 "+
                         "ORDER BY timestamp desc) WHERE rownum < 6";
            // System.out.println(sql);
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
                pb.setUserId(rs.getString(7));
                pb.setLikeCount(rs.getString(8));
                pb.setReplyCount(rs.getString(9));
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
    public PostBean getPost(PostBean pb){
        PreparedStatement st = null;
        Connection cn = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList();
        ArrayList replyList = new ArrayList();

        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT u.userID,p.postID,u.username,u.IconPath,p.caption,p.imageURL, to_char(p.timestamp,'yyyy/mm/dd hh24:mi') as timestamp,"+
                          "(SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count,"+
                          "(SELECT count(*) FROM as_reply WHERE postId = p.postId) AS reply_count "+
                          "FROM as_post p LEFT JOIN as_user u on(p.userId = u.userId) WHERE p.postId = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getPostId());
            rs = st.executeQuery();
            rs.next();
            pb.setUserId(rs.getString(1));
            pb.setPostId(rs.getString(2));
            pb.setUserName(rs.getString(3));
            pb.setIconPath(rs.getString(4));
            pb.setCaption(rs.getString(5));
            pb.setImageURL(rs.getString(6));
            pb.setTimestamp(rs.getString(7));
            pb.setLikeCount(rs.getString(8));
            pb.setReplyCount(rs.getString(9));

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
                         "WHERE l.postID = ? and u.state = 1";
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
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT r.userId, u.username, u.iconPath, r.reply, r.timestamp "+
                          "FROM as_reply r LEFT JOIN as_user u on(u.userId = r.userId) "+
                          "WHERE r.postID = ? "+
                          "ORDER BY timestamp desc";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getPostId());
            rs = st.executeQuery();

            while(rs.next()){
                ReplyBean rb = new ReplyBean();
                rb.setUserId(rs.getString(1));
                rb.setUserName(rs.getString(2));
                rb.setIconPath(rs.getString(3));
                rb.setReply(rs.getString(4));
                rb.setTimestamp(rs.getString(5));
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
            String sql = "SELECT u.loginid,u.username,u.password,u.iconpath,u.profile,"+
                          "(SELECT count(*) FROM as_post WHERE userId = u.userId and state = 1) AS POST_COUNT,"+
                          "(SELECT count(*) FROM as_follower f JOIN as_user au ON(f.observerid = au.userid) WHERE f.userId = u.userId and au.state=1 ) AS OBSERVER,"+
                          "(SELECT count(*) FROM as_follower f JOIN as_user au ON(f.userid = au.userid) WHERE observerId = u.userId and au.state=1 ) AS FOLLOWING,"+
                          "u.state "+
                          "FROM as_user u " +
                          "WHERE u.userID = " + uid;
            // System.out.println(sql);
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();

            rs.next();
            if(rs.getInt(9)==1){ 
                ub.setLoginId(rs.getString(1));
                ub.setUserName(rs.getString(2));
                ub.setPassword(rs.getString(3));
                ub.setIconImage(rs.getString(4));
                ub.setProfile(rs.getString(5));
                ub.setPostCount(rs.getString(6));
                ub.setObserver(rs.getString(7));
                ub.setFollowing(rs.getString(8));
                ub.setUserId(uid);
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
            String select = "select userId,postId from as_like where userId = ? and postId = ?";
            String uid = lb.getUserId();
            String pid = lb.getPostId();
            st = cn.prepareStatement(select);
            st.setString(1, uid);
            st.setString(2, pid);
            rs = st.executeQuery();
            if(rs.next()){
                sql = "delete from as_like where userId = " + uid + " and postId =" + pid;
                SQLUpdate(sql);
            }else{
                sql = "insert into as_like(userid,postid) values(" + uid + ", " + pid + ")";
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
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT userId FROM as_user WHERE loginId = ? and password = ? and state = 1";
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
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT u.iconPath, u.username, f.observerId " +
            "FROM as_follower f INNER JOIN as_user u on(u.userId = f.observerId) "+
            "WHERE f.userid = ? and u.state = 1";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            while(rs.next()){
                String follower = rs.getString(3);
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
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT u.iconPath, u.username, f.userId "+
                         "FROM as_follower f INNER JOIN as_user u on(u.userId = f.userId) "+
                         "WHERE f.observerId = ? and u.state = 1";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            while(rs.next()){
                String follower = rs.getString(3);
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
    public ArrayList search(String query){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        ArrayList<String> post_list = new ArrayList<String>();
        ArrayList<String> user_list = new ArrayList<String>();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            // (SELECT count(*) FROM as_follower WHERE f.userId = u.userid and au.state=1) as follower_count
            String sql = "select userid, (SELECT count(*) FROM as_follower WHERE userId = u.userid and u.state=1) as follower_count "+
                         "from as_user u where (regexp_like(username,?) or regexp_like(loginid,?)) and state = 1 "+
                         "order by follower_count desc";
            st = cn.prepareStatement(sql);
            st.setString(1, query);
            st.setString(2, query);
            rs = st.executeQuery();
            // int count = 0;
            while(rs.next()){// && count<10){
                String userid = rs.getString(1);
                user_list.add(userid);
                // count++;
            }
            // (SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count
            sql = "select p.postid, (SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count "+
                  "from as_post p where regexp_like(caption,?) and state = 1 "+
                  "order by like_count desc";
            st = cn.prepareStatement(sql);
            st.setString(1, query);
            rs = st.executeQuery();
            // count = 0;
            while(rs.next()){// && count<10){
                String postid = rs.getString(1);
                post_list.add(postid);
                // count++;
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
        list.add(user_list);
        list.add(post_list);
        return list;
    }
    //
    public ArrayList getUserPosts(String userId){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<PostBean> list = new ArrayList<PostBean>();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT postId, ImageURL "+
                         "FROM as_post "+
                         "WHERE userId = ? and state = 1 "+
                         "ORDER BY timeStamp desc";
            st = cn.prepareStatement(sql);
            st.setString(1, userId);
            rs = st.executeQuery();
            while(rs.next()){
                PostBean pb = new PostBean();
                pb.setPostId(rs.getString("postId"));
                pb.setImageURL(rs.getString("ImageURL"));
                list.add(pb);
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
    //replyId count
    public int getNextReplyCount(String pid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        int new_count = 0;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT count(*) FROM as_reply WHERE postId = " + pid;
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            if(rs.next()){
                new_count = rs.getInt(1) + 1;
            }else{
                new_count = 1;
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
        return new_count;
    }
    public ArrayList getMyLike(String uid){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<String> list = new ArrayList<String>();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT l.postid "+
                         "FROM as_like l JOIN as_post p ON(l.postid = p.postid) "+
                         "WHERE l.userid = ? and p.state = 1";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            while(rs.next()){
                String pid = rs.getString(1);
                list.add(pid);
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
    public boolean ExistUser(String uid) throws NoUserException{
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean flag = true;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT state FROM as_user WHERE userid = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, uid);
            rs = st.executeQuery();
            if(rs.next()){
                int state = Integer.parseInt(rs.getString(1));
                if(state==0){
                    throw new NoUserException("削除されたユーザーです");
                }
            }
            else{
                throw new NoUserException("存在しないユーザーです。");
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
        return flag;
    }
    public boolean isExist(String id){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean flag = false;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT state FROM as_user WHERE loginId = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                flag = true;
            }else{
                flag = false;
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            return flag;
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
        return flag;
    }
    public boolean likeCheck(LikeBean lb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean flag = false;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select userId from as_like where userId = ? and postId = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, lb.getUserId());
            st.setString(2, lb.getPostId());
            rs = st.executeQuery();
            if(rs.next()){
                flag = true;
            }else{
                flag = false;
            }
        }catch(SQLException e){
            OraConnectionManager.getInstance().rollback();
            return flag;
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
        return flag;
    }
    public boolean followCheck(FollowBean fb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean flag = false;
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select userId from as_follower where userId = ? and observerId = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, fb.getUserId());
            st.setString(2, fb.getObserverId());
            System.out.println(fb.getUserId());
            System.out.println(fb.getObserverId());
            rs = st.executeQuery();
            if(rs.next()){
                flag = true;
            }else{
                flag = false;
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
        return flag;
    }
    public ArrayList recommend(){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        ArrayList<String> post_list = new ArrayList<String>();
        ArrayList<String> user_list = new ArrayList<String>();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "select u.userid, u.username, (SELECT count(*) FROM as_follower WHERE userId = u.userid and u.state=1) as follower_count "+
                         "from as_user u where u.state = 1 "+
                         "order by follower_count desc";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            int count = 0;
            while(rs.next() && count<10){
                String userid = rs.getString(1);
                user_list.add(userid);
                count++;
            }
            sql = "select p.postid, (SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count "+
                  "from as_post p where p.state = 1 "+
                  "order by like_count desc";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            count = 0;
            while(rs.next() && count<10){
                String postid = rs.getString(1);
                post_list.add(postid);
                count++;
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
        list.add(user_list);
        list.add(post_list);
        return list;
    }

    public ArrayList getNextPost(PostBean pb){
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList postList = new ArrayList();
        try{
            cn = OraConnectionManager.getInstance().getConnection();
            String sql = "SELECT * from (select distinct p.postID, u.username, u.IconPath, p.caption, p.imageURL, to_char(p.timestamp,'yyyy/mm/dd hh24:mi') as timestamp, u.userId,"+
                         "(SELECT count(*) FROM as_like WHERE postId = p.postId) AS like_count, "+
                         "(SELECT count(*) FROM as_reply WHERE postId = p.postId) AS reply_count "+
                         "FROM as_user u LEFT JOIN as_post p on(u.userId = p.userId) "+
                         "LEFT JOIN as_follower f on(u.userID = f.userId) "+
                         "WHERE ((u.userId = ? or f.observerId = ?) and p.state = 1) and p.postId < ?"+
                         "ORDER BY timestamp desc) WHERE rownum < 4";
            st = cn.prepareStatement(sql);
            st.setString(1, pb.getUserId());
            st.setString(2, pb.getUserId());
            st.setString(3, pb.getPostId());
            rs = st.executeQuery();
            while(rs.next()){
                System.out.println("new post postid ="+rs.getString(1));
                PostBean p = new PostBean();
                p.setPostId(rs.getString(1));
                p.setUserName(rs.getString(2));
                p.setIconPath(rs.getString(3));
                p.setCaption(rs.getString(4));
                p.setImageURL(rs.getString(5));
                p.setTimestamp(rs.getString(6));
                p.setUserId(rs.getString(7));
                p.setLikeCount(rs.getString(8));
                p.setReplyCount(rs.getString(9));
                postList.add(p);
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
}