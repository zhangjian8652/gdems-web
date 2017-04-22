[@permission permission="gd:taskbook:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign edit = isOk/]
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
        "status": "<span class='label label-danger'>审核没过</span>",
        [#else]
        "status": "<span class='label label-warning'>创建</span>",
        [/#if]
        [#if subject.chooseStatus = "NONE_CHOOSE"]
        "chooseStatus": "<span class='label label-primary'>暂未被选择</span>",
        [#elseif subject.chooseStatus = "CHOOSE"]
        "chooseStatus": "<span class='label label-default'>已被选择</span>",
        [#elseif subject.chooseStatus = "APPROVED"]
        "chooseStatus": "<span class='label label-success'>已被选择并通过审核</span>",
        [#elseif subject.chooseStatus = "DENIED"]
        "chooseStatus": "<span class='label label-danger'>已被选择审核没过</span>
        [#else]
        "chooseStatus": "<span class='label label-warning'>待选择</span>",
        [/#if]

        [#assign operations = ""/]
        [#if edit]
            [#assign operations = "<button type='button' class='btn  bg-orange margin-right operation edit' data-id='${subject.id}' data-uribase='gd/subject' data-operation='edit'>编辑</button>"/]
        [/#if]

        [#if subject.chooseStatus = "CHOOSE"]
        [#if verify]
            [#assign operations = operations + "<button type='button' class='btn bg-primary margin-right operation delete' data-id='${subject.id}' data-uribase='gd/subject/choose' data-operation='verify'>审核</button>"/]
        [/#if]
        [/#if]

        [#if subject.chooseStatus != "APPROVED"]
        [#if delete]
            [#assign operations = operations + "<button type='button' class='btn bg-maroon margin-right operation delete' data-id='${subject.id}' data-uribase='gd/subject' data-operation='delete'>删除</button>"/]
        [/#if]
        [/#if]
        "operations": "${operations!}"
        }
        [/#list]
    [/#if]
]
}
[/#if]
