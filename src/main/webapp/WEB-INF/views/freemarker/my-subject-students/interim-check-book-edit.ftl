<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        中期检查表
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">中期检查表</a></li>
        <li class="active">中期检查表填写</li>
    </ol>
</section>

[#if subjectStudent.student??]
[#assign studentName = "${subjectStudent.student.loginName!}"/]
[#assign studentNo = "${subjectStudent.student.no!}"/]
[#assign studentId = "${subjectStudent.student.id!}"/]
[/#if]

[#if subjectStudent.director??]
[#assign directorName = "${subjectStudent.director.loginName!}"/]
[/#if]


[#if subjectStudent.department??]
[#assign departmentName = "${subjectStudent.department.name!}"/]
[/#if]

[#if subjectStudent.major??]
[#assign majorName = "${subjectStudent.major.name!}"/]
[/#if]

[#if subjectStudent.clasz??]
[#assign claszName = "${subjectStudent.clasz.name!}"/]
[/#if]

[#if subjectStudent.subject??]
[#assign tittle = "${subjectStudent.subject.tittle!}"/]
[/#if]


<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-8">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title" style="    text-align: center;width: 100%;">毕业论文中期检查表</h3>
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="form" method="post" action="/gd/interimcheckbook/edit">
                        <input type="hidden" name="studentId" value="${studentId!}"/>
                    <table class="table table-bordered table-hover word-table">
                       <tbody>
                            <tr>
                                <td>学生姓名：</td>
                                <td>
                                    <input type="text" class="form-control" value="${studentName!}" name="className" readonly>
                                </td>
                                <td>学院：</td>
                                <td>
                                    <input type="text" class="form-control" value="${departmentName!}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>班级：</td>
                                <td>
                                    <input type="text" class="form-control" value="${claszName!}" name="className" readonly>
                                </td>
                                <td>指导老师：</td>
                                <td>
                                    <input type="text" class="form-control" value="${directorName!}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>论文设计题目：</td>
                                <td colspan="3">
                                    <input type="text" name="thesisTittle" class="form-control input-lg" value="${tittle!}">
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">已完成的内容：</td>
                                <td colspan="3">
                                    <textarea name="finish" style="width: 100%;resize: none" rows="6" class="form-control" >${interimCheckBook.finish!}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>是否符合任务书要求进度:</td>
                                <td colspan="2">
                                    <input type="text" name="conformance"  class="form-control" placeholder="“符合”或“不符合”"  value="${interimCheckBook.conformance!}">
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">尚需完成的任务：</td>
                                <td colspan="3">
                                    <textarea name="requireFinish" style="width: 100%;resize: none" rows="6" class="form-control" >${interimCheckBook.requireFinish!}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>能否按期完成任务:</td>
                                <td colspan="2">
                                    <input type="text" name="finishInTime" class="form-control" placeholder="“能”或“不能”" value="${interimCheckBook.finishInTime!}">
                                </td>
                            </tr>

                            <tr>
                                <td>存在的问题和解决办法：</td>
                                <td colspan="3">
                                    <textarea name="problemsSolutions" style="width: 100%;resize: none" rows="6" class="form-control" >${interimCheckBook.problemsSolutions!}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td ><button type="submit" class="btn btn-success btn-lg">保存</button></td>
                                <td >
                                    <button type="button" class="btn  btn-info btn-lg "
                                            onclick="CommonUtil.loadView('/gd/mystudents/list');">取消
                                    </button>
                                </td>
                            </tr>
                       </tbody>
                    </table>
                    </form>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

    $(function () {
        $(".date input").datepicker({autoclose: true,language: 'zh-CN'});

        //登录表单验证开始
        var rules = {
            rules: {},
            submitHandler: function (form) {   //表单提交句柄,为一回调函数,带一个参数：form

                var $form, requestPath, method, requestData, callBack;

                $form = $(form);
                requestPath = $path + $form.attr("action");
                method = $form.attr("method");
                requestData = $form.serialize();

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
                    data: requestData,
                    success: callBack});

            }
        }

        $.extend(rules, GlobalVariable.formBaseRules);

        var $userAddForm = $("#form");

        if ($userAddForm.length > 0) {
            $userAddForm.validate(rules);
        }

    });




</script>