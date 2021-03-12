package com.uestc.service;

import com.uestc.entity.ExcelData;

import javax.servlet.http.HttpServletResponse;
/**
 * git测试
 */
public interface IExportExcelService {
    //导出数据到excel表
    public void exportExcel(HttpServletResponse response,String fileName,ExcelData data) throws Exception;
}
