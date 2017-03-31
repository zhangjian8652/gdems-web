package com.sword.gdems.web.response;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2015/12/13
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DataTableData<T> {
    private int draw;
    private int recordsTotal;
    private int recordsFiltered;
    private List<T> data;

    public DataTableData(int draw, int recordsTotal, int recordsFiltered, List<T> data) {
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
