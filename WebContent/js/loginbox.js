$(function() {
    $(".btn1").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h1/>").text("���O�C��"),
            $("<form/>",{
                action: 'login',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: '���[�U�[ID',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: '�p�X���[�h',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '���O�C��',
                    class: 'submitbutton'
                }),
                $("<input/>",{
                    type: 'submit',
                    name:'btn2',
                    value: '�V�K�o�^',
                    class: 'submitbutton'
                })
            ),
        )
    });
    $(".btn2").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h1/>").text("�V�K�o�^"),
            $("<form/>",{
                action: 'regist',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: '���[�U�[ID',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: '�p�X���[�h',
                    class: 'nyuuryoku'
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '�V�K�o�^',
                    class: 'submitbutton'
                }),
                $("<input/>",{
                    type: 'submit',
                    name:'btn1',
                    value: '���O�C��',
                    class: 'submitbutton'
                })
            ),
        )
    });
});