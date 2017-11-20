package com.sword.gd.entity;

import javax.validation.constraints.Digits;

/**
 * Created by Joker on 2017/4/16.
 */
public class SubjectConfig {

    @Digits(integer = 2,fraction = 0)
    private int studentNum;


    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }


}
