<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        选题管理
        <small>系统用户</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
        <li><a href="#">选题管理</a></li>
        <li class="active">可选选题</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        [#if subjects?? && subjects?size>0]
            [#list subjects as subject]
                [#if subject_index%4 = 0]
                    [#assign bgClass="bg-aqua"/]
                [#elseif subject_index%4 = 1]
                    [#assign bgClass="bg-green"/]
                [#elseif subject_index%4 = 2]
                    [#assign bgClass="bg-yellow"/]
                [#elseif subject_index%4 = 3]
                    [#assign bgClass="bg-red"/]
                [#else]
                    [#assign bgClass="bg-aqua"/]
                [/#if]
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box ${bgClass!}">
                    <div class="inner">
                        <h3>${subject.tittle!}</h3>
                        [@user type="entity" userId="${subject.createBy!}";entity]
                            [#if entity??]
                            [@role type="list" userId="${subject.createBy!}";list]
                                [#if list?? && list?size>0]
                                    [#assign roles= ""/]
                                    [#list list as role]
                                        [#if role_index > 0]
                                         [#assign roles = roles + "," /]
                                        [/#if]
                                        [#assign roles = roles + role.name /]
                                    [/#list]
                                [/#if]
                            [/@role]
                             <p>${entity.loginName!}  ${roles!} 提交的选题。</p>
                            [/#if]
                        [/@user]
                    </div>
                    [@permission permission = "gd:subject:detail" userId="${USER.id}" type="BOOLEAN";isOk]
                        [#if isOk]
                        <a href="javascript:void(0);" onclick="CommonUtil.loadView('/gd/subject/detail?id=${subject.id!}')" class="small-box-footer">详细信息 <i class="fa fa-arrow-circle-right"></i></a>
                        [/#if]
                    [/@permission]
                </div>
            </div>
            <!-- ./col -->
            [/#list]
        [/#if]
    </div>
    <!-- /.row -->
</section><!-- /.content -->
