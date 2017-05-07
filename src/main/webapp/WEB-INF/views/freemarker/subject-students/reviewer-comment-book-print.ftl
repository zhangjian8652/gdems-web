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
                    <form id="form" method="post" action="/gd/reviewercommentbook/edit">
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
                                <td>规范程度<br>
                                    （25分）
                                </td>
                                <td colspan="4">
                                    结构合理、条理清楚、文理通顺、用语符合专业要求，文体格式规范，图表清楚。图样绘制与技术要求符合国家标准，图面质量符合要求，资料齐全。
                                </td>
                                <td>${reviewerCommentBook.standardizeDegreeScore!0} 分</td>
                            </tr>
                            <tr>
                                <td>论文(设计)内容与质量
                                    <br>
                                    （60分）
                                </td>
                                <td colspan="4">
                                    观点、结论正确，论证充分，设计合理。内容与专业要求相吻合，理论与实际联系紧密；查阅文献有一定广泛性；有综合归纳资料的能力，有自己的见解；
                                </td>
                                <td>${reviewerCommentBook.contentQualityScore!0} 分</td>
                            </tr>
                            <tr>
                                <td>创新性与应用价值<br>（15分）</td>
                                <td colspan="4">
                                    具有一定的创新性和应用价值。
                                </td>
                                <td>${reviewerCommentBook.innovatingWorthScore!0}分</td>
                            </tr>
                            <tr>
                                <td colspan="5">总分(100分)</td>
                                <td>${reviewerCommentBook.totalScore!}分</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    评阅教师评语：<br>
                                    [#if reviewerCommentBook.reviewerComment]
                                        ${reviewerCommentBook.reviewerComment?replace("\r\n","<br>")?replace("\n","<br>")?replace("\r","<br>")!}
                                    [/#if]
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                                <td colspan="2">
                                    评阅教师(签名)：______________
                                </td>
                                <td colspan="2">
                                    ${.now?string("YYYY年MM月dd日")!}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" onclick="printJS({ printable: 'form', type: 'html', header: '     新疆大学 - 毕业论文（设计）评阅老师评议书' })" class="btn btn-success btn-lg">打印</button>
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