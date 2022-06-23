$(function(){
    const labels = document.querySelectorAll('.form-control label');
    labels.forEach(label => {
        label.innerHTML = label.innerText
            .split('')
            .map((letter, idx) => `<span style="transition-delay:${idx * 50}ms">${letter}</span>`)
            .join('')
    });
})
$(function() {
    // 点击sigup触发翻转样式
    $("#register").click(function () {
        $(".container").toggleClass("middle-flip");
    });
})
$(function() {
    $("#login").click(function() {
        $(".container").toggleClass("middle-flip");
    });
})

$(function(){
    //登录
    /*$("#loginbtn").click(function(){
        var data = $("#login_form").serialize();
        $.ajax({
            type: "post",
            url: "login",
            data: data,
            dataType: "json", //返回数据类型
            success: function(data){
                if("success" == data.type){
                    window.location.href= "tomain";
                } else{
                    $("#login_message").html(data.msg);
                }
            }
        });
    })*/
    //注册
    $("#registerbtn").click(function(){
        $.post({
            url: "http://localhost:8080/SSM_EMP/users/register.do",
            data: {
                "username":$("#register_username").val(),
                "password":$("#register_password").val()
            },
            dataType: "json", //返回数据类型
            success: function(data){
                $("#register_message").html(data.msg);
            }
        });
    })
    var username_msg = "";
    var password_msg = "";
    var confirm_msg = "";
    $("#register_username").blur(function(){
        if(!(/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/.test($("#register_username").val()))){
            username_msg = "字母开头，5-16位，字母数字下划线";
            $("#registerbtn").attr('disabled', 'disabled');
            $("#register_msg1").html(username_msg);
        }else {
            username_msg = "";
            $("#register_msg1").html(username_msg);
        }
        $.btn_able();
    })
    $("#register_password").blur(function(){
        if(!(/^[a-zA-Z]\w{5,17}$/.test($("#register_password").val()))){
            password_msg = "字母开头，6~18位，只能包含字母数字下划线";
            $("#registerbtn").attr('disabled', 'disabled');
            $("#register_msg2").html(password_msg);
        }else {
            password_msg = "";
            $("#register_msg2").html(password_msg);
        }
        $.btn_able();
    })
    $("#register_confirm").blur(function(){
        if($("#register_password").val() != $("#register_confirm").val()){
            confirm_msg = "两次密码不一致";
            $("#registerbtn").attr('disabled', 'disabled');
            $("#register_msg3").html(confirm_msg);
        }else {
            confirm_msg = "";
            $("#register_msg3").html(confirm_msg);
        }
        $.btn_able();
    })
    $.btn_able=(function(){
        if(username_msg === ''
            && password_msg === ''
            && confirm_msg === ''){
            $("#registerbtn").removeAttr("disabled");
        }
    })
})
