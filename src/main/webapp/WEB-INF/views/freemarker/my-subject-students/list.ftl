<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        任务书
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">任务书</a></li>
        <li class="active">任务书学生列表</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">任务书学生列表</h3>
                    <div class="row">
                        <div class="col-md-12" id="tipper">

                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="subjects" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>学生</th>
                            <th>班级</th>
                            <th>选题名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tfoot>
                        <tr>
                            <th>编号</th>
                            <th>学生</th>
                            <th>班级</th>
                            <th>选题名称</th>
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
                            loadView("/gd/mystudents/list");
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
        $('#subjects').dataTable({
            "ordering": false,
            "serverSide": true,
            "ajax": {
                "url": "/gd/mystudents/list",
                "type":"POST"
            },
            "columns": [
                {"data": "no"},
                {"data": "student"},
                {"data": "class"},
                {"data": "tittle"},
                {"data": "operations"}
            ],
            "drawCallback": function(){
                $(".operation").click(operation);
            }
        });
    });
</script>