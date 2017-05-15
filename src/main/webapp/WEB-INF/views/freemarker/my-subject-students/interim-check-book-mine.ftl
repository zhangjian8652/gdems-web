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
                    <table class="table table-bordered table-hover word-table">
                       <tbody>
                            <tr>
                                <td>学生姓名：</td>
                                <td>
                                     ${studentName!}
                                </td>
                                <td>学院：</td>
                                <td>
                                      ${departmentName!}
                                </td>
                            </tr>
                            <tr>
                                <td>班级：</td>
                                <td>
                                  ${claszName!}
                                </td>
                                <td>指导老师：</td>
                                <td>
                                     ${directorName!}
                                </td>
                            </tr>
                            <tr>
                                <td>论文设计题目：</td>
                                <td colspan="3">
                                 ${tittle!}
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">已完成的内容：</td>
                                <td colspan="3">
                                    [#if interimCheckBook.finish??]
                                        ${interimCheckBook.finish?replace("\r\n","<br>")?replace("\n","<br>")?replace("\r","<br>")!}
                                    [/#if]
                                </td>
                            </tr>
                            <tr>
                                <td>是否符合任务书要求进度:</td>
                                <td colspan="2">
                                ${interimCheckBook.conformance!}
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">尚需完成的任务：</td>
                                <td colspan="3">
                                    [#if interimCheckBook.requireFinish??]
                                        ${interimCheckBook.requireFinish?replace("\r\n","<br>")?replace("\n","<br>")?replace("\r","<br>")!}
                                    [/#if]
                                </td>
                            </tr>
                            <tr>
                                <td>能否按期完成任务:</td>
                                <td colspan="2">
                                    ${interimCheckBook.finishInTime!}
                                </td>
                            </tr>

                            <tr>
                                <td>存在的问题和解决办法：</td>
                                <td colspan="3">
                                    [#if interimCheckBook.problemsSolutions??]
                                        ${interimCheckBook.problemsSolutions?replace("\r\n","<br>")?replace("\n","<br>")?replace("\r","<br>")!}
                                    [/#if]
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2">
                                    填表人：____________________
                                </td>
                                <td >
                                    填表日期：${.now?string("YYYY年MM月dd日")!}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">教研室主任签字：____________________</td>
                            </tr>                            <tr>
                            <td colspan="4">教学副院长（主任）签字：______________________</td>
                            </tr>
                       </tbody>
                    </table>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" onclick="printJS({ printable: 'form', type: 'html', header: '     新疆大学 - 毕业论文（设计）中期检查表' })" class="btn btn-success btn-lg">打印</button>
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

