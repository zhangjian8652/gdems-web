<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        任务书
        <small>毕业设计</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">任务书</a></li>
        <li class="active">任务书填写</li>
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
                                    <input type="text" class="form-control" readonly>
                                </td>
                                <td>姓        名：</td>
                                <td>
                                    <input type="text" class="form-control" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>论文设计题目：</td>
                                <td colspan="3">
                                    <input type="text" name="" class="form-control input-lg">
                                </td>
                            </tr>
                            <tr>
                                <td>专        题：</td>
                                <td colspan="3">
                                    <input type="text" name="" class="form-control input-lg">
                                </td>
                            </tr>
                            <tr>
                                <td>要求完成的内容：</td>
                                <td colspan="3">
                                    <textarea name="" style="width: 100%;resize: none" rows="6" class="form-control" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>发题日期：</td>
                                <td class="date"><input type="text" class="form-control  pull-right" name="sendDate" placeholder="yyyy-mm-dd"
                                           id="sendDate" readonly data-date-format="yyyy-mm-dd"></td>
                                <td>完成日期：</td>
                                <td class="date"><input type="text" class="form-control  pull-right" name="sendDate" placeholder="yyyy-mm-dd"
                                           id="finishDate" readonly data-date-format="yyyy-mm-dd"></td>
                            </tr>
                            <tr>
                                <td>实习实训单位：</td>
                                <td><input type="text" name="" class="form-control"></td>
                                <td>地点：</td>
                                <td><input type="text" name="" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>论文页数：</td>
                                <td><input type="text" class="form-control spinner" name="pageNum" id="pageNum"></td>
                                <td>图纸张数：</td>
                                <td><input type="text" class="form-control spinner" name="drawingNum" id="drawingNum"></td></td>
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
                            <tr>
                                <td></td>
                                <td> <button type="button" onclick="printJS('task-book-form', 'html')">打印</button></td>
                                <td ><button type="button">保存</button></td>
                                <td ></td>
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