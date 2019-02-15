<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html lang="jp">
    <head>
        <meta charset="Windows-31J">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget-tab-effects/1.x/uploadcare.tab-effects.min.js"></script>
        <title>あにまる すなっぷ</title>
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
        <script src="${pageContext.request.contextPath}/WebContent/js/uploadwidget.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>