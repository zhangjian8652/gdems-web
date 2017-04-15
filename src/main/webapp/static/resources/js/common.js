/**
 * Created by Administrator on 2017/3/28.
 */
var GlobalVariable = {
    formBaseRules: {
        errorClass: "error", //默认为错误的样式类为：error
        errorPlacement: function (error, element) { //把错误信息放在验证的元素后面
            element.parent().removeClass("has-success").addClass("has-error");
            if(!element.is("select")){
                element.parent().children("span").eq(0).removeClass("glyphicon-ok").addClass("glyphicon-remove");
                element.parent().children("span").eq(1).removeClass("glyphicon-ok").addClass("glyphicon-remove");
            }
            error.appendTo(element.parent());
        },
        success: function (label,element) {
            label.parent().addClass("has-success").removeClass("has-error");
            if(!$(element).is("select")) {
                label.parent().children("span").eq(0).removeClass("glyphicon-remove").addClass("glyphicon-ok");
                label.parent().children("span").eq(1).removeClass("glyphicon-remove").addClass("glyphicon-ok");
            }
            label.remove();
        }
        //focusInvalid: false, //当为false时，验证无效时，没有焦点响应
        //onkeyup: false,
    },
    containerId: "#container"
}


var URIS = {
    dashboard: "/dashboard",
    login: "/"
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
        loadViewToBox(GlobalVariable.containerId, uri);
    },
    loadViewToBox = function (id, uri) {
        var url = $path + uri;
        var callBack = function (html) {
            $(id).html(html);
        }

        $.get(url, callBack);
    }
    ,

//获取操作栏按钮组,编辑，删除
    operations = function (data, type, full, meta) {
        return getDetailButton(data) + getEditButton(data) + getDeleteButton(data);
    },
    getEditButton = function (id) {
        return "<button type='button' class='btn bg-maroon margin-right edit' data-id " + id + ">编辑</button>"
    },
    getDetailButton = function (id) {
        return "<button type='button' class='btn bg-orange margin-right detail' data-id " + id + ">详情</button>"
    },

    getDeleteButton = function (id) {
        return "<button type='button' class='btn bg-olive margin-right delete' data-id " + id + ">删除</button>"
    }
    ;
var successCodePrefix = "20";

//设置AJAX的全局默认选项
$.ajaxSetup({
    aysnc: false, // 默认同步加载
    headers: { // 默认添加请求头
        "Authorization": "XXXXXXXX-XXXXXXX"
    },
    complete: function (xhr, status) {
        try {
            var result = eval("(" + xhr.responseText + ")");
            if (result.code == "403") {
                location.href = URIS.login;
                return false;
            }
        } catch (e) {

        }

    },
    error:function() {
        $("#tipper").messager().error("系统错误，请稍后再试！");
    }
});


var CommonUtil = {
    ajaxCallback:function(data) {
            if (data.code.startsWith(successCodePrefix)) {
                $("#tipper").messager().success(data.message);
                return;
            }else{
                $("#tipper").messager().error(data.message);
                return;
            }
    },loadViewToBox:loadViewToBox,
    loadView:loadView
}



/**
 * 给jquery绑定消息提示对象
 */
var allDefaultTimer = 3000;

