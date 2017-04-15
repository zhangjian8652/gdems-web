<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        选题管理
        <small>系统用户</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">选题管理</a></li>
        <li class="active">编辑选题</li>
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
                    <h3 class="box-title">编辑选题</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <form id="form" action="/gd/subject/edit" method="post" class="form-horizontal">
                                <input type="hidden" value="${subject.id!}" name="id" id="id">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标题:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" value="${subject.tittle!}" class="form-control" name="tittle" id="tittle" disabled>
                                        <span class="glyphicon glyphicon-flag form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">开始时间:</label>

                                    <div class="col-sm-4 input-group date">
                                        <input type="text" class="form-control" name="fromDate" id="fromDate" value="${subject.fromDate?date!}" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" disabled>
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">结束时间:</label>

                                    <div class="col-sm-4 input-group date">
                                        <input type="text" class="form-control pull-right" name="endDate" id="endDate" value="${subject.endDate?date!}" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"
                                               disabled>
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">毕业时间:</label>

                                    <div class="col-sm-4 input-group date">

                                        <input type="text" class="form-control  pull-right"  name="graduationDate" placeholder="yyyy-mm-dd"
                                               value="${subject.graduationDate?date!}"   id="graduationDate" disabled data-date-format="yyyy-mm-dd">
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">来源:</label>

                                    <div class="col-sm-10 input-group radio-group">
                                        [#if subject.sourceFrom?? && subject.sourceFrom = "教师科研"]
                                        <input type="radio" name="sourceFrom" value="教师科研"
                                               id="from-teaccher-researching" checked><label for="from-teaccher-researching">教师科研</label>
                                        [#else]
                                        <input type="radio" name="sourceFrom" value="教师科研" disabled
                                               id="from-teaccher-researching"><label for="from-teaccher-researching">教师科研</label>
                                        [/#if]

                                        [#if subject.sourceFrom?? && subject.sourceFrom = "教师自拟"]
                                        <input type="radio" name="sourceFrom" value="教师自拟" id="from-teacher-self"
                                               checked><label for="from-teacher-self">教师自拟</label>
                                        [#else]
                                        <input type="radio" name="sourceFrom" value="教师自拟" id="from-teacher-self"
                                               ><label for="from-teacher-self">教师自拟</label>
                                        [/#if]

                                        [#if subject.sourceFrom?? && subject.sourceFrom = "学生自选"]
                                        <input type="radio" name="sourceFrom" value="学生自选"
                                               id="from-student-self" checked><label for="from-student-self">学生自选</label><br>

                                        [#else]
                                        <input type="radio" name="sourceFrom" value="学生自选" disabled
                                               id="from-student-self"><label for="from-student-self">学生自选</label><br>
                                        [/#if]

                                        [#if subject.sourceFrom?? && subject.sourceFrom = "生产实践"]
                                        <input type="radio" name="sourceFrom" value="生产实践"
                                               id="from-production-practice" checked><label
                                            for="from-production-practice">生产实践</label>
                                        [#else]
                                        <input type="radio" name="sourceFrom" value="生产实践" disabled
                                               id="from-production-practice"><label
                                            for="from-production-practice">生产实践</label>
                                        [/#if]

                                        [#if subject.sourceFrom?? && subject.sourceFrom = "实验室（课程建设）"]
                                        <input type="radio" name="sourceFrom" value="实验室（课程建设）"  id="from-laboratory" checked><label
                                            for="from-laboratory">实验室（课程建设）</label>
                                        [#else]
                                        <input type="radio" name="sourceFrom" value="实验室（课程建设）" disabled id="from-laboratory"><label
                                            for="from-laboratory">实验室（课程建设）</label>
                                        [/#if]

                                        [#if subject.sourceFrom?? && subject.sourceFrom = "生产实践"]
                                        <input type="radio" name="sourceFrom" value="其他" id="from-other" checked ><label
                                            for="from-other">其他</label>
                                        [#else]
                                        <input type="radio" name="sourceFrom" value="其他" id="from-other" disabled><label
                                            for="from-other">其他</label>
                                        [/#if]
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">类型:</label>

                                    <div class="col-sm-10 input-group radio-group">
                                        [#if subject.type?? && subject.type = "应用研究"]
                                        <input type="radio" name="type" value="应用研究" checked
                                               id="type-applied-researching"><label
                                            for="type-applied-researching">应用研究</label>
                                        [#else]
                                        <input type="radio" name="type" value="应用研究" disabled
                                               id="type-applied-researching"><label
                                            for="type-applied-researching">应用研究</label>
                                        [/#if]
                                        [#if subject.type?? && subject.type = "理论研究"]
                                        <input type="radio" name="type" value="理论研究"
                                               id="type-theoretical-researching" checked><label
                                            for="type-theoretical-researching">理论研究</label>
                                        [#else]
                                        <input type="radio" name="type" value="理论研究" disabled
                                               id="type-theoretical-researching" ><label
                                            for="type-theoretical-researching">理论研究</label>
                                        [/#if]
                                        [#if subject.type?? && subject.type = "工程设计"]
                                        <input type="radio" name="type" value="工程设计" checked
                                               id="type-engineering-design"><label
                                            for="type-engineering-design">工程设计</label><br>
                                        [#else]
                                        <input type="radio" name="type" value="工程设计" disabled
                                               id="type-engineering-design"><label
                                            for="type-engineering-design">工程设计</label><br>
                                        [/#if]
                                        [#if subject.type?? && subject.type = "计算机软件"]
                                        <input type="radio" name="type" value="计算机软件"
                                               id="type-computer-software" checked><label
                                            for="type-computer-software">计算机软件</label>
                                        [#else]
                                        <input type="radio" name="type" value="计算机软件" disabled
                                               id="type-computer-software" ><label
                                            for="type-computer-software">计算机软件</label>
                                        [/#if]
                                        [#if subject.type?? && subject.type = "社会调查"]
                                        <input type="radio" name="type" value="社会调查" checked
                                               id="type-social-survey"><label for="type-social-survey">社会调查</label>
                                        [#else]
                                        <input type="radio" name="type" value="社会调查" disabled
                                               id="type-social-survey"><label for="type-social-survey">社会调查</label>
                                        [/#if]
                                        [#if subject.type?? && subject.type = "社会难点热点"]
                                        <input type="radio" name="type" value="社会难点热点" id="type-social-hot" checked
                                                ><label
                                            for="type-social-hot">社会难点热点</label>
                                        [#else]
                                        <input type="radio" name="type" value="社会难点热点" id="type-social-hot" disabled
                                                ><label
                                            for="type-social-hot">社会难点热点</label>
                                        [/#if]
                                        [#if subject.type?? && subject.type = "其他"]
                                        <input type="radio" name="type" value="其他" id="type-other" checked
                                                ><label
                                            for="from-other">其他</label>
                                        [#else]
                                        <input type="radio" name="type" value="其他" id="type-other" disabled
                                                ><label
                                            for="from-other">其他</label>
                                        [/#if]
                                    </div>
                                    <!-- /.input group -->
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">要求:</label>

                                    <div class="col-sm-8 input-group">
                                        <textarea class="form-control" rows="3" placeholder="输入 ..." disabled
                                                  name="requirement">${subject.requirement!}</textarea>
                                    </div>
                                    <!-- /.input group -->
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">主要任务:</label>

                                    <div class="col-sm-8 input-group">
                                        <textarea class="form-control" rows="5" placeholder="输入 ..."
                                                  name="mainTask" disabled >${subject.mainTask!}</textarea>
                                    </div>
                                </div>
                                <!-- /.form-group -->



                                <div class="form-group">
                                    <label class="col-sm-2 control-label">导师:</label>
                                    [@user type="entity" userId="${subject.createBy!}";entity]
                                    [#if entity??]
                                    [@role type="list" userId="${subject.createBy!}";list]
                                    [#if list?? && list?size>0]
                                    [#assign roles= ""/]
                                    [#list list as role]
                                    [#if role_index > 0]
                                    [#assign roles = roles + "," /]
                                    [/#if]
                                    [#assign roles = roles + role.name /]
                                    [/#list]
                                    [/#if]
                                    [/@role]
                                    <div class="col-sm-4 input-group">
                                        <input type="text" value="${entity.loginName!}  ${roles!}" class="form-control" name="tittle" id="tittle" disabled>
                                        <span class="glyphicon glyphicon-users form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                    [/#if]
                                    [/@user]

                                </div>


                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>

                                    <div class="col-sm-4 input-group">
                                        [@permission permission = "gd:subject:available" userId="${USER.id}" type="BOOLEAN";isOk]
                                        [#if isOk]
                                        <button type="button" class="btn  btn-info btn-lg  margin"
                                                onclick="CommonUtil.loadView('/gd/subject/available')">返回可选选题
                                        </button>
                                        [/#if]
                                        [/@permission]
                                        [@permission permission = "gd:subject:list" userId="${USER.id}" type="BOOLEAN";isOk]
                                        [#if isOk]
                                        <button type="button" class="btn  btn-info btn-lg  margin"
                                                onclick="CommonUtil.loadView('/gd/subject/list')">返回选题列表
                                        </button>
                                        [/#if]
                                        [/@permission]

                                        [@permission permission = "gd:subject:choose" userId="${USER.id}" type="BOOLEAN";isOk]
                                        [#if isOk]
                                        <button type="button" class="btn  btn-info btn-lg  margin"
                                                onclick="CommonUtil.loadView('/gd/subject/choose')">选择此题
                                        </button>
                                        [/#if]
                                        [/@permission]
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


        //  $(".date input").datepicker({autoclose: true,language: 'zh-CN'});

    });

</script>