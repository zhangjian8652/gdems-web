package com.sword.gd.entity;

import com.sword.admin.entity.Organization;
import com.sword.admin.entity.User;

/**
 * Created by Joker on 2017/4/22.
 */
public class MySubjectStudent {
    private User student;
    private User director;
    private Organization department;
    private Organization major;
    private Organization clasz;
    private Subject subject;


    public User getDirector() {
        return director;
    }

    public void setDirector(User director) {
        this.director = director;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public Organization getDepartment() {
        return department;
    }

    public void setDepartment(Organization department) {
        this.department = department;
    }

    public Organization getMajor() {
        return major;
    }

    public void setMajor(Organization major) {
        this.major = major;
    }

    public Organization getClasz() {
        return clasz;
    }

    public void setClasz(Organization clasz) {
        this.clasz = clasz;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
}
