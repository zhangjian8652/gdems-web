<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${path!}/static/resources/images/avators/${USER.photo!'avator-xx.jpg'}" class="img-circle" alt="User Image">
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
                <a href="${path!}/dashboard">
                    <i class="fa fa-dashboard"></i> <span>主面板</span>
                </a>
            </li>
                [#if topMenus?? && topMenus?size >0 ]
                    [#list topMenus as menu1]
                    <li class="treeview">
                        <a href="#">
                            <i class="fa   ${menu1.icon!'fa-list'}"></i>
                            <span>${menu1.name!}</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            [@menu  parentId="${menu1.id!}" userId="${USER.id!}" type="list";list]
                                [#list list as menu2]
                                    <li><a href="javascript:void(0);" class="page-button" data-uri="${menu2.href!}"><i class="fa  ${menu2.icon!'fa-list-ol'}"></i> ${menu2.name}</a></li>
                                [/#list]
                            [/@menu]
                        </ul>
                    </li>
                    [/#list]
                [/#if]
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>