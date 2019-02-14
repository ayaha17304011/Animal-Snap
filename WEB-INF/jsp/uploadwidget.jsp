<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html lang="jp">
    <head>
        <meta charset="Windows-31J">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget-tab-effects/1.x/uploadcare.tab-effects.min.js"></script>
        <title>あにまる すなっぷ</title>
        <style>
            #Postpreview {
                margin: 0 auto;
                border: solid;
                border-color: #e4e8e4;
                border-width: 3px;
                margin-top: 5%;
                background-color: #ffffff;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4 pre-upload">
            <div class="mb-4 mt-2">
            <input type="hidden" role="uploadcare-uploader" id="uploadedImage"
                data-preview-step="true"
                data-multiple="true"
                data-multiple-min="1"
                data-multiple-max="10"
                 />
            </div>

            <div id="postpreview" style="display: none; width: 600px;">
                <div class="body" style="max-height: 600px; text-align: center; background-color: rgba(255,0,0,0.1);">
                    <img style="max-width: 600px;"/>
                </div>
                <div class="foot">
                    <form method="post" action="post">
                        <input type="hidden" name="url" />
                        <textarea placeholder="コメントを追加(300字以内)"
                            name="caption"
                            class="captiontext"
                            maxlength="300"></textarea>
                            <button type="submit" class="btn btn-info">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
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
            }
            //widget image
            var image = []
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
            })

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
                                    url += "image"
                                }else{
                                    url += "video"
                                }
                                //set url in sessionStorage for preview image
                                sessionStorage.setItem(i,url);
                                fullurl += "," + url;
                            });
                            $("input[name=url]").val(fullurl.substring(1))
                            preview(sessionStorage.length);
                        });
                    })
                .fail(function() {
                    console.log("fail")
                });
            }

            function preview(fileLength){
                console.log(fileLength);
                if(fileLength == 1){
                    console.log("ok")
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
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>