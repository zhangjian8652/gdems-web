package com.sword.gd.entity;

import com.sword.admin.entity.common.BaseEntity;

import javax.persistence.Table;

/**
 * Created by Joker on 2017/4/23.
 */
@Table(name = "gd_director_comment_book")
public class DirectorCommentBook extends BaseEntity {
    private String studentId;
    private int planProofScore;
    private int thesisDesignScore;
    private int thesisQualityScore;
    private int workloadDifficultyScore;
    private int innovatingWorthScore;
    private int totalScore;
    private String directorComment;


    public int getThesisQualityScore() {
        return thesisQualityScore;
    }

    public void setThesisQualityScore(int thesisQualityScore) {
        this.thesisQualityScore = thesisQualityScore;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getPlanProofScore() {
        return planProofScore;
    }

    public void setPlanProofScore(int planProofScore) {
        this.planProofScore = planProofScore;
    }

    public int getThesisDesignScore() {
        return thesisDesignScore;
    }

    public void setThesisDesignScore(int thesisDesignScore) {
        this.thesisDesignScore = thesisDesignScore;
    }

    public int getWorkloadDifficultyScore() {
        return workloadDifficultyScore;
    }

    public void setWorkloadDifficultyScore(int workloadDifficultyScore) {
        this.workloadDifficultyScore = workloadDifficultyScore;
    }

    public int getInnovatingWorthScore() {
        return innovatingWorthScore;
    }

    public void setInnovatingWorthScore(int innovatingWorthScore) {
        this.innovatingWorthScore = innovatingWorthScore;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public String getDirectorComment() {
        return directorComment;
    }

    public void setDirectorComment(String directorComment) {
        this.directorComment = directorComment;
    }

    public int calculateTotalScre() {
        return this.planProofScore + this.thesisDesignScore + this.workloadDifficultyScore + this.thesisQualityScore + this.innovatingWorthScore;
    }

}
