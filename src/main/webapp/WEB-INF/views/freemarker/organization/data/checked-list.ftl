[
[@organization parentId="${id}" type="LIST";list]
    [#if list?? && list?size > 0]
        [#list list as organization]
            [#if organization_index > 0]
            ,
            [/#if]
        {
        "id":"${organization.id}",
        "name":"${organization.name}",
        "halfCheck":true,
        "checked":false,
        [#if organization.parentId?? && organization.parentId != "NO"]
        "isParent":false
        [#else]
        "isParent":true
        [/#if]
        }
        [/#list]
    [/#if]
[/@organization]
]