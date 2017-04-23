<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户管理
        <small>系统角色</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">角色管理</a></li>
        <li class="active">添加角色</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- Form Element sizes -->
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">添加角色</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <form id="role-add-form" action="/role/add" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">角色名:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="name" id="name">
                                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">英文名:</label>
                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="englishName" id="english-name">
                                        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">角色类型:</label>

                                    <div class="col-sm-2 input-group">
                                        <select class="select2" name="roleType"
                                                data-placeholder="选择角色类型"
                                                style="width: 100%;">
                                            <option value="NORMAL">普通</option>
                                            <option value="DIRECTOR">老师</option>
                                            <option value="STUDENT">学生</option>
                                            <option value="STUDENT">管理员</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">拥有权限:</label>

                                    <div class="col-sm-2 input-group">
                                        <ul id="privilege-tree" class="ztree"></ul>
                                    </div>
                                </div>

                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否激活:</label>

                                    <div class="col-sm-4 input-group">
                                        <label class="col-sm-12" style="padding-top: 7px;">
                                        激活：<input type="radio" name="useable" class="flat-red" value="ACTIVE" checked>
                                        冻结：<input type="radio" name="useable" class="flat-red" value="INACTIVE">
                                        </label>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>

                                    <div class="col-sm-4 input-group">
                                            <button type="button" class="btn  btn-info btn-lg  margin">取消添加</button>
                                            <button type="submit" class="btn  btn-success btn-lg margin">确定添加</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->

        </div>
        <!--/.col (left) -->
    </div>
    <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

    var treeObj;

    $(function () {

        //Initialize Select2 Elements
        $(".select2").select2();

        var $iChecks = $("input[type='radio']");

        $iChecks.iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });


        /**
         * 添加用户表单
         */


        //登录表单验证开始
        var roleAddFormRules = {
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 40,
                    remote: {
                        type: "POST",
                        url: "/role/exist",             //servlet
                        data: {
                            name: function () {
                                return $("#name").val();
                            }
                        }
                    }
                }
            },
            messages: {
                name: {
                    required: "角色名必须填写"
                    , minlength: "角色名长度必须大于{0}"
                    , maxlength: "角色名长度不能大于{0}"
                    , remote: "角色名已经存在"
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
                        $("input").val("");
                        return;
                    }

                    $tipper.messager().error(jsonData.message);

                }

                var zTreeCheckedNodes = ZTreeUtil.transferJSNodeToJAVANode(treeObj);
                var datas = JSON.stringify({zTreeNodes:zTreeCheckedNodes});
                $.ajax({
                    url: requestPath,
                    type: method,
                    dataType :'json',
                    contentType: "application/json; charset=utf-8",
                    data: datas,
                    success: callBack,
                    error: callBack
                });

            }
        }

        $.extend(roleAddFormRules, GlobalVariable.formBaseRules);

        var $roleAddForm = $("#role-add-form");

        if ($roleAddForm.length > 0) {
            $roleAddForm.validate(roleAddFormRules);
        }


    });


    //权限选择列表

    $(function(){
        var url = $path + "/menu/list";

        var setting = {
            async: {
                enable: true,
                url:url,
                type: "post",
                autoParam:["id"],
                otherParam:{"chk":"chk"},
                dataFilter: dataFilter
            },
            check: {
                enable: true,
                autoCheckTrigger: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck,
                onAsyncSuccess: onAsyncSuccess,
                beforeRemove: zTreeBeforeRemove,
                onRemove: zTreeOnRemove,
                onRename:zTreeOnRename
            }
        };
        function dataFilter(treeId, parentNode, childNodes) {
            if (parentNode.checkedEx === true) {
                for(var i=0, l=childNodes.length; i<l; i++) {
                    childNodes[i].checked = parentNode.checked;
                    childNodes[i].halfCheck = false;
                    childNodes[i].checkedEx = true;
                }
            }
            return childNodes;
        }
        function onCheck(event, treeId, treeNode) {
            cancelHalf(treeNode)
            treeNode.checkedEx = true;
        }
        function onAsyncSuccess(event, treeId, treeNode, msg) {
            cancelHalf(treeNode);
        }
        function cancelHalf(treeNode) {
            if (treeNode.checkedEx) return;
            var zTree = $.fn.zTree.getZTreeObj("privilege-tree");
            treeNode.halfCheck = false;
            zTree.updateNode(treeNode);
        }

        function zTreeBeforeRemove() {

        }
        function zTreeOnRemove(event, treeId, treeNode) {

        }
        function zTreeOnRename(event, treeId, treeNode, isCancel) {

        };

        var zNodes = [@macro.ztreeParent/];

        treeObj = $.fn.zTree.init($("#privilege-tree"), setting, zNodes);
        treeObj.expandAll(true);

    });



</script>