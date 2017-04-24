<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        评议书
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">评议书</a></li>
        <li class="active">评议书填写</li>
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
                    <h3 class="box-title" style="    text-align: center;width: 100%;">毕业论文评议书</h3>

                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="form" method="post" action="/gd/examinationcommentbook/edit">
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
                                <td>论文（设计）水平<br>
                                    （30分）
                                </td>
                                <td colspan="4">
                                    论文（设计）内容正确，撰写规范、有一定的创新性和应用价值。
                                </td>
                                <td><input type="text" class="form-control spinner" name="designLevelScore"
                                           value="${examinationCommentBook.designLevelScore!0}"></td>
                            </tr>
                            <tr>
                                <td>论文（设计）报告
                                    <br>
                                    （25）
                                </td>
                                <td colspan="4">
                                    论文（设计）介绍思路清晰，表达简明扼要，重点突出，能全面准确介绍论文（设计）内容，报告时间符合要求。
                                </td>
                                <td><input type="text" class="form-control spinner" name="designReportScore"
                                           value="${examinationCommentBook.designReportScore!0}"></td>
                            </tr>
                            <tr>
                                <td>论文（设计）答辩<br>（45分）</td>
                                <td colspan="4">
                                    回答问题正确，有理论依据，基本概念清楚，逻辑
                                    性较强。
                                </td>
                                <td><input type="text" class="form-control spinner" name="designExaminationScore"
                                           value="${examinationCommentBook.designExaminationScore!0}"></td>
                            </tr>
                            <tr>
                                <td colspan="5">总分(100分)</td>
                                <td>${examinationCommentBook.totalScore!}分</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    答辩委员会（小组）评语:<br>
                                    <p style="text-indent:2em;">本毕业设计选题具有一定的现实意义和实用价值。毕业设计的主要工作如下：</p>
                                   <p style="text-indent:2em;">
                                       毕业设计工作由本人独立完成，应用系统<input name="comment1" value="${comment1!}" class="input-small">，运行<input name="comment2" value="${comment2!}" class="input-small">，论证<input name="comment3" value="${comment3!}" class="input-small">。毕业设计内容与专业要求相吻合。论文论述有条理，层次清楚、文字通畅，写作格式<input name="comment4" value="${comment4!}" class="input-small">。
                                   </p>
                                    <p style="text-indent:2em;">
                                        本工作表明该同学在本学科领域已具有<input name="comment5" value="${comment5!}" class="input-small">的理论基础和系统的专业知识，<input name="comment6" value="${comment6!}" class="input-small">从事软件工程开发的能力。答辩中叙述<input name="comment7" value="${comment7!}" class="input-small">，回答问题<input name="comment8" value="${comment8!}" class="input-small">。经答辩委员会投票表决，一致同意通过工学本科学位论文答辩。
                                    </p>
                                </td>
                            </tr>

                            <tr>
                                <td rowspan="2" colspan="1">
                                    论文(设计)综合成绩
                                </td>
                                <td>指导教师成绩-30%</td>
                                <td>答辩指导小组成绩-70%</td>
                                <td>综合成绩</td>
                                <td>五级分制成绩
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control spinner" name="directorTotalScore"
                                           value="${examinationCommentBook.directorTotalScore!0}"></td>
                                <td><input type="text" class="form-control spinner" name="examinationTotalScore"
                                           value="${examinationCommentBook.examinationTotalScore!0}"></td>
                                <td><input type="text" class="form-control spinner" name="comprehensivePerformanceScore"
                                           value="${examinationCommentBook.comprehensivePerformanceScore!0}"></td>
                                <td><input type="text" class="form-control spinner" name="fiveLevelScore"
                                           value="${examinationCommentBook.fiveLevelScore!0}">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success btn-lg">保存</button>
                                    <button type="button" class="btn  btn-info btn-lg "
                                            onclick="CommonUtil.loadView('/gd/subjectstudents/list');">取消
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

        $("input[name='designLevelScore']").spinner({value:${examinationCommentBook.designLevelScore!0}, min: 0, max: 30});
        $("input[name='designReportScore']").spinner({
            value:${examinationCommentBook.designReportScore!0},
            min: 0,
            max: 25
        });
        $("input[name='designExaminationScore']").spinner({
            value:${examinationCommentBook.designExaminationScore!0},
            min: 0,
            max: 45
        });

        $("input[name='directorTotalScore']").spinner({
            value:${examinationCommentBook.directorTotalScore!0}, min: 0, max: 30});
        $("input[name='examinationTotalScore']").spinner({
            value:${examinationCommentBook.examinationTotalScore!0},
            min: 0,
            max: 70
        });
        $("input[name='comprehensivePerformanceScore']").spinner({
            value:${examinationCommentBook.fiveLevelScore!0},
            min: 0,
            max: 100
        });
        $("input[name='fiveLevelScore']").spinner({
            value:${examinationCommentBook.fiveLevelScore!0},
            min: 0,
            max: 100
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