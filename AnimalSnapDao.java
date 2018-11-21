void login(id,pass){
    if((select userID from User where loginID=id and passWord=pass)!=null){
        if(followCheck()==False){
            //おすすめユーザーリスト
        }else{
            //タイムライン表示
        }
    }else{
        alert();
    }
}
void regist(id,name,pass){
    //DB作成時：create sequence seq_user_id start with 1 increment by 1;
    String sql = "insert into user(userid,loginid,username,password) values(seq_user_id.nextval,'"+id+"','"+name+"','"+pass+"')";
}
void follow(userID,followerID){
    if((select userID from follower where followerID=followerID and userID=userID)==null){
        String sql = "insert into follower(userID,followerID) values('"+userID+"','"+followerID+"')";
    }else{
        String sql = "delete from follower where followerID="+followerID+" and userID="+userID;
    }
}
void like(userID,postID){
    if((select userID from like where postID=postID and userID=userID)==null){
        String sql = "insert into like(userID,postID) values('"+userID+"','"+postID+"')";
    }else{
        String sql = "delete from like where postID="+postID+" and userID="+userID;
    }
}
void post(useID,caption,imageURL){
    String sql = "insert into post(useID,caption,imageURL) values("+userID+",'"+caption+"','"+imageURL+"')";
}
UserBean getUserInfo(userID){
    String sql = "select * from User where userID="+userID;
    //statement resultsetなどするよ
    rs.next()
    userbean.setid(rs.getInt(1));
    userbean.setloginID(rs.getString(2));
    userbean.setusername(rs.getString(3));
    return UserBean
}
ArrayList getReplyList(postID){
    ArrayList replyList;
    String sql = "select * from Reply where postID="+postID+" order by timestamp";
    //statement resultsetなどするよ
    while(rs.next()){
        ReplyBean.setid(rs.getInt(1));
        ReplyBean.setpostID(rs.getString(2));
        ReplyBean.setusername(rs.getString(3));
        replyList.add(ReplyBean);
    }
    return replyList;
}
ArrayList getLikeList(postID){
    ArrayList likeList;
    String sql = "select * from Like where postID="+postID+" order by timestamp";
    //statement resultsetなどするよ
    while(rs.next()){
        LikeBean.setid(rs.getInt(1));
        LikeBean.setpostID(rs.getString(2));
        LikeBean.setusername(rs.getString(3));
        likeList.add(LikeBean);
    }
    return likeList;
}
//command
ArrayList getTimeLine(int userID){
    ArrayList allPostList;
    //フォローしているユーザーのリスト　戻り値userIDのArrayList
    ArrayList followingList = getFollowingList(userID);
    //userIDからそれぞれの投稿をリストで取ってくる
    for(int i=0; i < followingList.length(); i++){
        int userID = followingList[i];
        Map PostMap = getPostList(userID);
        allPostList.add(PostMap);
    }
    //自分の投稿も取ってくる
    allPostList.add(getPostList(userID));
    //リストを混ぜて、timestampの新しい順に並べる
    

    return allPostList;
}
ArrayList getPostList(userID){
    ArrayList postList;
    String sql = "select postID,imageURL from Post where userID="+userID+" order by timestamp";
     while(rs.next()){
        PostBean.setpostID(rs.getInt(1));
        PostBean.setimageURL(rs.getString(2));
        postList.add(PostBean);
    }
    return postList;
}
ArrayList getFollowingList(ownUserID){
    select userID from follower where followerID=ownUserID;
    //while文でsetして、Listをreturn
}
ArrayList getFollowerList(ownUserID){
    select followerID from follower where userID=ownUserID;
    //while文でsetして、Listをreturn
}
ArrayList getPostView(postID){
    ArrayList postList;
    String sql = "select * from Post where postID="+postID+" order by timestamp";
    rs.next();
    PostBean.setpostID(rs.getInt(1));
    PostBean.setuserID(rs.getInt(2));
    PostBean.setCaption(rs.getString(3));
    PostBean.setimageURL(rs.getString(4));
    PostBean.setTimeStamp(rs.getString(5));
    postList.add(PostBean);
    return postList;
}