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
        [#if selectedMenus?? && selectedMenus?size > 0]
            [#list selectedMenus as sMenu]
                [#if sMenu?? && sMenu.id?? && sMenu.id = menu.id]
                    [#assign selected = true/]
                [/#if]
            [/#list]
        [/#if]
        [#if selected?? && selected]
        "checked":true,
            [#assign selected = false/]
        [#else]
        "checked":false,
        [/#if]
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