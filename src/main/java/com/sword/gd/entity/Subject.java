package com.sword.gd.entity;

import com.sword.admin.entity.common.BaseEntity;
import org.apache.ibatis.annotations.Arg;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Joker on 2017/4/15.
 */
@Table(name = "gd_subject")
public class Subject extends BaseEntity implements Serializable {
    @NotEmpty
    private String tittle;
    @NotEmpty
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fromDate;
    @NotEmpty
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    @NotEmpty
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date graduationDate;
    @NotEmpty
    private String sourceFrom;
    @NotEmpty
    private String type;
    private String requirement;
    private String mainTask;
    private String status;
    private String verifyBy;
    private Date verifyDate;
    private String chooseBy;
    private Date chooseDate;
    private String chooseStatus;

    public String getChooseStatus() {
        return chooseStatus;
    }

    public void setChooseStatus(String chooseStatus) {
        this.chooseStatus = chooseStatus;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getGraduationDate() {
        return graduationDate;
    }

    public void setGraduationDate(Date graduationDate) {
        this.graduationDate = graduationDate;
    }

    public String getSourceFrom() {
        return sourceFrom;
    }

    public void setSourceFrom(String sourceFrom) {
        this.sourceFrom = sourceFrom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getMainTask() {
        return mainTask;
    }

    public void setMainTask(String mainTask) {
        this.mainTask = mainTask;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVerifyBy() {
        return verifyBy;
    }

    public void setVerifyBy(String verifyBy) {
        this.verifyBy = verifyBy;
    }

    public Date getVerifyDate() {
        return verifyDate;
    }

    public void setVerifyDate(Date verifyDate) {
        this.verifyDate = verifyDate;
    }

    public String getChooseBy() {
        return chooseBy;
    }

    public void setChooseBy(String chooseBy) {
        this.chooseBy = chooseBy;
    }

    public Date getChooseDate() {
        return chooseDate;
    }

    public void setChooseDate(Date chooseDate) {
        this.chooseDate = chooseDate;
    }


    public static class ChooseStatus {
        public static String NONE_CHOOSE = "NONE_CHOOSE";
        public static String CHOOSE = "CHOOSE";
        public static String APPROVED = "APPROVED";
        public static String DENIED = "DENIED";
    }

    public static class Status {
      public static String  CREATED = "CREATED";
      public static String APPROVED = "APPROVED";
      public static String DENIED = "DENIED";
    }

}
