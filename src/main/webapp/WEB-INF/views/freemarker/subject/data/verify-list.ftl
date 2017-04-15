[@permission permission="gd:subject:detail" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign detail = isOk/]
[/@permission]


[#-- 用户数据输出 --]
[#if page??]
{
"draw":${page.draw!1},
"recordsTotal":${page.recordsTotal!0},
"recordsFiltered":${page.recordsFiltered!0},
"data":[
    [#if page.data??]
        [#list  page.data as subject]
            [#if subject_index > 0]
            ,
            [/#if]
        {
        "tittle": "${subject.tittle!}",
        "type": "${subject.type!}",
        "fromDate": "${subject.fromDate?date!}",
        "endDate": "${subject.endDate?date!}",
        "sourceFrom": "${subject.sourceFrom!}",
        [#if subject.status = "CREATED"]
        "status": "<span class='label label-warning'>创建</span>",
        [#elseif subject.status = "APPROVED"]
        "status": "<span class='label label-success'>通过审核</span>",
        [#elseif subject.status = "DENIED"]
        "status": "<span class='label label-danger'>审核没过</span>
        [#else]
        "status": "<span class='label label-warning'>创建</span>",
        [/#if]
        [#if subject.chooseStatus = "NONE_CHOOSE"]
        "chooseStatus": "<span class='label label-primary'>暂未被选择</span>",
        [#elseif subject.type = "CHOOSE"]
        "chooseStatus": "<span class='label label-default'>已被选择</span>",
        [#elseif subject.type = "APPROVED"]
        "chooseStatus": "<span class='label label-success'>已被选择并通过审核</span>",
        [#elseif subject.type = "DENIED"]
        "chooseStatus": "<span class='label label-danger'>已被选择审核没过</span>
        [#else]
        "chooseStatus": "<span class='label label-warning'>待选择</span>",
        [/#if]

        [#assign operations = ""/]
        [#if verify]
            [#assign operations = "<button type='button' class='btn  bg-orange margin-right operation detail' data-id='${subject.id}' data-uribase='gd/subject' data-operation='detail'>详情</button>"/]
        [/#if]
        "operations": "${operations!}"
        }
        [/#list]
    [/#if]
]
}
[/#if]
