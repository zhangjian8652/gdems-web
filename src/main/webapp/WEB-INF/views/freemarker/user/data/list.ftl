[@permission permission="sys:user:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign edit = isOk/]
[/@permission]
[@permission permission="sys:user:detail" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign detail = isOk/]
[/@permission]
[@permission permission="sys:user:delete" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign delete = isOk/]
[/@permission]

[#-- 用户数据输出 --]
[@user draw="${draw!'1'}" offset="${offset!0}" limit="${limit!10}" searchValue="${searchValue}" type="PAGE";page]
    [#if page??]
    {
    "draw":${page.draw!1},
    "recordsTotal":${page.recordsTotal!0},
    "recordsFiltered":${page.recordsFiltered!0},
    "data":[
        [#if page.data??]
            [#list  page.data as user]
                [#if user_index > 0]
                ,
                [/#if]
            {"no": "${user.no!}",
            "loginName": "${user.loginName!}",
            "mobile": "${user.mobile!}",
            "email": "${user.email!}",
                [@organization id="${user.departmentId}" type="ENTITY";entity]
                    [#if entity??]
                        [#assign organizationName = "${entity.name}"]
                    [/#if]
                "department": "${organizationName!}",
                [/@organization]
                [@organization id="${user.majorId}" type="ENTITY";entity]
                    [#if entity??]
                        [#assign organizationName = "${entity.name}"]
                    [/#if]
                "major": "${organizationName!}",
                [/@organization]
                [@role userId="${user.id}" type="LIST";list]
                    [#assign roleNames = ""]
                    [#list list as role]
                        [#if role_index == 0]
                            [#assign roleNames = roleNames + role.name]
                        [#else]
                            [#assign roleNames = roleNames + role.name/]
                        [/#if]
                    [/#list ]
                "roleNames": "${roleNames!}",
                [/@role]
                [#assign operations = ""/]
                [#if edit]
                    [#assign operations = "<button type='button' class='btn  bg-orange margin-right edit' data-id='${user.id}' >编辑</button>"/]
                [/#if]
                [#if detail]
                    [#assign operations = operations + "<button type='button' class='btn bg-olive margin-right detail' data-id='${user.id}' >详情</button>"/]
                [/#if]
                [#if delete]
                    [#assign operations = operations + "<button type='button' class='btn bg-maroon margin-right delete' data-id='${user.id}' >删除</button>"/]
                [/#if]
                "operations": "${operations!}"
            }
            [/#list]
        [/#if]
    ]
    }
    [/#if]
[/@user]