package com.uestc.service.impl;

import com.uestc.entity.ExcelData;
import com.uestc.service.IExportExcelService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.extensions.XSSFCellBorder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

@Service
public abstract class BaseExportExcelServiceImpl implements IExportExcelService {

    @Override
    public void exportExcel(HttpServletResponse response, String fileName, ExcelData data) throws Exception {
        // 告诉浏览器用什么软件可以打开此文件
        response.setHeader("content-Type", "application/vnd.ms-excel");
        // 下载文件的默认名称
        response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName, "utf-8"));
        exportExcel(data, response.getOutputStream());
    }


    private void exportExcel(ExcelData data,OutputStream out) throws Exception{
        XSSFWorkbook wb = new XSSFWorkbook();
        try{
            String sheetName = data.getSheetName();
            if(null == sheetName || sheetName.isEmpty()){
                sheetName = "sheet1";
            }
            XSSFSheet sheet = wb.createSheet(sheetName);
            writeExcel(wb,sheet,data);
            
            wb.write(out);
        }finally {
            wb.close();
            out.flush();
            out.close();
        }
    }


    /**
     * 写入excel文件
     * @param wb
     * @param sheet
     * @param data
     * a、写入title
     * b、写入row行数据
     * c、
     */
    private void writeExcel(XSSFWorkbook wb, XSSFSheet sheet, ExcelData data) {

        writeTitlesToExcel(wb, sheet, data.getTitles());
        writeRowsToExcel(wb, sheet, data.getRows(), 1);
        autoSizeColumns(sheet, data.getTitles().size() + 1);

    }

    /**
     * 将标题写入excel 返回rowNumber
     * @param wb
     * @param sheet
     * @param titles
     * @return
     */
    private void writeTitlesToExcel(XSSFWorkbook wb, XSSFSheet sheet, List<String> titles) {

        int rowIndex = 0;
        int colIndex = 0;

        Font titleFont = wb.createFont();
        titleFont.setFontName("simsun");
        titleFont.setBold(true);
        // titleFont.setFontHeightInPoints((short) 14);
        titleFont.setColor(IndexedColors.BLACK.index);

        XSSFCellStyle titleStyle = wb.createCellStyle();
        titleStyle.setAlignment(HorizontalAlignment.CENTER);
        titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        //titleStyle.setFillForegroundColor(new XSSFColor(new Color(182, 184, 192)));
       // titleStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        titleStyle.setFont(titleFont);
        setBorder(titleStyle, BorderStyle.THIN, new XSSFColor());

        Row titleRow = sheet.createRow(rowIndex);
        // titleRow.setHeightInPoints(25);
        colIndex = 0;

        for (String field : titles) {
            Cell cell = titleRow.createCell(colIndex);
            cell.setCellValue(field);
            cell.setCellStyle(titleStyle);
            colIndex++;
        }

    }


    /**
     * 将数据写入excel的row
     * @param wb
     * @param sheet
     * @param rows
     * @param rowIndex
     */

    protected abstract void writeRowsToExcel(XSSFWorkbook wb, XSSFSheet sheet, List rows, int rowIndex) ;



    private void autoSizeColumns(XSSFSheet sheet, int columnNumber) {

        for (int i = 0; i < columnNumber; i++) {
            int orgWidth = sheet.getColumnWidth(i);
            sheet.autoSizeColumn(i, true);
            int newWidth = (int) (sheet.getColumnWidth(i) + 100);
            if (newWidth > orgWidth) {
                sheet.setColumnWidth(i, newWidth);
            } else {
                sheet.setColumnWidth(i, orgWidth);
            }
        }
    }

    protected static void setBorder(XSSFCellStyle style, BorderStyle border, XSSFColor color) {
        style.setBorderTop(border);
        style.setBorderLeft(border);
        style.setBorderRight(border);
        style.setBorderBottom(border);
        style.setBorderColor(XSSFCellBorder.BorderSide.TOP, color);
        style.setBorderColor(XSSFCellBorder.BorderSide.LEFT, color);
        style.setBorderColor(XSSFCellBorder.BorderSide.RIGHT, color);
        style.setBorderColor(XSSFCellBorder.BorderSide.BOTTOM, color);
    }

    protected abstract List<String> getTitles();
}
