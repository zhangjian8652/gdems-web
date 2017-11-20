package com.sword.gd.entity;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Table;
import java.util.Date;

/**
 * Created by Joker on 2017/4/21.
 */
@Table(name = "gd_taskbook")
public class TaskBook extends BaseEntity{
    private String studentId;
    private String thesisTittle;
    private String professionalSubject;
    private String requirementContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sendDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date finishDate;
    private String practiceUnits;
    private String practiceAddress;
    private Integer thesisPageCount;
    private Integer drawingPageCount;

    public String getProfessionalSubject() {
        return professionalSubject;
    }

    public void setProfessionalSubject(String professionalSubject) {
        this.professionalSubject = professionalSubject;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
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

    public Integer getDrawingPageCount() {
        return drawingPageCount;
    }

    public void setDrawingPageCount(Integer drawingPageCount) {
        this.drawingPageCount = drawingPageCount;
    }

    public Integer getThesisPageCount() {
        return thesisPageCount;
    }

    public void setThesisPageCount(Integer thesisPageCount) {
        this.thesisPageCount = thesisPageCount;
    }
}
