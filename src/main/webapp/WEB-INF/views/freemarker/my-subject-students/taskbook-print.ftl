<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        任务书
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">任务书</a></li>
        <li class="active">任务书打印</li>
    </ol>
</section>
[#if subjectStudent.student??]
[#assign studentName = "${subjectStudent.student.loginName!}"/]
[#assign studentNo = "${subjectStudent.student.no!}"/]
[#assign studentId = "${subjectStudent.student.id!}"/]
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
                    <h3 class="box-title" style="    text-align: center;width: 100%;">毕业论文（设计）任务书</h3>
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="form" method="post" action="/gd/taskbook/edit">
                        <table class="table table-bordered table-hover word-table">
                            <tbody>
                            <tr>
                                <td>班        级：</td>
                                <td>
                                 ${claszName!}
                                </td>
                                <td>姓        名：</td>
                                <td>
                                ${studentName!}
                                </td>
                            </tr>
                            <tr>
                                <td>论文设计题目：</td>
                                <td colspan="3">
                                    ${tittle!}
                                </td>
                            </tr>
                            <tr>
                                <td>专        题：</td>
                                <td colspan="3">
                                ${taskbood.professionalSubject!}
                                </td>
                            </tr>
                            <tr>
                                <td>要求完成的内容：</td>
                                <td colspan="3">
                                ${taskbood.requirementContent?replace("\r\n","<br>")?replace("\n","<br>")?replace("\r","<br>")!}
                                </td>
                            </tr>
                            <tr>
                                <td>发题日期：</td>
                                <td class="date">
                                    [#if taskbood.sendDate??]
                                         ${taskbood.sendDate?date!}
                                    [#else]

                                    [/#if]
                                </td>
                                <td>完成日期：</td>
                                <td class="date">
                                    [#if taskbood.finishDate??]
                                         ${taskbood.finishDate?date!}
                                    [#else]
                                    [/#if]
                                </td>
                            </tr>
                            <tr>
                                <td>实习实训单位：</td>
                                <td>${taskbood.practiceUnits!}</td>
                                <td>地点：</td>
                                <td>${taskbood.practiceAddress!}</td>
                            </tr>
                            <tr>
                                <td>论文页数：</td>
                                <td>${taskbood.thesisPageCount!}</td>
                                <td>图纸张数：</td>
                                <td>${taskbood.drawingPageCount!}</td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td colspan="2">指导教师：</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td colspan="2">教研主任：</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td colspan="2">院    长：</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td ></td>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td ></td>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" onclick="printJS({ printable: 'form', type: 'html', header: '     新疆大学 - 毕业论文（设计）任务书' })" class="btn btn-success btn-lg">打印</button>
                    <button type="button" class="btn  btn-info btn-lg "
                            onclick="CommonUtil.loadView('/gd/mystudents/list');">取消
                    </button>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

    $(function () {
        $(".date input").datepicker({autoclose: true,language: 'zh-CN'});
        $(".spinner").spinner({min:0,lenth:3});
    });


</script>