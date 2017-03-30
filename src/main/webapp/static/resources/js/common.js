/**
 * Created by Administrator on 2017/3/28.
 */
var GlobalVariable = {
    formBaseRules:{
        errorClass: "error", //默认为错误的样式类为：error
        errorPlacement:function(error, element){ //把错误信息放在验证的元素后面
            element.parent().removeClass("has-success").addClass("has-error");
            element.parent().children("span").eq(0).removeClass("glyphicon-ok").addClass("glyphicon-remove");
            element.parent().children("span").eq(1).removeClass("glyphicon-ok").addClass("glyphicon-remove");
            error.appendTo(element.parent());
        },
        success:function(label){
            label.parent().addClass("has-success").removeClass("has-error");
            label.parent().children("span").eq(0).removeClass("glyphicon-remove").addClass("glyphicon-ok");
            label.parent().children("span").eq(1).removeClass("glyphicon-remove").addClass("glyphicon-ok");
            label.remove();
        }
        //focusInvalid: false, //当为false时，验证无效时，没有焦点响应
        //onkeyup: false,
    }
}


var URIS = {
    dashboard:"/dashboard"
}