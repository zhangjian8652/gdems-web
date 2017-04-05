<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        菜单管理
        <small>系统菜单</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">菜单管理</a></li>
        <li class="active">添加菜单</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-6">
            <!-- Form Element sizes -->
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">添加菜单</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-md-12">
                            <form id="menu-add-form" action="/menu/add" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">菜单名称:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="name" id="name">
                                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">父菜单</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2"  name="parentId"
                                                data-placeholder="选择父菜单"
                                                style="width: 100%;">
                                            <option value="NO">无</option>
                                            [@menu type="LIST" all="YES";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as menu]
                                            <option value="${menu.id}"><b>${menu.name}</b> [${menu.permission}] -- ${menu.href}</option>
                                            [/#list]
                                            [/#if]
                                            [/@menu]
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">排序编号:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="sort" placeholder="数值越大越前">
                                        <span class="glyphicon glyphicon-sort-by-attributes-alt form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">访问链接:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="href" placeholder="访问链接">
                                        <span class="glyphicon glyphicon-link form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">图标样式:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="icon" placeholder="图标样式">
                                        <span class="glyphicon glyphicon-bookmark form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">权限名:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="permission" id="permission" placeholder="例如：sys:menu:add">
                                        <span class="glyphicon glyphicon-sunglasses form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否展示:</label>
                                    <div class="col-sm-4 input-group">
                                        <label class="col-sm-12" style="padding-top: 7px;">
                                            展示：<input type="radio" name="isShow" class="flat-red" value="0" checked>
                                            隐藏：<input type="radio" name="isShow" class="flat-red" value="1">
                                        </label>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>

                                    <div class="col-sm-6 input-group">
                                            <button type="button" class="btn  btn-info btn-lg  margin" id="cancel" data-uri="/menu/list">取消添加</button>
                                            <button type="submit" class="btn  btn-success btn-lg margin">确定添加</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->

        </div>
        <!--/.col (left) -->
        <div class="col-md-6" id="menu-tree">

       </div>
    </div>
    <!-- /.row -->
    <div class="row">
        [#include "icons.ftl"/]
    </div>

</section><!-- /.content -->

<script type="text/javascript">

    $(function () {

        //Initialize Select2 Elements
        $(".select2").select2();

        $("#cancel").click(function(){
            loadView($(this).data("uri"));
        })

        var loadMenuView = function(){
            loadViewToBox("#menu-tree","/menu/tree");
        }

        var $iChecks = $("input[type='radio']");

        $iChecks.iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });

        loadMenuView();

        /**
         * 添加用户表单
         */


        //登录表单验证开始
        var menuAddFormRules = {
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 40,
                    remote: {
                        type: "POST",
                        url: "/menu/exist",             //servlet
                        data: {
                            name: function () {
                                return $("#name").val();
                            }
                        }
                    }
                },
                permission:{
                    required:true,
                    remote: {
                          type: "POST",
                                  url: "/menu/exist",             //servlet
                                  data: {permission: function () {
                                  return $("#permission").val();
                              }
                          }
                    }
                }
            },
            messages: {
                name: {
                    required: "菜单名必须填写"
                    , minlength: "菜单名长度必须大于{0}"
                    , maxlength: "菜单名长度不能大于{0}"
                    , remote: "菜单名已经存在"
                }
            },
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form

                var $form, requestPath, method, requestData, callBack;

                $form = $(form);
                requestPath = $path + $form.attr("action") + "?" + $form.serialize();
                method = $form.attr("method");

                callBack = function (data) {
                    var successCode = "100000", $tipper = $("#tipper");
                    var jsonData = data;

                    if (successCode === jsonData.code) {
                        $tipper.messager().success(jsonData.message);
                        //将所有输入框重置
                        $("input:text").val("");
                        loadMenuView();
                        return;
                    }

                    $tipper.messager().error(jsonData.message);

                }

                $.ajax({url: requestPath, type: method, data: {}, success: callBack, error: callBack});

            }
        }

        $.extend(menuAddFormRules, GlobalVariable.formBaseRules);

        var $menuddForm = $("#menu-add-form");

        if ($menuddForm.length > 0) {
            $menuddForm.validate(menuAddFormRules);
        }


    });




</script>