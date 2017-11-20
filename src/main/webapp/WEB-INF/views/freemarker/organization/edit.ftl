<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        机构管理
        <small>系统机构</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">机构管理</a></li>
        <li class="active">编辑机构</li>
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
                    <h3 class="box-title">编辑机构</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            [@organization id="${id!}" type="entity";entity]
                                [#assign currentOrganization = entity/]
                            <form id="organization-edit-form" action="/organization/edit" method="post" class="form-horizontal">
                                <input type="hidden" value="${currentOrganization.id!}" name="id" id="id">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">机构名:</label>

                                    <div class="col-sm-4 input-group">
                                        <input type="text" class="form-control" name="name" id="name" value="${currentOrganization.name!}" readonly>
                                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form-group -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">父机构</label>
                                    <div class="col-sm-4 input-group">
                                        [@organization id="${currentOrganization.parentId!}" type="entity";entity]
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
                                                style="width: 150%;" value="${currentOrganization.master!}">
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
                                        <input type="text" class="form-control spinner" name="type" id="sort" value="${currentOrganization.sort!}">
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <!-- /.form-group -->



                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-4 input-group">
                                        <button type="button" class="btn  btn-info btn-lg  margin" onclick="CommonUtil.loadView('/organization/list');">取消</button>
                                        <button type="submit" class="btn  btn-success btn-lg margin">确定</button>
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
    <div class="tree-select-modal hide">
        <div class="modal modal-info">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">选择父机构</h4>
                    </div>
                    <div class="modal-body" id="tree-select-area">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal" id="cancel">取消</button>
                        <button type="button" class="btn btn-primary" id="confirm">确定</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

    </div>


</section><!-- /.content -->

<script type="text/javascript">


    $(function () {

        //Initialize Select2 Elements
        $(".select2").select2();


        $(".spinner").spinner();

        //登录表单验证开始
        var userAddFormRules = {
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                }
            },
            messages: {
                name: {
                    required: "机构名必须填写"
                    , minlength: "机构名长度必须大于{0}"
                    , maxlength: "机构名长度不能大于{0}"
                }
            },
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form

                var $form, requestPath, method, requestData, callBack;
                $form = $(form);
                requestPath = $path + $form.attr("action");
                method = $form.attr("method");

                var name = $("#name").val()
                        , type = $("#type").val()
                        , id = $("#id").val()
                        , sort = $("#sort").val()
                        , master = $("#master").val()
                        , parentId =document.getElementById("parentId").value;

                requestData = {
                    id: id,
                    name: name,
                    parentId: parentId,
                    master: master,
                    sort: sort,
                    type:type
                };

                callBack = function (data) {
                    var successCode = "100000", $tipper = $("#tipper");
                    if (successCode === data.code) {
                        $tipper.messager().success(data.message);
                        $("input").val("");
                        return;
                    }else{
                        $tipper.messager().error(data.message);
                        return;
                    }

                }

                var datas = JSON.stringify(requestData);

                $.ajax({
                    url: requestPath,
                    type: method,
                    dataType :'json',
                    contentType: "application/json; charset=utf-8",
                    data: datas,
                    success: callBack
                });

            }
        }

        $.extend(userAddFormRules, GlobalVariable.formBaseRules);

        var $userAddForm = $("#organization-edit-form");

        if ($userAddForm.length > 0) {
            $userAddForm.validate(userAddFormRules);
        }

        $("#parentName").click(function () {
            CommonUtil.loadViewToBox("#tree-select-area","/organization/selecttree");
            currentSelectId = "#parentId";
            currentSelectValueId = "#parentName";
            showSelect();
        });

        $(".close").click(hideSelect);
        $("#cancel").click(hideSelect);
        $("#confirm").click(setSelectedValue);

    });


    var selectedNode={};
    var currentSelectId,currentSelectValueId;

    function setSelectedValue(){
        $(currentSelectId).val(selectedNode.id);
        $(currentSelectValueId).val(selectedNode.name);
        hideSelect();
    }


    function showSelect(){
        $(".tree-select-modal").removeClass("hide");
    }

    function hideSelect(){
        $(".tree-select-modal").addClass("hide");
    }

</script>
