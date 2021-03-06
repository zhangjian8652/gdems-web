package com.sword.admin.response;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;

/**
 * @Author zhengzhe
 * @Date 2015/12/13
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DataTablePage<T> {
    private int draw;
    private long recordsTotal;
    private long recordsFiltered;
    private List<T> data;

    public DataTablePage(int draw, long recordsTotal, long recordsFiltered, List<T> data) {
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
    }

    public DataTablePage() {
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

    public long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
