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
        })
        .fail(function (response) {
        });
        return false;
    });
    $(document).on("click", "a.close", function(e){
        closepopup();
    })
    $("div.popup_box").parent().click(function(e){
		closepopup();
    });
    $("div.popup_box").click(function(e){
        e.stopPropagation();
    })
    $(window).ready(function(){
	    $(".slick-list").click(function(e){
	        e.stopPropagation();
	    });
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
    })
    //reply
    $(document).on("click",".reply", function(e){
        var pid = $(this).find('span').text();
        console.log("pid="+pid);
        getReply(pid);
        return false;
    })
    $(document).on("submit", ".replybox", function(e){
        var pid = $(this).find("input[name='postId']").val();
        var text = $(this).find("textarea").val();
        if(text != ""){
            var c = confirm("reply confirm");
            if(c == true){
                reply(pid, text);
                $(this).find("textarea").val("");
            }else{
                alert("reply reject");
            }
        }
        return false;
    })
    //event
    //function
    function reply(pid, text) {
        $.ajax({
            url: "reply",
            type: "POST",
            data: {
                "postId" : pid,
                "replytext" : text
            }
        })
        .done(function (response) {
            alert("done");
        })
        .fail(function (response) {
            alert("fail");
        })
    }
    function getReply(pid){
        $.ajax({
            url: "replylist",
            data: {
                "postId" : pid
            }
        })
        .done(function (response) {
            $("#popup_window").show();
            $("body").css({"overflow":"hidden"});
            $("#popup_window .popup_box").html(response);
        })
        .fail(function (response) {
            alert("error")
        })
    }
    function closepopup() {
        $("#popup_window").hide();
        $("body").css({"overflow":"initial"})
        $("#popup_window .popup_box").empty();
    }
    //function
})