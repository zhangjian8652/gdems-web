<div class="box box-success">
            <div class="box-header">
                <i class="fa fa-th"></i>
                <h3 class="box-title">机构树列表</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-6 ">
                        <div style="min-height: 400px;">
                            <ul id="privilege-tree" class="ztree"></ul>
                        </div>

                    </div>
                </div>

            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer -->
        </div>
        <!-- /.box -->


<script type="text/javascript">


    $(function(){
        var url = $path + "/organization/list";

        var setting = {
            async: {
                enable: true,
                url:url,
                type: "post",
                autoParam:["id"],
                otherParam:{"chk":"chk"},
                dataFilter: dataFilter
            },
            edit:{
                enable:true,
                showRemoveBtn:true,
                showRenameBtn:true,
                renameTittle:"编辑",
                removeTittle:"删除",
            },
//            view: {
//                fontCss:""
//            },
            check: {
                enable: true,
                autoCheckTrigger: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck,
                onAsyncSuccess: onAsyncSuccess,
                beforeRemove: zTreeBeforeRemove,
                onRemove: zTreeOnRemove,
                onRename:zTreeOnRename
            }
        };
        function dataFilter(treeId, parentNode, childNodes) {
            if (parentNode.checkedEx === true) {
                for(var i=0, l=childNodes.length; i<l; i++) {
                    childNodes[i].checked = parentNode.checked;
                    childNodes[i].halfCheck = false;
                    childNodes[i].checkedEx = true;
                }
            }
            return childNodes;
        }
        function onCheck(event, treeId, treeNode) {
            cancelHalf(treeNode)
            treeNode.checkedEx = true;
        }
        function onAsyncSuccess(event, treeId, treeNode, msg) {
            cancelHalf(treeNode);
        }
        function cancelHalf(treeNode) {
            if (treeNode.checkedEx) return;
            var zTree = $.fn.zTree.getZTreeObj("privilege-tree");
            treeNode.halfCheck = false;
            zTree.updateNode(treeNode);
        }

        function zTreeBeforeRemove() {

        }
        function zTreeOnRemove(event, treeId, treeNode) {

        }
        function zTreeOnRename(event, treeId, treeNode, isCancel) {

        };

        var zNodes =
                [
                    [@menu parentId="" type="LIST";list]
        [#if list?? && list?size > 0]
        [#list list as menu]
        [#if menu_index > 0]
        ,
        [/#if]
        {
            id:"${menu.id}",
                    name:"${menu.name}",
                halfCheck:true,
                checked:false,
                isParent:true
        }
        [/#list]
        [/#if]

        [/@menu]
        ];

        $.fn.zTree.init($("#privilege-tree"), setting, zNodes);
    });


</script>
