<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        机构管理
        <small>机构菜单</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">机构管理</a></li>
        <li class="active">机构列表</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">菜单列表</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                    [@macro.organizationTreeTable uriBase="organization"/]
                </div>
                <!-- /.box-body -->

                <div class="box-footer clearfix">
                    机构列表。。。
                </div>
            </div>
        </div>
    </div>
</section><!-- /.content -->
