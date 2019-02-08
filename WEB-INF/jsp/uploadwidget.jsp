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
        <div class="container mt-4">
            <div class="mb-4 mt-2">
            <input type="hidden" role="uploadcare-uploader" id="uploadedImage"
                data-preview-step="true"
                data-effects="crop,rotate,enhance,sharp,grayscale"
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
            //1
            // global variable
            window.UPLOADCARE_PUBLIC_KEY = '287d0ba7369170ef5b54';
            UPLOADCARE_TABS = 'file';
            UPLOADCARE_LOCALE = "ja";
            UPLOADCARE_EFFECTS = ['crop','rotate','blur', 'sharp', 'grayscale','invert','mirror'];

            uploadcare.registerTab('preview', uploadcareTabEffects);
           
            const widget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
            
            widget.onUploadComplete(function(info) {
                save(info).then(() => {
                    document.querySelector("[name=url]").value = sessionStorage.images
                    console.log(info)
                    console.log(info.cdnUrl)
                    console.log(info.originalImageInfo)
                    console.log(info.originalImageInfo.width)
                    console.log(info.originalImageInfo.height)
                })
                .then(() =>{
                    const image = sessionStorage.getItem('images' || "[]");
                    $(".body > img").attr("src",image);
                    $("#postpreview").show();
                })
            })
            function save(info){
                return new Promise(resolve => {
                    sessionStorage.clear();
                    let height = info.originalImageInfo.height
                    let url = info.cdnUrl;
                    if(height > 600){
                        var fullUrl= url + "-/crop/600x600/center/"
                    }
                    sessionStorage.setItem('images', fullUrl)
                    setTimeout(() => resolve(), 500)
                })
            }
            function fetch(){
                return new Promise(resolve => {
                    const image = sessionStorage.getItem('images' || "[]");
                    setTimeout(() => resolve(), 500)
                })
            }
            </script>
    </body>
</html>