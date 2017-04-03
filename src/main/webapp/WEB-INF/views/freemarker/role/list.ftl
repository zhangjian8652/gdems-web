<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        角色管理
        <small>系统角色</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">角色管理</a></li>
        <li class="active">角色列表</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">角色列表</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="roles" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>角色名</th>
                            <th>角色英文名</th>
                            <th>角色类型</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tfoot>
                        <tr>
                            <th>角色名</th>
                            <th>角色英文名</th>
                            <th>角色类型</th>
                            <th>状态</th>
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

        $('#roles').dataTable({
            "ordering": false,
            "serverSide": true,
            "ajax": {
                "url": "/role/list",
                "type":"POST"
            },
            "columns": [
                {"data": "name"},
                {"data": "englishName"},
                {"data": "roleType"},
                {"data": "useAble"},
                {"data": "operations"}
            ],
            "drawCallback": bindOperationsEvent
        });


    });
</script>