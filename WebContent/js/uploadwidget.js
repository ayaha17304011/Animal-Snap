// global variable
UPLOADCARE_PUBLIC_KEY = '287d0ba7369170ef5b54';
UPLOADCARE_TABS = 'file';
UPLOADCARE_LOCALE = "ja";
UPLOADCARE_EFFECTS = ['crop','rotate','blur', 'sharp', 'grayscale','invert','mirror'];

UPLOADCARE_LOCALE_TRANSLATIONS = {
    // error messages for widget
    errors: {
        "fileType" : "file Invalid"
    }
};
//widget image
var image = [];
var widget = uploadcare.Widget('[role=uploadcare-uploader]');
//validators for in widget error
widget.validators.push(fileTypeCheck);
//regist for effects
uploadcare.registerTab('preview', uploadcareTabEffects);

//oncomplete event
widget.onUploadComplete(function(info) {
    //clear sessionStorage first for reupload preview
    sessionStorage.clear();
    //do
    getFilesGroup(info.uuid);
});

function getFilesGroup(url){
    uploadcare.loadFileGroup(url)
    .done(function(fileGroup) {
        var arrayOfFiles = fileGroup.files();
        console.log(arrayOfFiles);
        $.when.apply(null, arrayOfFiles)
            .done(function() {
                // Info for each file will be passed as an argument.
                var fileInfos = arguments;
                var fullurl = "";
                $.each(fileInfos, function(i, fileInfo) {
                    // i is file position in the group.
                    console.log(i, fileInfo);
                    var url = fileInfo.cdnUrl;
                    if (fileInfo.isImage === true){
                        url += "image";
                    }else{
                        url += "video";
                    }
                    //set url in sessionStorage for preview image
                    sessionStorage.setItem(i,url);
                    fullurl += "," + url;
                });
                $("input[name=url]").val(fullurl.substring(1));
                preview(sessionStorage.length);
            });
        })
    .fail(function() {
        console.log("fail");
    });
}

function preview(fileLength){
    console.log(fileLength);
    if(fileLength == 1){
        console.log("ok");
        var image = sessionStorage.getItem("0");
        $(".body > img").attr("src",image);
    }
    $("#postpreview").show();
}

function fileTypeCheck(fileInfo){
    console.log(fileInfo.isImage);
    console.log(fileInfo.mimeType !== "video/mp4");
    if(fileInfo.isImage === false){
        if(fileInfo.mimeType !== "video/mp4"){
            if(fileInfo.mimeType !== "video/webm"){
                if(fileInfo.mimeType !== "video/ogg"){
                    throw new Error("fileType");
                }
            }
        }
    }
}