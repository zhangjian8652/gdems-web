package com.sword.admin.request.entity;

import com.sword.admin.entity.ZTreeNode;

import java.util.List;

/**
 * Created by Joker on 2017/4/4.
 */
public class ZTreeNodes {
    private List<ZTreeNode> zTreeNodes;

    public ZTreeNodes() {
    }

    public ZTreeNodes(List<ZTreeNode> zTreeNodes) {
        this.zTreeNodes = zTreeNodes;
    }

    public List<ZTreeNode> getzTreeNodes() {
        return zTreeNodes;
    }

    public void setzTreeNodes(List<ZTreeNode> zTreeNodes) {
        this.zTreeNodes = zTreeNodes;
    }
}
