package com.uestc.entity;

import java.io.Serializable;
import java.util.List;

public class ExcelData<T> implements Serializable {

    private static final long serialVersionUID = 4444017239100620999L;

    //sheet名称
    private String sheetName;

    //表头
    private List<String> titles;

    //数据
    private List<T> rows;

    public String getSheetName() {
        return sheetName;
    }

    public void setSheetName(String sheetName) {
        this.sheetName = sheetName;
    }

    public List<String> getTitles() {
        return titles;
    }

    public void setTitles(List<String> titles) {
        this.titles = titles;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
