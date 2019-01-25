$(function() {
    $(".btn1").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h1/>").text("ログイン"),
            $("<form/>",{
                action: 'login',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: 'ユーザーID',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: 'パスワード',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'submit',
                    value: 'ログイン',
                    class: 'submitbutton'
                }),
                $("<input/>",{
                    type: 'submit',
                    name:'btn2',
                    value: '新規登録',
                    class: 'submitbutton'
                })
            ),
        )
    });
    $(".btn2").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h1/>").text("新規登録"),
            $("<form/>",{
                action: 'regist',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: 'ユーザーID',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: 'パスワード',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '新規登録',
                    class: 'submitbutton'
                }),
                $("<input/>",{
                    type: 'submit',
                    name:'btn1',
                    value: 'ログイン',
                    class: 'submitbutton'
                })
            ),
        )
    });
});