[@permission permission="sys:role:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign edit = isOk/]
[/@permission]
[@permission permission="sys:role:detail" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign detail = isOk/]
[/@permission]
[@permission permission="sys:role:delete" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign delete = isOk/]
[/@permission]

[#-- 用户数据输出 --]
[@role draw="${draw!'1'}" offset="${offset!0}" limit="${limit!10}" searchValue="${searchValue}" type="PAGE";page]
    [#if page??]
    {
    "draw":${page.draw!1},
    "recordsTotal":${page.recordsTotal!0},
    "recordsFiltered":${page.recordsFiltered!0},
    "data":[
        [#if page.data??]
            [#list  page.data as role]
                [#if role_index > 0]
                ,
                [/#if]
            {"name": "${role.name!}",
            "englishName": "${role.englishName!}",
                [#if role.roleType?? && role.roleType == "NORMAL"]
                "roleType": "普通",
                [#else]
                "roleType": "普通",
                [/#if]
                [#if role.useable?? && role.useable == "ACTIVE"]
                "useAble": "激活",
                [#elseif role.useable?? && role.useable == "INACTIVE"]
                "useAble": "冻结",
                [#else]
                "useAble": "冻结",
                [/#if]
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
[/@role]