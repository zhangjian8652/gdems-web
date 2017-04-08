<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        机构管理
        <small>系统机构</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">机构管理</a></li>
        <li class="active">添加机构</li>
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
                    <h3 class="box-title">添加机构</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            [@organization id="${id!}" type="entity";entity]
                            <form id="organization-detail-form" action="" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">机构名:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="name" id="name" value="${entity.name!}">
                                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">父机构</label>
                                    <div class="col-sm-4 input-group">
                                        [@organization id="${entity.parentId!}" type="entity";entity]
                                        [#if entity??]
                                        [#assign parentName = "${entity.name!}"/]
                                        [#assign parentId = "${entity.id!}"/]
                                        [/#if]
                                        <input type="text" class="form-control" name="parentName" id="parentName" readonly value="${parentName!}">
                                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                        <input type="text" name="parentId" id="parentId" value="${parentId!}" style="display: none;">
                                        [/@organization]
                                    </div>
                                </div>
                                <!-- /.form-group -->



                                <div class="form-group">
                                    <label class="col-sm-2 control-label">类型:</label>

                                    <div class="col-sm-6 input-group">
                                        <select class="select2" name="type"
                                                data-placeholder="选择用户角色"
                                                style="width: 200px;" id="type" >
                                            [#if entity?? && entity.type?? &&  entity.type = "department"]
                                            <option value="department" selected>学院</option>
                                            [#else]
                                            <option value="department" >学院</option>
                                            [/#if]
                                            [#if entity?? && entity.type?? &&  entity.type = "major"]
                                            <option value="major" selected>专业</option>
                                            [#else]
                                            <option value="major">专业</option>
                                            [/#if]

                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">负责人:</label>

                                    <div class="input-group">
                                        <select class="select2"  name="master"
                                                data-placeholder="选择负责人" id="master"
                                                style="width: 150%;" value="${entity.master!}">
                                            [@user type="LIST";list]
                                            [#if list?? && list?size > 0]
                                            [#list list as user]
                                            [#if entity?? && entity.master?? &&  entity.master = "${user.id!}"]
                                            <option value="${user.id!}" selected>${user.loginName!}</option>
                                            [#else]
                                            <option value="${user.id!}">${user.loginName!}</option>
                                            [/#if]
                                            [/#list]
                                            [/#if]
                                            [/@user]
                                        </select>
                                    </div>
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">排序值:</label>

                                    <div class="col-sm-4 input-group ">
                                        <input type="text" class="form-control spinner" name="type" id="sort" value="${entity.sort!}">
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <!-- /.form-group -->



                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-4 input-group">
                                 <button type="button" class="btn  btn-info btn-lg  margin" onclick="CommonUtil.loadView('/organization/list');">取消</button>
                                       <!-- <button type="submit" class="btn  btn-success btn-lg margin">确定添加</button>-->
                                    </div>
                                </div>
                            </form>
                            [/@organization]
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
