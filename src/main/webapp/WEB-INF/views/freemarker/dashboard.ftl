<!DOCTYPE html>
<html>
  <head>

      <title>毕业设计 | 管理系统</title>
    [#include "common/common-meta.ftl"/]
    [#include "common/common-css.ftl"/]
  </head>
  <body class="sidebar-mini wysihtml5-supported skin-green fixed">
    <div class="wrapper">


    [#include "common/dashboard-header.ftl"/]
    [#include "common/dashboard-menu.ftl"/]

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper" id="container">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           主页
            <small>控制面板</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="${path!}/dashboard"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">控制面板</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Small boxes (Stat box) -->
          <div class="row" style="font-size: 50px; text-align: center;">
              欢迎来到毕业设计管理系统。
          </div>

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


    </div><!-- ./wrapper -->

    [#include "common/common-js.ftl"/]
  </body>
</html>
