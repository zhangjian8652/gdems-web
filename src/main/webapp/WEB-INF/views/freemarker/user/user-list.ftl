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
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table id="users" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>电子邮件</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>职位</th>
                        </tr>
                        </thead>

                        <tfoot>
                        <tr>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>电子邮件</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>职位</th>
                        </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

    $(function(){
        $('#users').dataTable( {
            serverSide: true,
            "ajax": {
                "url": "/user/list/data",
                "columns": [
                    { "data": "loginName"},
                    { "data": "mobile"},
                    { "data": "email"},
                    { "data": "department"},
                    { "data": "major"},
                    { "data": "roleNames"}
                ]
            }
        } );
    });
</script>