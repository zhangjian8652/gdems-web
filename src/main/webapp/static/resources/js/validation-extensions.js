/**
 * Created by Administrator on 2017/3/28.
 */

$(function(){
    $.validator.addMethod("username", function(value, element) {
        return /^[0-9a-zA-Z_]+$/.test(value);
    }, "用户名必须为字母数字下划线组成");
});

