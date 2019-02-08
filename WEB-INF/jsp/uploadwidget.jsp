<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
    <head>
        <title>‚ ‚É‚Ü‚é ‚·‚È‚Á‚Õ</title>
    </head>
    <body>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget-tab-effects/1.x/uploadcare.tab-effects.min.js"></script>
        
        <div class="container mt-4">
            <div class="float-right mb-4 mt-2">
            <input type="hidden" role="uploadcare-uploader" id="uploadedImage"
                data-preview-step="true"
                data-effects="crop,rotate,enhance,sharp,grayscale" 
                 />
            </div>
            <form method="post" action="post">
                <input type="hidden" name="url" />
                <textarea placeholder="ƒRƒƒ“ƒg‚ð’Ç‰Á(300ŽšˆÈ“à)"
                    name="caption"
                    class="captiontext" 
                    spellcheck="false"
                    maxlength="300">
                </textarea>
                <input type="submit" value="submit"/>
            </form>
            <h2 class="mb-4">Simple Image Hosting</h2>
            <div class="row" id="imagesContainer"></div>
        </div>  
        <script>
            //1
            window.UPLOADCARE_PUBLIC_KEY = '287d0ba7369170ef5b54'
            uploadcare.registerTab('preview', uploadcareTabEffects)
            
            const widget = uploadcare.Widget('[role=uploadcare-uploader]');
            
            widget.onUploadComplete(function(info) {
                save(info.cdnUrl).then(() => {
                    document.querySelector("[name=url]").value = sessionStorage.images
                })
            })
            function save(url){
                return new Promise(resolve => {
                    sessionStorage.clear()
                    sessionStorage.setItem('images', url)
                    setTimeout(() => resolve(), 500)
                })
            }
            </script>
    </body>
</html>