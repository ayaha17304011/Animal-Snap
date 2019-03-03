$(function(){
    //event
    $(document).on("click", "span.popup", function(e){
        var href= $(this).attr("href");
        $.ajax({
            url: href
        })
        .done(function (response) {
            console.log(href);
            $("#popup_window").show();
            $("body").css({"overflow":"hidden"});
            $("#popup_window .popup_box").html(response);
            var pid = $("#popup_window .replybox").find("input[name='postId']").val();
            getReply(pid);
        })
        .fail(function (response) {
        });
        return false;
    });
    $(document).on("click", ".following", function(){
        var uid = $("#uid").text();
        $.ajax({
            url:"followinglist",
            data:{
                "userId":uid
            }
        })
        .done(function(res){
            $(".popup_box").addClass("follow_box");
            $("#popup_window").show();
            $("body").css({"overflow":"hidden"});
            $("#popup_window .popup_box").html(res);
        });
    });
    $(document).on("click", ".follower", function(){
        var uid = $("#uid").text();
        $.ajax({
            url:"followerlist",
            data:{
                "userId":uid
            }
        })
        .done(function(res){
            $(".popup_box").addClass("follow_box");
            $("#popup_window").show();
            $("body").css({"overflow":"hidden"});
            $("#popup_window .popup_box").html(res);
        });
    });
    $(document).on("click", "#follow button", function(){
        var uid = $("#follow").find("input[name=userId]").val();
        var targetBtn = $(this).text();
        var counter = parseInt($(".followercount").text());
        console.log(targetBtn);
        $.ajax({
            url:"follow",
            type:"POST",
            data:{
                "userId": uid
            }
        })
        .done(function(res){
            followcheck(uid);
            if(targetBtn == "フォローする"){
                $("#follow button").text("フォロー中");
                $(".followercount").text(counter + 1);
            }else if(targetBtn == "フォロー中"){
                $("#follow button").text("フォローする");
                $(".followercount").text(counter - 1);
            }
        })
        .fail(function(res){

        });
    });
    $(document).on("click",".heart",function(){
        console.log("like");
        var pid = $(this).closest(".post").attr("id");
        var counter = parseInt($("."+ pid +" .likecount").text());
        console.log(pid);
        like(pid);
        var heart = $("."+ pid +" .heart");
        if(heart.attr('class') == "heart outline"){
            heart.removeClass("outline");
            heart.addClass("red");
            $("."+ pid +" .likecount").text(counter+1);
        }else if(heart.attr('class') == "heart red"){
            heart.removeClass("red");
            heart.addClass("outline");
            $("."+ pid +" .likecount").text(counter-1);
        }
    });
    $("div.popup_box").parent().click(function(e){
		closepopup();
    });
    $("div.popup_box").click(function(e){
        e.stopPropagation();

    });

    $(document).ready(function(){
        var pageuid = $("#uid").text();
        $.ajax({
            url: "getuserposts?userId="+pageuid
        })
        .done(function (response) {
            $(".mypost").show();
            $(".load").hide();
            $(".mypost .postlist").html(response);
        })
        .fail(function (response) {
        });

        $(".slick-arrow").click(function(ev){
            ev.stopPropagation();
        });
        $(document).bind("scroll",scrollHandler);
        return false;
    });
    //reply
    $(document).on("click",".showreply", function(e){
        var pid = $(this).find('span').text();
        console.log("pid="+pid);
        getReply(pid);
        $("#"+pid+" .replies").toggle();
        
        return false;
    });
    $(document).on("submit", ".replybox", function(e){
        var pid = $(this).find("input[name='postId']").val();
        var text = $(this).find("textarea").val();
        console.log(text);
        if(text != ""){
            var c = confirm("reply confirm");
            if(c == true){
                reply(pid, text);
                getReply(pid);
                $(this).find("textarea").val("");
            }else{
                alert("reply reject");
            }
        }
        return false;
    });
    //onscroll
    var scrollHandler = function(){
        var vt = $(document).scrollTop();
        var lpTop = $(".post").last().offset().top;
        var lastpost = $(".post").last().attr("id");
        if(vt > (lpTop - 500)){
            $(document).unbind("scroll",scrollHandler);
            console.log("scroll true");
            getNextPost(lastpost);
        }
    };

    //event
    //function
    
    
    function reply(pid, text) {
        console.log("pid = "+ pid +"text = "+ text);
        $.ajax({
            url: "reply",
            type: "POST",
            dataType: "text",
            data: {
                "postId" : pid,
                "replytext" : text
            }
        })
        .done(function (response) {
            getReply(pid);
        })
        .fail(function (response) {
            alert("fail");
        });
    }
    function getNextPost(lpid){
        console.log("getnext1");
        $.ajax({
            url: "getnextpost",
            data:{
                "postId": lpid
            }
        })
        .done(function(res) {
            if(res.match(/post/)){
                $(".single-item").slick("unslick");
                console.log("getnext done");
                $(".post").last().after(res);
                setTimeout(function(){
                    slickstart();
                    $(document).bind("scroll",scrollHandler);
                },500);
            }
        })
        .fail(function(){
            console.log("stop");
            return false;
        });
    }
    function getReply(pid){
        $.ajax({
            url: "replylist",
            data: {
                "postId" : pid
            }
        })
        .done(function (response) {
            $("#"+ pid +" .replies").html(response);
        })
        .fail(function (response) {
            alert("error");
        });
    }
    function closepopup() {
        $("#popup_window").hide();
        $("body").css({"overflow":"initial"});
        $("#popup_window .popup_box").empty();
        $(".popup_box").removeClass("follow_box");
    }
    function like(pid){
        $.ajax({
            url: "like",
            data:{
                "postId": pid
            }
        });
    }
    /* function getPostView(pid){
        $.ajax({
            url:"getpostview",
            data:{
                "postId":pid
            }
        }).done(function (response) {
            $("#popup_window").show();
            $("body").css({"overflow":"hidden"});
            $("#popup_window .popup_box").html(response);
            getReply(pid);
        })
        .fail(function (response) {
        });
    } */
    //function


    //effect
    var sourceSwap = function () {
        var $this = $(this).children("img");
        var newSource = $this.data('alt-src');
        $this.data('alt-src', $this.attr('src'));
        $this.attr('src', newSource);
    };
    $("a.nav-link").hover(sourceSwap,sourceSwap);
});
function likecheck(pid){
    $.ajax({
        url:"likecheck",
        data: {
            "postId": pid
        }
    })
    .done(function(res) {
        console.log("likecheck done");
        if(res.match(/true/)){
            console.log("t");
            $("."+ pid +" span.like > .heart").addClass("red");
		}else if(res.match(/false/)){
            console.log("f");
            $("."+ pid +" span.like > .heart").addClass("outline");
        }
    })
    .fail(function(res){
        console.log("likecheck fail");
    });
}
function followcheck(uid){
    $.ajax({
        url:"followcheck",
        data: {
            "userId": uid
        }
    })
    .done(function(res) {
       $("#follow span").html(res);
    })
    .fail(function(res){

    });
}
function slickstart(){
    $(".single-item").slick({
        adaptiveHeight:true,
    });
}