UPLOADCARE_PUBLIC_KEY = '287d0ba7369170ef5b54';
UPLOADCARE_TABS = 'file';
UPLOADCARE_LOCALE = "ja";

var icon;
var input = document.getElementById("icon");

var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
singleWidget.onUploadComplete(function(info) {
    icon = "";
    $(".iconpreviwe").empty();
    //do
    preview(info.cdnUrl);
});

function preview(url){
    icon = url + "-/resize/150x150/icon";
    console.log(url);
    $(".iconpreviwe").append("<img src='"+ icon +"' class='rounded-circle'>").show();
    input.value = icon;
}