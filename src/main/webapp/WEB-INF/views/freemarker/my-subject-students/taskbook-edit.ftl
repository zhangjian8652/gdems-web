<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        任务书
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">任务书</a></li>
        <li class="active">任务书填写</li>
    </ol>
</section>

[#if mySubjectStudent.student??]
[#assign studentName = "${mySubjectStudent.student.loginName!}"/]
[#assign studentNo = "${mySubjectStudent.student.no!}"/]
[#assign studentId = "${mySubjectStudent.student.id!}"/]
[/#if]

[#if mySubjectStudent.department??]
[#assign departmentName = "${mySubjectStudent.department.name!}"/]
[/#if]

[#if mySubjectStudent.major??]
[#assign majorName = "${mySubjectStudent.major.name!}"/]
[/#if]

[#if mySubjectStudent.clasz??]
[#assign claszName = "${mySubjectStudent.clasz.name!}"/]
[/#if]

[#if mySubjectStudent.subject??]
[#assign tittle = "${mySubjectStudent.subject.tittle!}"/]
[/#if]


<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-8">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title" style="    text-align: center;width: 100%;">毕业论文（设计）任务书</h3>
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="form" method="post" action="/gd/taskbook/edit">
                        <input type="hidden" name="studentId" value="${studentId!}"/>
                    <table class="table table-bordered table-hover word-table">
                       <tbody>
                            <tr>
                                <td>班        级：</td>
                                <td>
                                    <input type="text" class="form-control" value="${claszName!}" name="className" readonly>
                                </td>
                                <td>姓        名：</td>
                                <td>
                                    <input type="text" class="form-control" value="${studentName!}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>论文设计题目：</td>
                                <td colspan="3">
                                    <input type="text" name="thesisTittle" class="form-control input-lg" value="${tittle!}">
                                </td>
                            </tr>
                            <tr>
                                <td>专        题：</td>
                                <td colspan="3">
                                    <input type="text" name="professionalSubject" class="form-control input-lg" value="${taskbood.professionalSubject!}">
                                </td>
                            </tr>
                            <tr>
                                <td>要求完成的内容：</td>
                                <td colspan="3">
                                    <textarea name="requirementContent" style="width: 100%;resize: none" rows="6" class="form-control" >${taskbood.requirementContent!}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>发题日期：</td>
                                <td class="date">
                                    [#if taskbood.sendDate??]
                                    <input type="text" class="form-control  pull-right" name="sendDate" placeholder="yyyy-mm-dd" value="${taskbood.sendDate?date!}"
                                           id="sendDate" readonly data-date-format="yyyy-mm-dd">
                                    [#else]
                                    <input type="text" class="form-control  pull-right" name="sendDate" placeholder="yyyy-mm-dd" value=""
                                           id="sendDate" readonly data-date-format="yyyy-mm-dd">
                                    [/#if]
                                </td>
                                <td>完成日期：</td>
                                <td class="date">
                                    [#if taskbood.finishDate??]
                                    <input type="text" class="form-control  pull-right" name="finishDate" placeholder="yyyy-mm-dd" value="${taskbood.finishDate?date!}"
                                           id="finishDate" readonly data-date-format="yyyy-mm-dd">
                                    [#else]
                                    <input type="text" class="form-control  pull-right" name="finishDate" placeholder="yyyy-mm-dd" value=""
                                           id="finishDate" readonly data-date-format="yyyy-mm-dd">
                                    [/#if]
                                </td>
                            </tr>
                            <tr>
                                <td>实习实训单位：</td>
                                <td><input type="text" name="practiceUnits" class="form-control" value="${taskbood.practiceUnits!}"></td>
                                <td>地点：</td>
                                <td><input type="text" name="practiceAddress" class="form-control" value="${taskbood.practiceAddress!}"></td>
                            </tr>
                            <tr>
                                <td>论文页数：</td>
                                <td>
                                    <input type="text" class="form-control spinner" name="thesisPageCount" id="thesisPageCount">
                                </td>
                                <td>图纸张数：</td>
                                <td>
                                    <input type="text" class="form-control spinner" name="drawingPageCount" id="drawingPageCount">
                                </td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>指导教师：</td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>教研主任：</td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>院    长：</td>
                                <td colspan="2"></td>
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
        $(".spinner[name='thesisPageCount']").spinner({value:${taskbood.thesisPageCount!0},min:0,lenth:3});
        $(".spinner[name='drawingPageCount']").spinner({value:${taskbood.drawingPageCount!0},min:0,lenth:3});




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