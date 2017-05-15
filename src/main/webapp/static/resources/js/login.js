/**
 * Created by zhengzhe on 2017/3/28.
 */

$(function () {
    /**
     * ICheck 初始化
     */

    var $remberInput = $("#remember");

    $remberInput.iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });

    $remberInput.on('ifChecked',function(){
        $(this).attr("checked","remember");
    });

    $remberInput.on('ifUnchecked',function(){
        $(this).attr("checked","");
    })

    //登录表单验证开始
    var loginFormRules = {
        rules: {
            username: {
                required: true,
                username: true,
                minlength: 4,
                maxlength: 20
            },
            password: {
                required: true,
                minlength: 4,
                maxlength: 20
            }
        },
        messages: {
            username: {
                required: "用户名必须填写"
                , username: "用户名必须为字母数字下划线组成"
                , minlength: "用户名长度必须大于{0}"
                , maxlength: "用户名长度不能大于{0}"
            },
            password: {
                required: "密码必须填写"
                , minlength: "密码长度必须大于{0}"
                , maxlength: "密码长度不能大于{0}"
            }
        },
        submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form

            var $form, requestPath, method, requestData, callBack;

            $form = $(form);
            requestPath = $path + $form.attr("action");
            method = $form.attr("method");
            var username = $("#username").val();
            var password = $("#password").val();
            var remember = $("#remember").attr("checked");

            requestData = {
                username: username,
                password: password,
                remember:remember
            }

            callBack = function (data) {
                var successCode = "100000",$tip=$("#tip");

                var jsonData = data;

                if(successCode === jsonData.code){
                    location.href = $path + URIS.dashboard;
                    return;
                }

                $tip.removeClass("hide");
                $tip.children("p").text(jsonData.message);

            }

            $.ajax({url:requestPath,type:method,data:requestData,success:callBack,error:callBack});

        }
    }

    $.extend(loginFormRules, GlobalVariable.formBaseRules);

    var $loginForm = $("#login-form");

    if ($loginForm.length > 0) {
        $loginForm.validate(loginFormRules);
    }

    //登录表单验证结束

});



