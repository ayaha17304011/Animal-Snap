$(function() {
    $(".btn1").on("click",function(){
        $(".box3").removeClass("d-none");
        $(".box2").addClass("d-none");
        $(".form").append(
            $("<h2/>").text("���O�C��"),
            $("<form/>",{
                action: 'login',
                method: 'post'
            }).append(
                $("<input/>",{
                    type: 'text',
                    name: 'loginid',
                    placeholder: '���O�C��ID',
                    class: 'nyuuryoku',
                    required:true,
                    pattern: '[0-9A-Za-z]+$',
                    title : '�������A���t�@�x�b�g�œ��͂��Ă�������'
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: '�p�X���[�h',
                    class: 'nyuuryoku',
                    required:true,
                    pattern: '[0-9A-Za-z]+$',
                    title : '�������A���t�@�x�b�g�œ��͂��Ă�������'
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
                    placeholder: '���O�C��ID',
                    class: 'nyuuryoku',
                    required:true,
                    pattern: '[0-9A-Za-z]+$',
                    maxlength : '30',
                    title : '�������A���t�@�x�b�g�œ��͂��Ă�������'
                }),
                $("<input/>",{
                    type: 'text',
                    name: 'username',
                    placeholder: '���[�U�[��',
                    class: 'nyuuryoku',
					pattern: "[^' ']+",
                    maxlength : '15',
                    title : '15�����ȓ��œ��͂��Ă�������',
                    required:true
                }),
                $("<input/>",{
                    type: 'password',
                    name: 'pass',
                    placeholder: '�p�X���[�h',
                    class: 'nyuuryoku',
                    required:true,
                    maxlength : '12',
                    title : '�������A���t�@�x�b�g�œ��͂��Ă�������'
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