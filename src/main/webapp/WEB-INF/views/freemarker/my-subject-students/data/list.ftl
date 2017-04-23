[@permission permission="gd:taskbook:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign taskbookEdit = isOk/]
[/@permission]

[@permission permission="gd:taskbook:print" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign taskbookPrint = isOk/]
[/@permission]

[@permission permission="gd:interimcheckbook:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign interimcheckbookEdit = isOk/]
[/@permission]

[@permission permission="gd:interimcheckbook:print" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign interimcheckbookPrint = isOk/]
[/@permission]

[@permission permission="gd:directorcommentbook:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign directorcommentbookEdit = isOk/]
[/@permission]

[@permission permission="gd:directorcommentbook:print" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign directorcommentbookPrint = isOk/]
[/@permission]



[#-- 用户数据输出 --]
[#if page??]
{
"draw":${page.draw!1},
"recordsTotal":${page.recordsTotal!0},
"recordsFiltered":${page.recordsFiltered!0},
"data":[
    [#if page.data??]
        [#list  page.data as directorStudent]
            [#if directorStudent_index > 0]
            ,
            [/#if]

            [#if directorStudent.student??]
                [#assign studentName = "${directorStudent.student.loginName!}"/]
                [#assign studentNo = "${directorStudent.student.no!}"/]
                [#assign studentId = "${directorStudent.student.id!}"/]
            [/#if]

            [#if directorStudent.department??]
                [#assign departmentName = "${directorStudent.department.name!}"/]
            [/#if]

            [#if directorStudent.major??]
                [#assign majorName = "${directorStudent.major.name!}"/]
            [/#if]

            [#if directorStudent.clasz??]
                [#assign claszName = "${directorStudent.clasz.name!}"/]
            [/#if]

            [#if directorStudent.subject??]
                [#assign tittle = "${directorStudent.subject.tittle!}"/]
            [/#if]

        {
        "no": "${studentNo!}",
        "student": "${studentName!}",
        "department": "${departmentName!}",
        "major": "${majorName!}",
        "class": "${claszName!}",
        "tittle": "${tittle!}",
            [#assign operations = ""/]
            [#if taskbookEdit]
                [#assign operations = "<button type='button' class='btn  btn-primary margin-right operation edit' data-id='${studentId!}' data-uribase='gd/taskbook' data-operation='edit'>编辑任务书</button>"/]
            [/#if]
            [#if taskbookPrint]
                [#assign operations = operations + "<button type='button' class='btn  btn-primary margin-right operation edit' data-id='${studentId!}' data-uribase='gd/taskbook' data-operation='print'>打印任务书</button>"/]
            [/#if]
            [#if interimcheckbookEdit]
            [#assign operations = operations + "<button type='button' class='btn  btn-info margin-right operation edit' data-id='${studentId!}' data-uribase='gd/interimcheckbook' data-operation='edit'>编辑中期检查表</button>"/]
            [/#if]
            [#if interimcheckbookPrint]
                [#assign operations = operations + "<button type='button' class='btn  btn-info margin-right operation edit' data-id='${studentId!}' data-uribase='gd/interimcheckbook' data-operation='print'>打印中期检查表</button>"/]
            [/#if]
            [#if directorcommentbookEdit]
                [#assign operations = operations + "<button type='button' class='btn  btn-success margin-right operation edit' data-id='${studentId!}' data-uribase='gd/directorcommentbook' data-operation='edit'>编辑评议书</button>"/]
            [/#if]
            [#if directorcommentbookPrint]
                [#assign operations = operations + "<button type='button' class='btn  btn-success margin-right operation edit' data-id='${studentId!}' data-uribase='gd/directorcommentbook' data-operation='print'>打印评议书</button>"/]
            [/#if]
        "operations": "${operations!}"
        }
        [/#list]
    [/#if]
]
}
[/#if]
