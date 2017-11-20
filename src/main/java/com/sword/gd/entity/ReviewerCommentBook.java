package com.sword.gd.entity;

import com.sword.admin.entity.common.BaseEntity;

import javax.persistence.Table;

/**
 * Created by Administrator on 2017/4/24.
 */
@Table(name = "gd_reviewer_comment_book")
public class ReviewerCommentBook extends BaseEntity {

    private String thesisTittle;
    private String studentId;
    private int standardizeDegreeScore;
    private int contentQualityScore;
    private int innovatingWorthScore;
    private int totalScore;
    private String reviewerComment;

    public String getThesisTittle() {
        return thesisTittle;
    }

    public void setThesisTittle(String thesisTittle) {
        this.thesisTittle = thesisTittle;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getStandardizeDegreeScore() {
        return standardizeDegreeScore;
    }

    public void setStandardizeDegreeScore(int standardizeDegreeScore) {
        this.standardizeDegreeScore = standardizeDegreeScore;
    }

    public int getContentQualityScore() {
        return contentQualityScore;
    }

    public void setContentQualityScore(int contentQualityScore) {
        this.contentQualityScore = contentQualityScore;
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

    public String getReviewerComment() {
        return reviewerComment;
    }

    public void setReviewerComment(String reviewerComment) {
        this.reviewerComment = reviewerComment;
    }

    public int calculateTotalScore() {
        return this.standardizeDegreeScore + this.contentQualityScore + this.innovatingWorthScore;
    }
}
