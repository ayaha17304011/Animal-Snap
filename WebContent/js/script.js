$(function(){
    $(document).on("click", "a.popup", function(e){
        var href= $(this).attr("href");
        
        $.ajax({
            url: href
        })
        .done(function (response) {
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
})