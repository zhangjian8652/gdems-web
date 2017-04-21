package com.sword.gd.entity;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.BaseEntity;

import java.util.Date;

/**
 * Created by Joker on 2017/4/21.
 */
public class TaskBook extends BaseEntity{
    private String clasz;
    private String student;
    private String thesisTittle;
    private String requirementContent;
    private Date sendDate;
    private Date finishDate;
    private String practiceUnits;
    private String practiceAddress;
    private int thesisPageCount;
    private int drawingPageCount;

    public String getClasz() {
        return clasz;
    }

    public void setClasz(String clasz) {
        this.clasz = clasz;
    }

    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public String getThesisTittle() {
        return thesisTittle;
    }

    public void setThesisTittle(String thesisTittle) {
        this.thesisTittle = thesisTittle;
    }

    public String getRequirementContent() {
        return requirementContent;
    }

    public void setRequirementContent(String requirementContent) {
        this.requirementContent = requirementContent;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public String getPracticeUnits() {
        return practiceUnits;
    }

    public void setPracticeUnits(String practiceUnits) {
        this.practiceUnits = practiceUnits;
    }

    public String getPracticeAddress() {
        return practiceAddress;
    }

    public void setPracticeAddress(String practiceAddress) {
        this.practiceAddress = practiceAddress;
    }

    public int getThesisPageCount() {
        return thesisPageCount;
    }

    public void setThesisPageCount(int thesisPageCount) {
        this.thesisPageCount = thesisPageCount;
    }

    public int getDrawingPageCount() {
        return drawingPageCount;
    }

    public void setDrawingPageCount(int drawingPageCount) {
        this.drawingPageCount = drawingPageCount;
    }
}
