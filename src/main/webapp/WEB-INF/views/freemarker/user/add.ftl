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
                            <form id="user-add-form" action="/user/add" method="post" class="form-horizontal">
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
                                        <input type="text" class="form-control" name="email" id="email">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">手机号:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="mobile" id="mobile">
                                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="password" class="form-control" name="password" id="password">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">编号:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="no" id="no">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">职称:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="professionalRank" id="professionalRank">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">角色</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2" name="roles" id="role"
                                                data-placeholder="选择用户角色"
                                                style="width: 50%;">
                                            [@role type="LIST";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as role]
                                            <option value="${role.id}">${role.name}</option>
                                            [/#list]
                                            [/#if]
                                            [/@role]
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">院系</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2"  name="department" id="department"
                                                data-placeholder="选择学院"
                                                style="width: 50%;">
                                            [@organization typeType="department" type="list";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as organization]
                                            <option value="${organization.id}">${organization.name}</option>
                                            [/#list]
                                            [/#if]
                                            [/@organization]
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2" name="major" id="major"
                                                data-placeholder="选择专业"
                                                style="width: 50%;">

                                        </select>
                                    </div>
                                </div>

                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-4 input-group">
                                        <button type="button" class="btn  btn-info btn-lg  margin" onclick="CommonUtil.loadView('/user/list')">取消添加</button>
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
        var $role = $("#role").select2();
        var $department = $("#department").select2();
        var $major= $("#major").select2();

        var $roleCheckboxes = $(".role-checkbox");

        $roleCheckboxes.iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });

        $roleCheckboxes.on('ifChecked', function () {
            $(this).attr("checked", "on");
        });

        $('#department').on("select2:select",function(){
            var url = $path + "/organization/options?parentId=" + $department.val();
            $.get(url,function(data){
                $("#major").html(data);
                $major = $("#major").select2();
            });
        });

        /**
         * 添加用户表单
         */


        //登录表单验证开始
        var rules = {
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
            submitHandler: function (form) {   //表单提交句柄,为一回调函数,带一个参数：form

                var $form, requestPath, method, requestData, callBack;

                $form = $(form);
                requestPath = $path + $form.attr("action");
                method = $form.attr("method");
                var loginName = $("#loginName").val();
                var email = $("#email").val();
                var mobile = $("#mobile").val();
                var password = $("#password").val();
                var no = $("#no").val();
                var professionalRank = $("#professionalRank").val();
                var role = $role.val();
                var department = $department.val();
                var major = $major.val();

                requestData = JSON.stringify({
                    loginName : loginName,
                    email :email,
                    mobile :mobile,
                    password :password,
                    no :no,
                    professionalRank :professionalRank,
                    departmentId : department,
                    majorId :major,
                 });

                requestPath += "?roleId=" + role;

                callBack = function (data) {
                    $tipper = $("#tipper");
                    if (data.code.startsWith(successCodePrefix)) {
                        $tipper.messager().success(data.message);
                        $("input").val("");
                        return;
                    }
                    $tipper.messager().error(data.message);
                }

                $.ajax({
                    url: requestPath,
                    type: method,
                    dataType :'json',
                    contentType: "application/json; charset=utf-8",
                    data: requestData,
                    success: callBack});

            }
        }

        $.extend(rules, GlobalVariable.formBaseRules);

        var $userAddForm = $("#user-add-form");

        if ($userAddForm.length > 0) {
            $userAddForm.validate(rules);
        }


    });

</script>