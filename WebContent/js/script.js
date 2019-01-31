$(function(){
    $(document).on("click", "a.popup", function(e){
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
        $("#popup_window").hide();
        $("body").css({"overflow":"initial"})
    })
    $(document).ready(function(){
        var pageuid = document.getElementById("uid").textContent;
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
})