$(function(){
    //event
    $(document).on("dblclick", "span.popup", function(e){
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
    $(".heart").click(function(){
        var pid = $(this).closest(".post").attr("id");
        like(pid);
        var heart = $(this);
        var cnt;
        if(heart.attr('class') == "heart outline"){
            heart.removeClass("outline");
            heart.addClass("red");
        }else if(heart.attr('class') == "heart red"){
            heart.removeClass("red");
            heart.addClass("outline");
        }
    });
    $("div.popup_box").parent().click(function(e){
		closepopup();
    });
    $("div.popup_box").click(function(e){
        e.stopPropagation();

    });
    $("button").dblclick(function(e){
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
    }
    function like(pid){
        $.ajax({
            url: "like",
            data:{
                "postId": pid
            }
        });
    }
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
            $("#"+ pid +" span.like > .heart").addClass("red");
		}else if(res.match(/false/)){
            console.log("f");
            $("#"+ pid +" span.like > .heart").addClass("outline");
        }
    })
    .fail(function(res){
        console.log("likecheck fail");
    });
}
