[#-- menu树形结构table开始--]
[#macro menuTreeTable]
<table class="table table-condensed" id="menu-table">
    <tbody>
    <tr>
        <th style="width:250px">名称</th>
        <th style="width:200px">访问链接</th>
        <th style="width:200px">权限</th>
        <th style="width:200px">图标
        </td>
        <th>操作</th>
    </tr>
        [@menu type="LIST";list]
            [#if list?? && list?size > 0]
                [#list list as menu]
                    [#if menu??]
                    <tr data-tt-id="${menu.id!}">
                        <td>${menu.name!}</td>
                        <td>${menu.href!}</td>
                        <td>${menu.permission!}</td>
                        <td>${menu.icon!}</td>
                        <td>
                            [@macro.operationButtons id="${menu.id}" uriBase="menu"/]
                        </td>
                    </tr>
                        [@macro.menuTreeTableChildren parentId="${menu.id}" uriBase="menu"/]
                    [/#if]
                [/#list]
            [/#if]
        [/@menu]
    </tbody>
</table>
<script type="text/javascript">
    //treetable start
    $(function () {
        $("#menu-table").treetable({expandable: true});
        $("#menu-table tr:nth-child(2) td:first-child a").click();
    })
</script>
[/#macro]

[#macro menuTreeTableChildren parentId uriBase]
    [@menu parentId="${parentId!}" type="LIST";list]
        [#if list?? && list?size>0]
            [#list list as menu]
            <tr data-tt-id="${menu.id}" data-tt-parent-id="${parentId!}">
                <td>${menu.name!}</td>
                <td>${menu.href!}</td>
                <td>${menu.permission!}</td>
                <td>${menu.icon!}</td>
                <td>
                    [@macro.operationButtons id="${menu.id}"  uriBase=uriBase/]
                </td>
            </tr>
                [@macro.menuTreeTableChildren parentId="${menu.id}" uriBase=uriBase/]
            [/#list]
        [/#if]
    [/@menu]
[/#macro]

[#-- menu树形结构table结束--]

[#--组织机构树形结构table开始--]
[#macro organizationTreeTable uriBase]
<table class="table table-condensed" id="organization-table">
    <tbody>
    <tr>
        <th style="width:300px">名称</th>
        <th style="width:200px">类型</th>
        <th style="width:200px">排序值</th>
        <th style="width:200px">负责人
        </td>
        <th>操作</th>
    </tr>
        [@macro.organizationTreeTableChildren parentId="" uriBase="${uriBase}"/]
    </tbody>
</table>
<script type="text/javascript">
    //treetable start
    $(function () {
        //将table树形化
        $("#organization-table").treetable({expandable: true});
        //默认全部收起，是第一个列展开
        $("#organization-table tr:nth-child(2) td:first-child a").click();


        var operation = function () {
            var $this = $(this),
                    uriBase = $this.data("uribase"),
                    operation = $this.data("operation"),
                    id = $this.data("id"),
                    url = "/" + uriBase + "/" + operation + "?id=" + id;

            if(operation == "delete"){
                $.get(url, CommonUtil.ajaxCallback);
            }else{
                CommonUtil.loadView(url);
            }

        }

        $(".operation").click(operation);
    })
</script>
[/#macro]

[#macro organizationTreeTableChildren uriBase parentId=""]
    [@organization  parentId="${parentId!}"  type="LIST";list]
        [#if list?? && list?size > 0]
            [#list list as organization]
                [#if organization??]
                <tr data-tt-id="${organization.id!}"
                    [#if parentId?? && parentId !=""]
                    data-tt-parent-id="${parentId!}"
                    [/#if]
                        >
                    <td>${organization.name!}</td>
                    <td>${organization.type!}</td>
                    <td>${organization.sort!}</td>

                    [@user userId=organization.master type="entity";entity]
                        [#if entity??]
                            <td>${entity.name!}</td>
                        [#else]
                            <td></td>
                        [/#if]
                    [/@user]
                    <td>
                        [@macro.operationButtons id="${organization.id!}" uriBase="${uriBase!}"/]
                    </td>
                </tr>
                    [@macro.organizationTreeTableChildren parentId="${organization.id!}" uriBase="${uriBase!}"/]
                [/#if]
            [/#list]
        [/#if]
    [/@organization]
[/#macro]

[#--织机构树形结构table结束--]

[#macro operationButtons id uriBase]
    [@macro.editButton id=id uriBase=uriBase/]
[#--    [@macro.detailButton id=id uriBase=uriBase/]--]
    [@macro.deleteButton id=id uriBase=uriBase/]
[/#macro]

[#macro editButton id uriBase]
<button type='button' class='btn  bg-orange margin-right operation edit' data-id='${id!}' data-operation="edit"
        data-uribase="${uriBase}">编辑
</button>
[/#macro]
[#macro detailButton id uriBase]
<button type='button' class='btn  bg-olive margin-right operation detail' data-id='${id!}' data-operation="detail"
        data-uribase="${uriBase}">详情
</button>
[/#macro]
[#macro deleteButton id uriBase]
<button type='button' class='btn  bg-orange bg-maroon operation delete' data-id='${id!}' data-operation="delete"
        data-uribase="${uriBase}">删除
</button>
[/#macro]
