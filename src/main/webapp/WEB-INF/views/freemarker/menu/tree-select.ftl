<div id="tree" class="ztree">
</div>

<script type="text/javascript">
  $(function(){
        //菜单树开始
        var url = $path + "/menu/list";

        var setting = {
            view:{
                selectedMulti:false,
                dblClickExpand:true
            },
            async: {
                enable: true,
                url:url,
                type: "post",
                autoParam:["id"],
                otherParam:{"chk":"chk"},
                dataFilter: dataFilter
            },
//        edit:{
//            enable:true,
//            showRemoveBtn:true,
//            showRenameBtn:true,
//            renameTittle:"编辑",
//            removeTittle:"删除",
//        },
//            view: {
//                fontCss:""
//            },
            check: {
                enable: false,
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
                onRename:zTreeOnRename,
            //    onDblClick:zTreeOnDblClick,
                onClick:zTreeOnClick,
            }
        };

        function zTreeOnDblClick(event, treeId, treeNode) {
            selectedNode = treeNode;
            setSelectedValue()
        }
      function zTreeOnClick(event, treeId, treeNode) {
            selectedNode = treeNode;
        }

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
            var zTree = $.fn.zTree.getZTreeObj("tree");
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
                id:"${menu.id!}",
                name:"${menu.name!}",
                halfCheck:true,
                checked:false,
                isParent:true,
        }
        [/#list]
        [/#if]
        [/@menu]
        ];

        if(zNodes.length > 0){
            treeObj = $.fn.zTree.init($("#tree"), setting, zNodes);
        }

    });

</script>