package com.uestc.service.impl;

import com.uestc.entity.PropertyInfo;
import com.uestc.entity.TenantInfo;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service
public class PropertyInfoExportExcelServiceImpl extends BaseExportExcelServiceImpl{


    @Override
    protected void writeRowsToExcel(XSSFWorkbook wb, XSSFSheet sheet, List rows, int rowIndex) {
        int colIndex = 0;

        Font dataFont = wb.createFont();
        dataFont.setFontName("simsun");
        // dataFont.setFontHeightInPoints((short) 14);
        dataFont.setColor(IndexedColors.BLACK.index);

        XSSFCellStyle dataStyle = wb.createCellStyle();
        dataStyle.setAlignment(HorizontalAlignment.CENTER);
        dataStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        dataStyle.setFont(dataFont);
      //  setBorder(dataStyle, BorderStyle.THIN, new XSSFColor(new Color(0, 0, 0)));
        List<PropertyInfo> rowsData = (List< PropertyInfo>) rows;

        for (PropertyInfo rowData : rowsData) {
            Row dataRow = sheet.createRow(rowIndex);
            // dataRow.setHeightInPoints(25);
            Cell cell0 = dataRow.createCell(0);
            cell0.setCellValue(rowData.getRoomName());
            cell0.setCellStyle(dataStyle);


            Cell cell1 = dataRow.createCell(1);
            cell1.setCellValue(rowData.getMonth());
            cell1.setCellStyle(dataStyle);


            Cell cell2 = dataRow.createCell(2);
            cell2.setCellValue(rowData.getWaterNum());
            cell2.setCellStyle(dataStyle);


            Cell cell3 = dataRow.createCell(3);
            cell3.setCellValue(rowData.getElectricNum());
            cell3.setCellStyle(dataStyle);


            Cell cell4 = dataRow.createCell(4);
            cell4.setCellValue(dateToString(rowData.getRecordDateTime()));
            cell4.setCellStyle(dataStyle);

            Cell cell5 = dataRow.createCell(5);
            cell5.setCellValue(rowData.getVersion());
            cell5.setCellStyle(dataStyle);

            rowIndex++;
        }


    }

    @Override
    public List<String> getTitles() {
        List<String> titles = new ArrayList<>();
        titles.add("房间编号");
        titles.add("所属年月");
        titles.add("当前用水量(吨)");
        titles.add("当前用电量(度)");
        titles.add("记录时间");
        titles.add("版本号");
        return titles;
    }


    private String bigDecimalToString(BigDecimal data){
        return null==data?"":data.toString();
    }

    private String intToString(Integer data){
       return null==data?"":data.toString();
    }

    private String dateToString(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        return null==date?"":sdf.format(date);
    }
}
