$(function() {
    $(".btn1").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h2/>").text("���O�C��"),
            $("<form/>",{
                action: 'login',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: '���[�U�[ID',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: '�p�X���[�h',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '���O�C��',
                    class: 'submitbutton'
                })
            )
        );
    });
    $(".btn2").on("click",function(){
        $(".box2").empty();
        $(".box2").append(
            $("<h2/>").text("�V�K�o�^"),
            $("<form/>",{
                action: 'regist',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: '���[�U�[ID',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'text',
                    name: 'username',
                    placeholder: '�\����',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: '�p�X���[�h',
                    class: 'nyuuryoku',
                    required:true
                }),
                $("<input/>",{
                    type: 'submit',
                    value: '�V�K�o�^',
                    class: 'submitbutton'
                })
            )
        );
    });
});