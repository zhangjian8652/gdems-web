<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户管理
        <small>系统用户</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">用户管理</a></li>
        <li class="active">添加用户</li>
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
                    <h3 class="box-title">添加用户</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <form id="user-detail-form" action="/user/add" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户名:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="loginName" id="loginName">
                                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="email">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">手机号:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="mobile">
                                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码:</label>

                                    <div class="input-group">
                                        <input type="text" class="form-control" name="password">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">编号:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="no" id="no" readonly>
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">职称:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="professionalRank" id="professionalRank" readonly>
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">角色</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2" multiple="multiple" name="roles"
                                                data-placeholder="选择用户角色"
                                                style="width: 100%;">
                                            [@role type="LIST";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as role]
                                            <option>${role.name}</option>
                                            [/#list]
                                            [/#if]
                                            [/@role]
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">院系</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2" multiple="multiple" name="department"
                                                data-placeholder="选择用户角色"
                                                style="width: 100%;">
                                            [@role type="LIST";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as role]
                                            <option>${role.name}</option>
                                            [/#list]
                                            [/#if]
                                            [/@role]
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2" multiple="multiple" name="major"
                                                data-placeholder="选择用户角色"
                                                style="width: 100%;">
                                            [@role type="LIST";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as role]
                                            <option>${role.name}</option>
                                            [/#list]
                                            [/#if]
                                            [/@role]
                                        </select>
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

    $(function () {

        //Initialize Select2 Elements
        $(".select2").select2();

        var $roleCheckboxes = $(".role-checkbox");

        $roleCheckboxes.iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });

        $roleCheckboxes.on('ifChecked', function () {
            $(this).attr("checked", "on");
        });


        /**
         * 添加用户表单
         */


        //登录表单验证开始
        var userAddFormRules = {
            rules: {
                loginName: {
                    required: true,
                    username: true,
                    minlength: 4,
                    maxlength: 20,
                    remote: {
                        type: "POST",
                        url: "/user/exist",             //servlet
                        data: {
                            loginName: function () {
                                return $("#loginName").val();
                            }
                        }
                    }
                },
                email: {
                    required: true,
                    email: true,
                    minlength: 4,
                    maxlength: 20
                },
                mobile:{
                    mobileCN:true
                },
                password: {
                    required: true,
                    minlength: 4,
                    maxlength: 20
                }
            },
            messages: {
                loginName: {
                    required: "用户名必须填写"
                    , username: "用户名必须为字母数字下划线组成"
                    , minlength: "用户名长度必须大于{0}"
                    , maxlength: "用户名长度不能大于{0}"
                    , remote: "用户名已经存在"
                },
                email: {
                    required: "邮箱地址必须填写",
                    email: "邮箱地址格式不正确",
                    minlength: 3,
                    maxlength: 30
                },
                mobile:{
                    mobileCN:"手机号格式不正确"
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
                    remember: remember
                }

                callBack = function (data) {
                    var successCode = "100000", $tipper = $("#tipper");

                    var jsonData = data;

                    if (successCode === jsonData.code) {
                        $tipper.messager.success(jsonData.message);
                        return;
                    }

                    $tipper.messager.error(jsonData.message);

                }

                $.ajax({url: requestPath, type: method, data: requestData, success: callBack, error: callBack});

            }
        }

        $.extend(userAddFormRules, GlobalVariable.formBaseRules);

        var $userAddForm = $("#user-detail-form");

        if ($userAddForm.length > 0) {
            $userAddForm.validate(userAddFormRules);
        }


    });

</script>