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
                    <form id="task-book-form" method="post" action="">
                    <table class="table table-bordered table-hover word-table">
                       <tbody>
                            <tr>
                                <td>班        级：</td>
                                <td>
                                    傻逼2406班
                                </td>
                                <td>姓        名：</td>
                                <td>
                                   傻逼
                                </td>
                            </tr>
                            <tr>
                                <td>论文设计题目：</td>
                                <td colspan="3">
                                   傻逼的题目，找人弄
                                </td>
                            </tr>
                            <tr>
                                <td>专        题：</td>
                                <td colspan="3">
                                    傻逼的题目，找人弄
                                </td>
                            </tr>
                            <tr>
                                <td>要求完成的内容：</td>
                                <td colspan="3">
                                    傻逼的题目，找人弄<br/>
                                    傻逼的题目，找人弄<br/>
                                    傻逼的题目，找人弄<br/>
                                    傻逼的题目，找人弄<br/>
                                    傻逼的题目，找人弄<br/>
                                    傻逼的题目，找人弄<br/>
                                    傻逼的题目，找人弄<br/>
                                </td>
                            </tr>
                            <tr>
                                <td>发题日期：</td>
                                <td class="date">2017-04-12</td>
                                <td>完成日期：</td>
                                <td class="date">2017-05-30</td>
                            </tr>
                            <tr>
                                <td>实习实训单位：</td>
                                <td>xxxx单位</td>
                                <td>地点：</td>
                                <td>xxxx地点</td>
                            </tr>
                            <tr>
                                <td>论文页数：</td>
                                <td>100</td>
                                <td>图纸张数：</td>
                                <td>20</td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>指导教师：</td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>教研主任：</td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>院    长：</td>
                                <td colspan="2"></td>
                            </tr>
                       </tbody>
                    </table>
                    </form>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-lg-4">
            <div class="box">
                <div class="box-header">
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <button type="button" onclick="printJS({ printable: 'task-book-form', type: 'html', header: '     新疆大学 - 毕业论文（设计）任务书' })" class="btn btn-success btn-lg">打印</button>
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
        $(".date input").datepicker({autoclose: true,language: 'zh-CN'});
        $(".spinner").spinner({min:0,lenth:3});
    });


 /*   $(function () {
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
                            loadView("/gd/subject/list");
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
                "url": "/gd/subject/list",
                "type":"POST"
            },
            "columns": [
                {"data": "tittle"},
                {"data": "sourceFrom"},
                {"data": "type"},
                {"data": "fromDate"},
                {"data": "endDate"},
                {"data": "status"},
                {"data": "chooseStatus"},
                {"data": "operations"}
            ],
            "drawCallback": function(){
                $(".operation").click(operation);
            }
        });
    });*/
</script>