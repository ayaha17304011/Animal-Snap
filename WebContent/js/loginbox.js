$(function() {
    $(".btn1").on("click",function(){
        $(".box3").removeClass("d-none");
        $(".box2").addClass("d-none");
        $(".form").append(
            $("<h2/>").text("ログイン"),
            $("<form/>",{
                action: 'login',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: 'ログインID',
                    class: 'nyuuryoku',
                    required:true,
                    pattern: '[0-9A-Za-z]+$',
                    title : '数字かアルファベットで入力してください'
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: 'パスワード',
                    class: 'nyuuryoku',
                    required:true,
                    pattern: '[0-9A-Za-z]+$',
                    title : '数字かアルファベットで入力してください'
                }),
                $("<input/>",{
                    type: 'submit',
                    value: 'ログイン',
                    class: 'submitbutton'
                })
            )
        );
    });
    $(".btn2").on("click",function(){
        $(".box3").removeClass("d-none");
        $(".box2").addClass("d-none");
        $(".form").append(
            $("<h2/>").text("新規登録"),
            $("<form/>",{
                action: 'regist',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: 'ログインID',
                    class: 'nyuuryoku',
                    required:true,
                    pattern: '[0-9A-Za-z]+$',
                    maxlength : '30',
                    title : '数字かアルファベットで入力してください'
                }),
                $("<input/>",{
                    type: 'text',
                    name: 'username',
                    placeholder: 'ユーザー名',
                    class: 'nyuuryoku',
					pattern: "[^' ']+",
                    maxlength : '15',
                    title : '15文字以内で入力してください',
                    required:true
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: 'パスワード',
                    class: 'nyuuryoku',
                    required:true,
                    maxlength : '12',
                    title : '数字かアルファベットで入力してください'
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '新規登録',
                    class: 'submitbutton'
                })
            )
        );
    });
    $(".back").click(function(){
        $(".form").empty();
        $(".box2").removeClass("d-none");
        $(".box3").addClass("d-none");
    });
});