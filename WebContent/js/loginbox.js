$(function() {
    $(".btn1").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h2/>").text("ログイン"),
            $("<form/>",{
                action: 'login',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: 'ユーザーID',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: 'パスワード',
                    class: 'nyuuryoku',
                    required:true
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
        $(".box2").empty();
        $(".box2").append(
            $("<h2/>").text("新規登録"),
            $("<form/>",{
                action: 'regist',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: 'ユーザーID',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'text',
                    name: 'username',
                    placeholder: '表示名',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: 'パスワード',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '新規登録',
                    class: 'submitbutton'
                })
            )
        );
    });
});