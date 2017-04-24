<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        导师评议书
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">导师评议书</a></li>
        <li class="active">导师评议书填写</li>
    </ol>
</section>

[#if subjectStudent.student??]
[#assign studentName = "${subjectStudent.student.loginName!}"/]
[#assign studentNo = "${subjectStudent.student.no!}"/]
[#assign studentId = "${subjectStudent.student.id!}"/]
[/#if]

[#if subjectStudent.director??]
[#assign directorName = "${subjectStudent.director.loginName!}"/]
[#assign directorProfessionalName = "${subjectStudent.director.name!}"/]
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
                    <h3 class="box-title" style="    text-align: center;width: 100%;">毕业论文导师评议书</h3>

                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="form" method="post" action="/gd/directorcommentbook/edit">
                        <input type="hidden" name="studentId" value="${studentId!}"/>
                        <table class="table table-bordered table-hover word-table">
                            <tbody>
                            <tr>
                                <td>论文（设计）题目：</td>
                                <td colspan="5"><input type="text" class="form-control" value="${tittle!}"
                                                       name="className" readonly></td>
                            </tr>

                            <tr>
                                <td>学生姓名：</td>
                                <td>
                                    <input type="text" class="form-control" value="${studentName!}" name="className"
                                           readonly>
                                </td>
                                <td>专业：</td>
                                <td>
                                    <input type="text" class="form-control" value="${majorName!}" readonly>
                                </td>
                                <td>班级：</td>
                                <td>
                                    <input type="text" class="form-control" value="${claszName!}" name="className"
                                           readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>指导教师姓名：</td>
                                <td>
                                    <input type="text" class="form-control" value="${directorName!}" name="className"
                                           readonly>
                                </td>
                                <td>职称：</td>
                                <td colspan="3">
                                    <input type="text" class="form-control" value="${directorProfessionalName!}"
                                           readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>评价内容</td>
                                <td colspan="4">
                                    具体要求
                                </td>
                                <td>得分</td>
                            </tr>
                            <tr>
                                <td>方案论证<br>(15分)</td>
                                <td colspan="4">
                                    能独立查阅文献和课题调研，能提出<br>较科学、合理、可行的实施方案。
                                </td>
                                <td><input type="text" class="form-control spinner" name="planProofScore"
                                           value="${directorCommentBook.planProofScore!0}"></td>
                            </tr>
                            <tr>
                                <td>论文(设计)内容<br>(30分)</td>
                                <td colspan="4">
                                    坚持实事求是科学态度，没有造假和抄袭行为。观点、结论正确、论证充分、设计合理。内容与专业要求相吻合，理论与实际联系紧密。
                                </td>
                                <td><input type="text" class="form-control spinner" name="thesisDesignScore"
                                           value="${directorCommentBook.thesisDesignScore!0}"></td>
                            </tr>
                            <tr>
                                <td>工作量和难度<br>(20分)</td>
                                <td colspan="4">
                                    遵守毕业论文（设计）管理制度，按期完成任务书规定的内容，工作量饱满，有一定难度。
                                </td>
                                <td><input type="text" class="form-control spinner" name="workloadDifficultyScore"
                                           value="${directorCommentBook.workloadDifficultyScore!0}"></td>
                            </tr>
                            <tr>
                                <td>论文(设计)质量<br>(20分)</td>
                                <td colspan="4">
                                    结构合理、条理清楚、文理通顺、用语符合专业要求；文体格式规范、图表清楚。图样绘制与技术要求符合国家标准，图面质量符合要求。
                                </td>
                                <td><input type="text" class="form-control spinner" name="thesisQualityScore"
                                           value="${directorCommentBook.thesisQualityScore!0}"></td>
                            </tr>
                            <tr>
                                <td>创新性与应用价值<br>(20分)</td>
                                <td colspan="4">
                                    具有一定的创新性和应用价值
                                </td>
                                <td><input type="text" class="form-control spinner" name="innovatingWorthScore"
                                           value="${directorCommentBook.innovatingWorthScore!0}"></td>
                            </tr>
                            <tr>
                                <td colspan="5">总分(100分)</td>
                                <td>${directorCommentBook.totalScore!}分</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    指导教师评语：<br>
                                    <textarea name="directorComment" style="width: 100%;resize: none" class="form-control" rows="6">${directorCommentBook.directorComment!}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success btn-lg">保存</button>
                                    <button type="button" class="btn  btn-info btn-lg "
                                            onclick="CommonUtil.loadView('/gd/mystudents/list');">取消
                                    </button>
                                </td>
                                <td>

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
        $(".date input").datepicker({autoclose: true, language: 'zh-CN'});

        $("input[name='planProofScore']").spinner({value:${directorCommentBook.planProofScore!0}, min: 0, max: 15});
        $("input[name='thesisDesignScore']").spinner({
            value:${directorCommentBook.thesisDesignScore!0},
            min: 0,
            max: 30
        });
        $("input[name='workloadDifficultyScore']").spinner({
            value:${directorCommentBook.workloadDifficultyScore!0},
            min: 0,
            max: 20
        });
        $("input[name='thesisQualityScore']").spinner({
            value:${directorCommentBook.thesisQualityScore!0},
            min: 0,
            max: 20
        });
        $("input[name='innovatingWorthScore']").spinner({
            value:${directorCommentBook.innovatingWorthScore!0},
            min: 0,
            max: 15
        });

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
                    success: callBack
                });

            }
        }

        $.extend(rules, GlobalVariable.formBaseRules);

        var $userAddForm = $("#form");

        if ($userAddForm.length > 0) {
            $userAddForm.validate(rules);
        }

    });


</script>