(function (factory) {
    if (typeof define === "function" && define.amd) {
        define(["jquery"], factory);
    } else {
        factory(jQuery);
    }
}(function ($) {
    // 提示消息对象
    //content：提示的信息类容
    //type ：warn,success,info,error
    function messager(settings) {

        var defaultSettings = {
            time: allDefaultTimer,
            // tittle:"message-tittle",
            message: "message-content"
        }

        if (settings != undefined && settings != null) {
            defaultSettings = $.extend(defaultSettings, settings);
        }
        var $target = $(this);
        //    var tittle = $target.attr(defaultSettings.tittle);
        var message = $target.attr(defaultSettings.message);
        var hideTimer;

        var infoType = "INFO", errorType = "ERROR", warnType = "WARN", successType = "SUCCESS";

        //普通消息提示消息（白色背景）
        function info(content) {
            beforeTip();
            message = content != undefined && content != null ? content : message;
            $target.html(getDefaultTemplate(infoType));
            afterTip();
        }

        //错误提示消息（红色背景）
        function error(content) {
            beforeTip();
            message = content != undefined && content != null ? content : message;
            $target.html(getDefaultTemplate(errorType));
            afterTip();
        }

        //成功提示消息（绿色背景）
        function success(content) {
            beforeTip();
            message = content != undefined && content != null ? content : message;
            $target.html(getDefaultTemplate(successType));
            afterTip();
        }

        //警告提示消息（黄色）
        function warn(content) {
            beforeTip();
            message = content != undefined && content != null ? content : message;
            $target.html(getDefaultTemplate(warnType));
            afterTip()
        }

        function hide() {
            hideTimer = setTimeout(function () {
                clear();
            }, defaultSettings.time);
        }

        function beforeTip() {

        }

        function afterTip() {
            $target.children("button").click(function () {
                clear();
            });
            hide();
        }

        function clear() {
            $target.html("");
        }

        function getDefaultTemplate(type) {

            var content = "<div class='alert alert-{type} alert-dismissable'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>"
                + "<h4><i class='icon fa {icon}'></i>{tittle}</h4>"
                + message
                + "</div>";

            switch (type) {
                case errorType:
                    return content.replace("{type}", "danger").replace("{icon}", "fa-ban").replace("{tittle}", "错误");
                case warnType:
                    return content.replace("{type}", "warning").replace("{icon}", "fa-warning").replace("{tittle}", "警告");
                case successType:
                    return content.replace("{type}", "success").replace("{icon}", "fa-check").replace("{tittle}", "提示");
                case infoType:
                    return content.replace("{type}", "info").replace("{icon}", "fa-info").replace("{tittle}", "提示");
                default:
                    return content.replace("{type}", "info").replace("{icon}", "fa-info").replace("{tittle}", "提示");
            }

        }

        return {'info': info, 'warn': warn, 'error': error, 'success': success};

    }

    function loadContent(url) {

        function getAjaxHtml(url) {
            var resultData = "";
            jQuery.ajax({
                url: url,
                //默认值: true。默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。
                async: false,
                beforeSend: function () {

                },
                complete: function () {

                },
                data: {},
                success: function (data) {
                    resultData = data;
                },
                error: function () {

                },
                type: 'GET',
                dataType: "html"
            });

            return resultData;
        }

        var $contentElement = $(this);

        function handleHtml(contentHtml) {
            //console.log(contentHtml)
            $contentElement.html(contentHtml);
        }

        var result = getAjaxHtml(url);

        try {
            var jsonData = JSON.parse(result);
            handleJsonResult(jsonData);
        } catch (e) {
            handleHtml(result);
        }

        function handleJsonResult(jsonData) {
            console.log(jsonData);
        }


    }


    function modal() {
        var $modalElement = $(this);

        addCoverElement();

        $modalElement.removeClass("hide");

        $modalElement.find(".modal-close").click(function () {
            $modalElement.addClass("hide");
            $(".modal-cover").remove();
            window.scrollHanlder.enableScroll();
        });

        function addCoverElement() {
            $("body").append("<div class='modal-cover'></div>");
            window.scrollHanlder.disableScroll();
        }

    }

    var settings = {messager: messager, modal: modal, loadContent: loadContent};

    $.fn.extend(settings);

}));


var ZTreeUtil = {
    transferJSNodeToJAVANode: function (treeObj) {
        var zTreeCheckedNodes = treeObj.getCheckedNodes();
        var zTreeNodes = [];

        for (var i = 0; i < zTreeCheckedNodes.length; i++) {
            checkedNode = zTreeCheckedNodes[i];
            zTreeNode = {
                "id": checkedNode.id,
                "name": checkedNode.name,
                "isFirstNode": checkedNode.isFirstNode,
                "isParent": checkedNode.isParent,
                "open": checkedNode.open
            }
            zTreeNodes[i] = zTreeNode
        }
        return zTreeNodes;
    }


};
