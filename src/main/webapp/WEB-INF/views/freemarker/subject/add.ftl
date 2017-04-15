<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        选题管理
        <small>系统用户</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">选题管理</a></li>
        <li class="active">添加选题</li>
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
                    <h3 class="box-title">添加选题</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <form id="add-form" action="/gd/subject/add" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标题:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="tittle" id="tittle">
                                        <span class="glyphicon glyphicon-flag form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">开始时间:</label>

                                    <div class="col-sm-4 input-group date">
                                        <input type="text" class="form-control" name="fromDate" id="fromDate" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" readonly>
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">结束时间:</label>

                                    <div class="col-sm-4 input-group date">
                                        <input type="text" class="form-control pull-right" name="endDate" id="endDate" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"
                                               readonly>
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">毕业时间:</label>

                                    <div class="col-sm-4 input-group date">

                                        <input type="text" class="form-control  pull-right" name="graduationDate" placeholder="yyyy-mm-dd"
                                               id="graduationDate" readonly data-date-format="yyyy-mm-dd">
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">来源:</label>

                                    <div class="col-sm-10 input-group radio-group">
                                        <input type="radio" name="sourceFrom" value="教师科研"
                                               id="from-teaccher-researching"><label for="from-teaccher-researching">教师科研</label>
                                        <input type="radio" name="sourceFrom" value="教师自拟" id="from-teacher-self"
                                               checked><label for="from-teacher-self">教师自拟</label>
                                        <input type="radio" name="sourceFrom" value="学生自选"
                                               id="from-student-self"><label for="from-student-self">学生自选</label><br>
                                        <input type="radio" name="sourceFrom" value="生产实践"
                                               id="from-production-practice"><label
                                            for="from-production-practice">生产实践</label>
                                        <input type="radio" name="sourceFrom" value="实验室（课程建设）" id="from-laboratory"><label
                                            for="from-laboratory">实验室（课程建设）</label>
                                        <input type="radio" name="sourceFrom" value="其他" id="from-other"><label
                                            for="from-other">其他</label>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">类型:</label>

                                    <div class="col-sm-10 input-group radio-group">
                                        <input type="radio" name="type" value="应用研究"
                                               id="type-applied-researching"><label
                                            for="type-applied-researching">应用研究</label>
                                        <input type="radio" name="type" value="理论研究"
                                               id="type-theoretical-researching" checked><label
                                            for="type-theoretical-researching">理论研究</label>
                                        <input type="radio" name="type" value="工程设计"
                                               id="type-engineering-design"><label
                                            for="type-engineering-design">工程设计</label><br>
                                        <input type="radio" name="type" value="计算机软件"
                                               id="type-computer-software" checked><label
                                            for="type-computer-software">计算机软件</label>
                                        <input type="radio" name="type" value="社会调查"
                                               id="type-social-survey"><label for="type-social-survey">社会调查</label>
                                        <input type="radio" name="type" value="社会难点热点" id="type-social-hot"><label
                                            for="type-social-hot">社会难点热点</label>
                                        <input type="radio" name="type" value="其他" id="type-other"><label
                                            for="from-other">其他</label>
                                    </div>
                                    <!-- /.input group -->
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">要求:</label>

                                    <div class="col-sm-8 input-group">
                                        <textarea class="form-control" rows="3" placeholder="输入 ..."
                                                  name="requirement"></textarea>
                                    </div>
                                    <!-- /.input group -->
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">主要任务:</label>

                                    <div class="col-sm-8 input-group">
                                        <textarea class="form-control" rows="5" placeholder="输入 ..."
                                                  name="mainTask"></textarea>
                                    </div>
                                </div>
                                <!-- /.form-group -->


                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>

                                    <div class="col-sm-4 input-group">
                                        <button type="button" class="btn  btn-info btn-lg  margin"
                                                onclick="CommonUtil.loadView('/gd/subject/list')">取消
                                        </button>
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

        var $fromRadio = $("input[name='sourceFrom']");
        var $typeRadio = $("input[name='type']");

        $fromRadio.iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green',
            increaseArea: '20%'
        });
        $typeRadio.iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green',
            increaseArea: '20%'
        });


        $(".date input").datepicker({autoclose: true,language: 'zh-CN'});

        /**
         * 添加用户表单
         */


        //选题表单开始
        var rules = {
            rules: {
                tittle: {
                    required: true,
                    remote: {
                        type: "GET",
                        url: "/gd/subject/exist",             //servlet
                        data: {
                            name: function () {
                                return $("#tittle").val();
                            }
                        }
                    }
                },
                fromDate: {
                    required: true
                },
                endDate: {
                    required: true
                },
                graduationDate: {
                    required: true
                }
            },
            messages: {
                tittle: {
                    required: "选题标题必须填写"
                    , remote: "选题标题已经存在"
                },
                fromDate: {
                    required: "开始时间须填写"
                },
                endDate: {
                    required: "结束时间必须填写"
                },
                graduationDate: {
                    required: "毕业时间必须填写"
                }
            },
            submitHandler: function (form) {   //表单提交句柄,为一回调函数,带一个参数：form

                var $form, requestPath, method, callBack;

                $form = $(form);
                requestPath = $path + $form.attr("action");
                method = $form.attr("method");

                var data = {
                    tittle: $("input[name='tittle']").val(),
                    fromDate: $("input[name='fromDate']").val(),
                    endDate: $("input[name='endDate']").val(),
                    graduationDate: $("input[name='graduationDate']").val(),
                    requirement: $("input[name='requirement']").val(),
                    mainTask: $("input[name='mainTask']").val(),
                    sourceFrom: $fromRadio.val(),
                    type: $typeRadio.val(),
                }

                callBack = function (data) {
                    $tipper = $("#tipper");
                    if (data.code.startsWith(successCodePrefix)) {
                        $tipper.messager().success(data.message);
                        $("input,textarea").val("");
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
        }

        $.extend(rules, GlobalVariable.formBaseRules);

        var $form = $("#add-form");

        if ($form.length > 0) {
            $form.validate(rules);
        }


    });

</script>