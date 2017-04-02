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
                            <th>职位</th>
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
                            <th>职位</th>
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

        var bindOperationsEvent = function () {
            $(".edit").click(editUserView);
            $(".detail").click(detailUserView);
            $(".delete").click(deleteUser);
        }
        ,
        editUserView = function () {
            var id = $(this).data("id");
            loadView()

        },
        detailUserView = function () {
            var id = $(this).data("id");

        },
         deleteUser = function () {
            var id = $(this).data("id");
         }
        ;

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
            "drawCallback": bindOperationsEvent
        });


    });
</script>