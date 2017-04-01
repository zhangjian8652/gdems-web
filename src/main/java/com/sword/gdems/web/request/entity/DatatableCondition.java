package com.sword.gdems.web.request.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.annotation.Nonnull;

/**
 * Created by Joker on 2017/4/1.
 */
public class DatatableCondition {

    @NotEmpty
    private Integer start;
    @NotEmpty
    private Integer length;
    private String searchValue;
    private Integer draw;

    public DatatableCondition(Integer start, Integer length, String searchValue) {
        this.start = start;
        this.length = length;
        this.searchValue = searchValue;
    }

    public DatatableCondition(Integer start, Integer length, String searchValue, Integer draw) {
        this.start = start;
        this.length = length;
        this.searchValue = searchValue;
        this.draw = draw;
    }

    public DatatableCondition() {
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }
}


