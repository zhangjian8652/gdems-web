[
[@menu parentId="${id}" type="LIST";list]
    [#if list?? && list?size > 0]
        [#list list as menu]
            [#if menu_index > 0]
            ,
            [/#if]
        {
        "id":"${menu.id}",
        "name":"${menu.name}",
        "halfCheck":true,
        "checked":false,
        [#if menu.isParent?? && menu.isParent == "YES"]
        "isParent":true
        [#else]
        "isParent":false
        [/#if]
        }
        [/#list]
    [/#if]
[/@menu]
]