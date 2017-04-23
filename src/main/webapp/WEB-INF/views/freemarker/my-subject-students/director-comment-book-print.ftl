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

[#if mySubjectStudent.student??]
[#assign studentName = "${mySubjectStudent.student.loginName!}"/]
[#assign studentNo = "${mySubjectStudent.student.no!}"/]
[#assign studentId = "${mySubjectStudent.student.id!}"/]
[/#if]

[#if mySubjectStudent.director??]
[#assign directorName = "${mySubjectStudent.director.loginName!}"/]
[#assign directorProfessionalName = "${mySubjectStudent.director.name!}"/]
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
                                <td colspan="2">专业： ${majorName!}</td>
                                <td colspan="2">班级：${claszName!}</td>
                            </tr>
                            <tr>
                                <td colspan="3">指导教师姓名： ${directorName!}</td>
                                <td colspan="3">
                                    职称：${directorProfessionalName!}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">评价内容</td>
                                <td colspan="2">
                                    具体要求
                                </td>
                                <td colspan="2">得分</td>
                            </tr>
                            <tr>
                                <td colspan="2">方案论证<br>(15分)</td>
                                <td colspan="2">
                                    能独立查阅文献和课题调研，能提出<br>较科学、合理、可行的实施方案。
                                </td>
                                <td colspan="2">${directorCommentBook.planProofScore!0}</td>
                            </tr>
                            <tr>
                                <td colspan="2">论文(设计)内容<br>(30分)</td>
                                <td colspan="2">
                                    坚持实事求是科学态度，没有造假和抄袭行为。观点、结论正确、论证充分、设计合理。内容与专业要求相吻合，理论与实际联系紧密。
                                </td>
                                <td colspan="2">${directorCommentBook.thesisDesignScore!0}</td>
                            </tr>
                            <tr>
                                <td colspan="2">工作量和难度<br>(20分)</td>
                                <td colspan="2">
                                    遵守毕业论文（设计）管理制度，按期完成任务书规定的内容，工作量饱满，有一定难度。
                                </td>
                                <td colspan="2">${directorCommentBook.workloadDifficultyScore!0}</td>
                            </tr>
                            <tr>
                                <td colspan="2">论文(设计)质量<br>(20分)</td>
                                <td colspan="2">
                                    结构合理、条理清楚、文理通顺、用语符合专业要求；文体格式规范、图表清楚。图样绘制与技术要求符合国家标准，图面质量符合要求。
                                </td>
                                <td colspan="2">${directorCommentBook.thesisQualityScore!0}</td>
                            </tr>
                            <tr>
                                <td colspan="2">创新性与应用价值<br>(20分)</td>
                                <td colspan="2">
                                    具有一定的创新性和应用价值
                                </td>
                                <td colspan="2">${directorCommentBook.innovatingWorthScore!0}</td>
                            </tr>
                            <tr>
                                <td colspan="4">总分(100分)</td>
                                <td colspan="2">${directorCommentBook.totalScore!0}分</td>
                            </tr>

                            <tr>
                                <td colspan="6">
                                    指导教师评语：<br>
                                ${directorCommentBook.directorComment?replace("\r\n","<br>")?replace("\n","<br>")?replace("\r","<br>")!}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                                <td colspan="2">
                                    指导教师（签名）：______________________
                                </td>
                                <td colspan="2">
                                ${.now?string("YYYY年MM月dd日")}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button"
                            onclick="printJS({ printable: 'form', type: 'html', header: '     新疆大学 - 毕业论文（设计）中期检查表' })"
                            class="btn btn-success btn-lg">打印
                    </button>
                    <button type="button" class="btn  btn-info btn-lg "
                            onclick="CommonUtil.loadView('/gd/mystudents/list');">取消
                    </button>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section><!-- /.content -->
