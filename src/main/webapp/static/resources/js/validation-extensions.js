/**
 * Created by Administrator on 2017/3/28.
 */

$(function(){

    $.validator.addMethod("username", function(value, element) {
        return this.optional( element ) || /^[0-9a-zA-Z_]+$/.test(value);
    }, "用户名必须为字母数字下划线组成");

    $.validator.addMethod("mobileCN", function(value, element) {
        return this.optional( element ) || /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/.test(value);
    }, "用户名必须为字母数字下划线组成");

    $.validator.addMethod("fixedMobileCN", function(value, element) {
        return this.optional( element ) || /^(0\\d{2}-\\d{8}(-\\d{1,4})?)|(0\\d{3}-\\d{7,8}(-\\d{1,4})?)$/.test(value);
    }, "用户名必须为字母数字下划线组成");


});

