<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${path!}/static/resources/images/avators/${USER.photo!'user2-160x160.jpg'}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${USER.loginName!'未知'}</p>
                <a href="#"><i class="fa fa-circle text-success"></i>Online</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">主菜单栏</li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>主面板</span>
                </a>
            </li>
            <li class="header">系统设置</li>
            <li class="treeview">
                <a href="#">
                    <i class="fa  fa-users"></i>
                    <span>用户管理</span>
                    <span class="label label-primary pull-right">4</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/user/list"><i class="fa  fa-list-ol"></i> 用户列表</a></li>
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/user/add"><i class="fa   fa-user-plus"></i> 增加用户</a></li>
                </ul>
            </li>
   <#--         <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i>
                    <span>角色管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/role/list"><i class="fa fa-list-ol"></i> 角色列表</a></li>
                    <li><a href="javascript:void(0)" class="page-button" data-uri="/role/add"><i class="fa fa-circle-o"></i> 角色添加</a></li>
                </ul>
            </li>-->
   <#--         <li class="treeview">
                <a href="#">
                    <i class="fa fa-user-secret"></i>
                    <span>机构管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/organization/list"><i class="fa fa-circle-o"></i> 机构列表</a></li>
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/organization/add"><i class="fa fa-circle-o"></i> 机构添加</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user-secret"></i>
                    <span>菜单管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/menu/list"><i class="fa fa-circle-o"></i> 菜单列表</a></li>
                    <li><a href="javascript:void(0);" class="page-button" data-uri="/menu/add"><i class="fa fa-circle-o"></i> 添加菜单</a></li>
                </ul>
            </li>
-->

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>毕业设计</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i>我的毕业设计</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i>学生的毕业设计</a></li>
                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>