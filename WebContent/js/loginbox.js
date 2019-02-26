$(function() {
    $(".btn1").on("click",function(){
        $(".box3").removeClass("d-none");
        $(".box2").addClass("d-none");
        $(".form").append(
            $("<h2/>").text("���N�C��"),
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
        $(".box3").removeClass("d-none");
        $(".box2").addClass("d-none");
        $(".form").append(
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
    $(".back").click(function(){
        $(".form").empty();
        $(".box2").removeClass("d-none");
        $(".box3").addClass("d-none");
    });
});