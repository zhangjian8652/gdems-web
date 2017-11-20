package com.sword.admin.entity;

/**
 * Created by Joker on 2017/4/4.
 */
public class ZTreeNode {
    private String id;
    private String name;
    private boolean isFirstNode;
    private boolean isParent;
    private boolean open;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isFirstNode() {
        return isFirstNode;
    }

    public void setIsFirstNode(boolean isFirstNode) {
        this.isFirstNode = isFirstNode;
    }

    public boolean isParent() {
        return isParent;
    }

    public void setIsParent(boolean isParent) {
        this.isParent = isParent;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    @Override
    public String toString() {
        return "ZTreeNode{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", isFirstNode=" + isFirstNode +
                ", isParent=" + isParent +
                ", open=" + open +
                '}';
    }
}
