package com.sword.gd.entity;

import com.sword.admin.entity.common.BaseEntity;

import javax.persistence.Table;

/**
 * Created by Joker on 2017/4/24.
 */
@Table(name = "gd_examination_comment_book")
public class ExaminationCommentBook extends BaseEntity {

    private String studentId;
    private int designLevelScore;
    private int designReportScore;
    private int designExaminationScore;
    private int totalScore;
    private String examinationComment;
    private int directorTotalScore;
    private int examinationTotalScore;
    private int comprehensivePerformanceScore;
    private int fiveLevelScore;

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getDesignLevelScore() {
        return designLevelScore;
    }

    public void setDesignLevelScore(int designLevelScore) {
        this.designLevelScore = designLevelScore;
    }

    public int getDesignReportScore() {
        return designReportScore;
    }

    public void setDesignReportScore(int designReportScore) {
        this.designReportScore = designReportScore;
    }

    public int getDesignExaminationScore() {
        return designExaminationScore;
    }

    public void setDesignExaminationScore(int designExaminationScore) {
        this.designExaminationScore = designExaminationScore;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public String getExaminationComment() {
        return examinationComment;
    }

    public void setExaminationComment(String examinationComment) {
        this.examinationComment = examinationComment;
    }

    public int getDirectorTotalScore() {
        return directorTotalScore;
    }

    public void setDirectorTotalScore(int directorTotalScore) {
        this.directorTotalScore = directorTotalScore;
    }

    public int getExaminationTotalScore() {
        return examinationTotalScore;
    }

    public void setExaminationTotalScore(int examinationTotalScore) {
        this.examinationTotalScore = examinationTotalScore;
    }

    public int getComprehensivePerformanceScore() {
        return comprehensivePerformanceScore;
    }

    public void setComprehensivePerformanceScore(int comprehensivePerformanceScore) {
        this.comprehensivePerformanceScore = comprehensivePerformanceScore;
    }

    public int getFiveLevelScore() {
        return fiveLevelScore;
    }

    public void setFiveLevelScore(int fiveLevelScore) {
        this.fiveLevelScore = fiveLevelScore;
    }

    public int calculateTotalScore() {
        return this.designLevelScore + this.designReportScore + this.designExaminationScore;
    }
}
