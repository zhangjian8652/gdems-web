[@permission permission="gd:reviewercommentbook:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign reviewercommentbookEdit = isOk/]
[/@permission]

[@permission permission="gd:reviewercommentbook:print" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign reviewercommentbookPrint = isOk/]
[/@permission]

[@permission permission="gd:examinationcommentbook:edit" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign examinationcommentbookEdit = isOk/]
[/@permission]

[@permission permission="gd:examinationcommentbook:print" userId="${USER.id}" type="BOOLEAN";isOk]
    [#assign examinationcommentbookPrint = isOk/]
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

            [#if directorStudent.director??]
                [#assign director = "${directorStudent.director.loginName!}"/]
            [/#if]

        {
        "no": "${studentNo!}",
        "student": "${studentName!}",
        "director": "${director!}",
        "department": "${departmentName!}",
        "major": "${majorName!}",
        "class": "${claszName!}",
        "tittle": "${tittle!}",
            [#assign operations = ""/]
            [#if reviewercommentbookEdit]
                [#assign operations = "<button type='button' class='btn  btn-primary margin-right operation edit' data-id='${studentId!}' data-uribase='gd/reviewercommentbook' data-operation='edit'>评阅评议书</button>"/]
            [/#if]
            [#if reviewercommentbookPrint]
                [#assign operations = operations + "<button type='button' class='btn  btn-primary margin-right operation edit' data-id='${studentId!}' data-uribase='gd/reviewercommentbook' data-operation='print'>打印评阅评议书</button>"/]
            [/#if]
            [#if examinationcommentbookEdit]
            [#assign operations = operations + "<button type='button' class='btn  btn-info margin-right operation edit' data-id='${studentId!}' data-uribase='gd/examinationcommentbook' data-operation='edit'>答辩评议书</button>"/]
            [/#if]
            [#if examinationcommentbookPrint]
                [#assign operations = operations + "<button type='button' class='btn  btn-info margin-right operation edit' data-id='${studentId!}' data-uribase='gd/examinationcommentbook' data-operation='print'>打印答辩评议书</button>"/]
            [/#if]
        "operations": "${operations!}"
        }
        [/#list]
    [/#if]
]
}
[/#if]
