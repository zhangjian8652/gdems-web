package com.sword.gd.entity;

import com.sword.admin.entity.common.BaseEntity;

import javax.persistence.Table;

/**
 * Created by Joker on 2017/4/23.
 */
@Table(name = "gd_mid_check")
public class InterimCheckBook extends BaseEntity {

    private String studentId;
    private String thesisTittle;
    private String finish;
    private String conformance;
    private String requireFinish;
    private String finishInTime;
    private String problemsSolutions;

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

    public String getFinish() {
        return finish;
    }

    public void setFinish(String finish) {
        this.finish = finish;
    }

    public String getConformance() {
        return conformance;
    }

    public void setConformance(String conformance) {
        this.conformance = conformance;
    }

    public String getRequireFinish() {
        return requireFinish;
    }

    public void setRequireFinish(String requireFinish) {
        this.requireFinish = requireFinish;
    }

    public String getFinishInTime() {
        return finishInTime;
    }

    public void setFinishInTime(String finishInTime) {
        this.finishInTime = finishInTime;
    }

    public String getProblemsSolutions() {
        return problemsSolutions;
    }

    public void setProblemsSolutions(String problemsSolutions) {
        this.problemsSolutions = problemsSolutions;
    }
}
