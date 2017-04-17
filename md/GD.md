# 毕业设计管理系统设计文档

## 数据结构设计

### 选题
    
表名：gd_subject
    
| 属性 | 字段名 | 类型 |长度| 描述|
| :---: | :---: | :---: |:---: | :---: |
| 主键    |  id | String | 64 | 表主键ID |
| 标题    |  tittle | String | 200 | 选题标题 |
| 来源   | from   | String | 60| 选题来源：教师科研，教师自拟，学生自选，生产实践，实验室（课程建设） 其他|
| 类型    | type   | String | 60| 选题类型：应用研究，理论研究，工程设计，计算机软件，社会调查，社会难点热点，其他|
| 要求    | require | String | 600 | 对学生的要求 |
| 起始时间 | from_date | datetime|  | 选题开始时间 |
| 结束时间 | end_date | datetime |  | 选题结束时间 |
| 毕业时间 | graduation_date| datetime| | 学生毕业时间 |
| 学院 | graduation_department| String| 100 | 学生毕业学院 |
| 主要任务 | main_task | String | 400 |  学生主要任务 |
| 创建时间 | created_date| datetime| |创建选题时间|
| 更新时间 | updated_date | datetime| |更新选题时间|
| 创建人 | created_by | String| 64 |创建人ID|
| 更新人 | updated_by | datetime| 64|更新人ID|
| 审核状态 | status | String|20 | 选题状态：创建待审核，审核通过，审核不通过|
| 审核人 | verifier | String|64 | 审核人ID|
| 审核时间 | verifier_date | datetime| | 审核日期|
| 选择选题人 | choose_by | datetime| 64| 选择该选题的人主键ID|
| 选择时间 | choose_date | datetime| | 选择该选题的人主键ID|
| 选择审核状态 | choose_status | string|20 |选择选题后状态：待审核，通过审核，审核不通过|
| 导师 | director | string|64 |用户主键ID|


### 文件

表明：gd_file

| 属性 | 字段名 | 类型 |长度| 描述|
| :---: | :---: | :---: |:---: | :---: |
| 主键 | id | String |64|文件主键ID|
| 作用 | using_for | String |100|文件用途|
| 文件名 | name | String |100|文件名称|
| 路径 | path | String |100|文件路径|
| 类型 | type | String |40| 文件类型 |
| 上传人 | uploaded_by | String |64| 用户关联ID |
| 上传时间 | uploaded_date | datetime || 文件上传时间 |

 