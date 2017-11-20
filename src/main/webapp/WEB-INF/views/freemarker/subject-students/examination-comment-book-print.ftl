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
                            <thead>
                            <th width="150px"></th>
                            <th></th>
                            <th></th>
                            <th>
                            </th>
                            <th></th>
                            <th width="150px"></th>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="6">论文（设计）题目：${tittle!}</td>
                            </tr>

                            <tr>
                                <td colspan="2">学生姓名：${studentName!}</td>
                                <td colspan="2">专业：${majorName!}</td>
                                <td colspan="2">班级：${claszName!}</td>
                            </tr>
                            <tr>
                                <td colspan="3">指导教师姓名：${directorName!}</td>
                                <td colspan="3">职称：${directorProfessionalName!}</td>
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
                                <td>${examinationCommentBook.designLevelScore!0}分</td>
                            </tr>
                            <tr>
                                <td>论文（设计）报告
                                    <br>
                                    （25）
                                </td>
                                <td colspan="4">
                                    论文（设计）介绍思路清晰，表达简明扼要，重点突出，能全面准确介绍论文（设计）内容，报告时间符合要求。
                                </td>
                                <td>${examinationCommentBook.designReportScore!0}分</td>
                            </tr>
                            <tr>
                                <td>论文（设计）答辩<br>（45分）</td>
                                <td colspan="4">
                                    回答问题正确，有理论依据，基本概念清楚，逻辑
                                    性较强。
                                </td>
                                <td>${examinationCommentBook.designExaminationScore!0}分</td>
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
                                       毕业设计工作由本人独立完成，应用系统${comment1!}，运行${comment2!}，论证${comment3!}。毕业设计内容与专业要求相吻合。论文论述有条理，层次清楚、文字通畅，写作格式${comment4!}。
                                   </p>
                                    <p style="text-indent:2em;">
                                        本工作表明该同学在本学科领域已具有${comment5!} class="input-small">的理论基础和系统的专业知识，${comment6!}从事软件工程开发的能力。答辩中叙述${comment7!}，回答问题${comment8!}。经答辩委员会投票表决，一致同意通过工学本科学位论文答辩。
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">答辩委员会（小组）组长签名：________________</td>
                                <td></td>
                                <td colspan="2">${.now?string("YYYY年MM月dd日")}</td>
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
                                <td>${examinationCommentBook.directorTotalScore!0}分</td>
                                <td>${examinationCommentBook.examinationTotalScore!0}分</td>
                                <td>${examinationCommentBook.comprehensivePerformanceScore!0}分</td>
                                <td>${examinationCommentBook.fiveLevelScore!0}分
                                </td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="button" onclick="printJS({ printable: 'form', type: 'html', header: '     新疆大学 - 毕业论文（设计）答辩小组评议书' })" class="btn btn-success btn-lg">打印</button>
                    <button type="button" class="btn  btn-info btn-lg "
                            onclick="CommonUtil.loadView('/gd/subjectstudents/list');">取消
                    </button>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section><!-- /.content -->