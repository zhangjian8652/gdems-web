<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        选题配置
        <small>系统用户</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">选题管理</a></li>
        <li class="active">选题配置</li>
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
                    <h3 class="box-title">选题配置</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <form id="form" action="/gd/subject/config/edit" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">导师可带学生数:</label>

                                    <div class="col-sm-3 input-group">
                                        <input type="text" value="${subjectConfig.studentNum!'0'}" class="form-control spinner" name="studentNum" id="studentNum">
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>

                                    <div class="col-sm-4 input-group">
                                        <button type="submit" class="btn  btn-success btn-lg margin">确定</button>
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

        $(".spinner").spinner();


        /**
         * 添加用户表单
         */


        //选题表单开始
        var rules = {
            rules: {
                studentNum: {
                    required: true,
                    isIntGteZero: true,
                }
            },
            messages: {
                studentNum: {
                    required: "学生数量必须填写",
                    isIntGteZero: "学生数量必须大于0"
                }
            },
            submitHandler: function (form) {   //表单提交句柄,为一回调函数,带一个参数：form

                var $form, requestPath, method, callBack;

                $form = $(form);
                requestPath = $path + $form.attr("action");
                method = $form.attr("method");

                var data = {
                    studentNum: $("input[name='studentNum']").val()
                }

                callBack = function (data) {
                    $tipper = $("#tipper");
                    if (data.code.startsWith(successCodePrefix)) {
                        $tipper.messager().success(data.message);
                        return;
                    }
                    $tipper.messager().error(data.message);
                }

                $.ajax({
                    url: requestPath,
                    type: method,
                    data: data,
                    success: callBack
                });

            }
        };

        $.extend(rules, GlobalVariable.formBaseRules);

        var $form = $("#form");

        if ($form.length > 0) {
            $form.validate(rules);
        }


    });

</script>