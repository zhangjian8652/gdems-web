<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户管理
        <small>系统用户</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">用户管理</a></li>
        <li class="active">用户列表</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">用户列表</h3>
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="users" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>电子邮件</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>角色</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tfoot>
                        <tr>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>电子邮件</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>角色</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
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
        var operation = function () {
            var $this = $(this),
                    uriBase = $this.data("uribase"),
                    operation = $this.data("operation"),
                    id = $this.data("id"),
                    url = "/" + uriBase + "/" + operation + "?id=" + id;
            if(operation == "delete"){
                $.get(url, function(data) {
                   $tipper = $("#tipper");
                    if (data.code.startsWith(successCodePrefix)) {
                        $tipper.messager().success(data.message);
                        setTimeout(function() {
                            loadView("/user/list");
                        },3000);
                        return;
                    }else{
                        $tipper.messager().error(data.message);
                        return;
                    }
                });
            }else{
                CommonUtil.loadView(url);
            }

        }

        $('#users').dataTable({
            "ordering": false,
            "serverSide": true,
            "ajax": {
                "url": "/user/list",
                "type":"POST"
            },
            "columns": [
                {"data": "no"},
                {"data": "loginName"},
                {"data": "mobile"},
                {"data": "email"},
                {"data": "department"},
                {"data": "major"},
                {"data": "roleNames"},
                {"data": "operations"},
            ],
            "drawCallback": function(){
                $(".operation").click(operation);
            }
        });


    });
</script>