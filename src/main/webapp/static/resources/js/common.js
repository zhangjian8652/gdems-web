/**
 * Created by Administrator on 2017/3/28.
 */
var GlobalVariable = {
    formBaseRules: {
        errorClass: "error", //默认为错误的样式类为：error
        errorPlacement: function (error, element) { //把错误信息放在验证的元素后面
            element.parent().removeClass("has-success").addClass("has-error");
            element.parent().children("span").eq(0).removeClass("glyphicon-ok").addClass("glyphicon-remove");
            element.parent().children("span").eq(1).removeClass("glyphicon-ok").addClass("glyphicon-remove");
            error.appendTo(element.parent());
        },
        success: function (label) {
            label.parent().addClass("has-success").removeClass("has-error");
            label.parent().children("span").eq(0).removeClass("glyphicon-remove").addClass("glyphicon-ok");
            label.parent().children("span").eq(1).removeClass("glyphicon-remove").addClass("glyphicon-ok");
            label.remove();
        }
        //focusInvalid: false, //当为false时，验证无效时，没有焦点响应
        //onkeyup: false,
    },
    containerId: "#container"
}


var URIS = {
    dashboard: "/dashboard"
    };


/**
 * 全局初始化需要做的事件绑定；
 */
$(function () {
    //绑定左边菜单收缩事件功能
    $(".page-button").click(function () {
        var uri = $(this).data("uri");
        loadView(uri);
    });
});


//发送请求获取页面视图
var loadView = function (uri) {

        var url = $path + uri;
        var callBack = function (html) {
            $(GlobalVariable.containerId).html(html);
        }

        $.get(url, callBack);
    },

//获取操作栏按钮组,编辑，删除
    operations = function (data, type, full, meta) {
        return getDetailButton(data) + getEditButton(data) + getDeleteButton(data);
    },
    getEditButton = function (id) {
        return "<button type='button' class='btn bg-maroon margin-right' data-id edit" + id + ">编辑</button>"
    },
    getDetailButton = function (id) {
        return "<button type='button' class='btn bg-orange margin-right' data-id detail" + id + ">详情</button>"
    },

    getDeleteButton = function (id) {
        return "<button type='button' class='btn bg-olive margin-right' data-id delete" + id + ">删除</button>"
    }
;