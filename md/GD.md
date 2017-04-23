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
| 创建时间 | update_date| datetime| |创建选题时间|
| 更新时间 | update_date | datetime| |更新选题时间|
| 创建人 | create_by | String| 64 |创建人ID|
| 更新人 | update_by | datetime| 64|更新人ID|
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
| 创建时间 | update_date| datetime| |创建时间|
| 更新时间 | update_date | datetime| |更新时间|
| 创建人 | create_by | String| 64 |创建人ID|
| 更新人 | update_by | datetime| 64|更新人ID|


### 任务书

表明：gd_task_book

| 属性 | 字段名 | 类型 |长度| 描述|
| :---: | :---: | :---: |:---: | :---: |
| 主键 | id | String | 64 | 任务书主键ID|
| 班级 | class| String| 64|班级名称|
| 学生 | student| String | 64|用户id,学生|
|论文（设计）题目|thesis_tittle|String|255|论文（设计的题目）|
|专题|professional_subject|String|120|专题|
|要求完成的内容|requirement_content|String|255|要求完成的内容|
|发题日期|send_date|date| |发题日期|
|完成日期|finish_date|date| |完成日期|
|实习单位|practice_units|String|255 |实习单位|
|实习地点|practice_address|String|255 |实习地址|
|论文页数|thesis_page_count|int|10 |论文页数|
|图纸张数|drawing_count|int|10 |图纸张数|
| 创建时间 | update_date| datetime| |创建时间|
| 更新时间 | update_date | datetime| |更新时间|
| 创建人 | create_by | String| 64 |创建人ID|
| 更新人 | update_by | datetime| 64|更新人ID|
 
### 指导老师评议书

表明：gd_director_comment_book

| 属性 | 字段名 | 类型 |长度| 描述|
| :---: | :---: | :---: |:---: | :---: |
| 主键 | id | String | 64 | 任务书主键ID|
| 论文题目 | thesis_tittle| String| 255|论文题目|
| 学生 | student_id| String | 64|学生id|
| 方案论证分（15分）| plan_proof_score| int | 2 | 方案论证分，总分15分(能独立查阅文献和课题调研，能提出较科学、合理、可行的实施方案。)|
| 论文设计类容（30分）| thesis_design_score| int | 2 | 方案论证分，总分30分(能独立查阅文献和课题调研，能提出较科学、合理、可行的实施方案。)|
| 工作量和难度（20分）| workload_difficulty_score| int | 2| 工作量和难度分，总分20分(遵守毕业论文（设计）管理制度，按期完成任务书规定的内容，工作量饱满，有一定难度。)|
| 论文（设计)质量（20分）| thesis_quality_score| int | 2|论文设计质量，总分20分(结构合理、条理清楚、文理通顺、用语符合专业要求；文体格式规范、图表清楚。图样绘制与技术要求符合国家标准，图面质量符合要求。)|
| 创新性与应用价值（15分）| innovating_worth_score| int | 2| 论文设计质量，总分20分(具有一定的创新性和应用价值。)|
|总分（100）| total_score | int |2| 总分数|
|导师评语| director_comment | String |255| 导师评语|
| 创建时间 | update_date| datetime| |创建时间|
| 更新时间 | update_date | datetime| |更新时间|
| 创建人 | create_by | String| 64 |创建人ID|
| 更新人 | update_by | datetime| 64|更新人ID|


### 指导老师中期检查表

表明：gd_mid_check_form

| 属性 | 字段名 | 类型 |长度| 描述|
| :---: | :---: | :---: |:---: | :---: |
| 主键 | id | String | 64 | 中期检查表主键ID|
| 姓名 | student_id| String |64|用户id,学生|
| 论文题目 | thesis_tittle| String| 255|论文题目|
| 已完成的任务| finish_task | String | 255 | 已完成的任务 |
| 是否符合任务要求书进度| task_conformance| String | 10| NON-CONFORMANCE,CONFORMANCE|
| 尚需完成的任务| require_finish_task| String | 255 |尚需要完成的任务|
| 能否按期完成任务| finish_task_in_time| String | 10| 能否按期完成任务（YES,NO）|
| 存在的问题及解决办法| problems_and_solutions| String | 255|存在的问题及解决办法|
| 创建时间 | update_date| datetime| |创建时间|
| 更新时间 | update_date | datetime| |更新时间|
| 创建人 | create_by | String| 64 |创建人ID|
| 更新人 | update_by | datetime| 64|更新人ID|


### 评阅教师评议书

表明：gd_director_comment_book

| 属性 | 字段名 | 类型 |长度| 描述|
| :---: | :---: | :---: |:---: | :---: |
| 主键 | id | String | 64 | 任务书主键ID|
| 论文（设计）题目 | thesis_tittle| String| 255|论文题目|
| 学生 | student_id| String | 64|用户id,学生|
| 规范程度（15分）| plan_proof_score| int | 2 | 方案论证分，总分15分(能独立查阅文献和课题调研，能提出较科学、合理、可行的实施方案。)|
| 论文设计类容（30分）| thesis_design_score| int | 2 | 方案论证分，总分30分(能独立查阅文献和课题调研，能提出较科学、合理、可行的实施方案。)|
| 工作量和难度（20分）| workload_difficulty_score| int | 2| 工作量和难度分，总分20分(遵守毕业论文（设计）管理制度，按期完成任务书规定的内容，工作量饱满，有一定难度。)|
| 论文（设计)质量（20分）| thesis_quality_score| int | 2|论文设计质量，总分20分(结构合理、条理清楚、文理通顺、用语符合专业要求；文体格式规范、图表清楚。图样绘制与技术要求符合国家标准，图面质量符合要求。)|
| 创新性与应用价值（15分）| innovating_worth_score| int | 2| 论文设计质量，总分20分(具有一定的创新性和应用价值。)|
|总分（100）| total_score | int |2| 总分数|
|导师评语| director_comment | String |255| 导师评语|
| 创建时间 | update_date| datetime| |创建时间|
| 更新时间 | update_date | datetime| |更新时间|
| 创建人 | create_by | String| 64 |创建人ID|
| 更新人 | update_by | datetime| 64|更新人ID|