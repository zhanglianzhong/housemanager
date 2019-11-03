package com.uestc.service.impl;

import com.uestc.entity.TenantInfo;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Service
public class TenantInfoExportExcelServiceImpl extends BaseExportExcelServiceImpl{


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
        List<TenantInfo> rowsData = (List<TenantInfo>) rows;

        for (TenantInfo rowData : rowsData) {
            Row dataRow = sheet.createRow(rowIndex);
            // dataRow.setHeightInPoints(25);
            Cell cell0 = dataRow.createCell(0);
            cell0.setCellValue(rowData.getTenantName());
            cell0.setCellStyle(dataStyle);


            Cell cell1 = dataRow.createCell(1);
            cell1.setCellValue(rowData.getRoomName());
            cell1.setCellStyle(dataStyle);


            Cell cell2 = dataRow.createCell(2);
            cell2.setCellValue(rowData.getTenantDate());
            cell2.setCellStyle(dataStyle);


            Cell cell3 = dataRow.createCell(3);
            cell3.setCellValue(rowData.getContractDuration());
            cell3.setCellStyle(dataStyle);


            Cell cell4 = dataRow.createCell(4);
            cell4.setCellValue(rowData.getIdentityCardNum());
            cell4.setCellStyle(dataStyle);

            Cell cell5 = dataRow.createCell(5);
            cell5.setCellValue(rowData.getTelephone());
            cell5.setCellStyle(dataStyle);


            Cell cell6 = dataRow.createCell(6);
            cell6.setCellValue(rowData.getAge());
            cell6.setCellStyle(dataStyle);


            Cell cell7 = dataRow.createCell(7);
            if(rowData.getSex().equals("M")){
                cell7.setCellValue("男");
            }else {
                cell7.setCellValue("女");
            }
            cell7.setCellStyle(dataStyle);


            Cell cell8 = dataRow.createCell(8);
            if(1==rowData.getTenantState()){
                cell8.setCellValue("已入住");
            }else {
                cell8.setCellValue("未入住");
            }
            cell8.setCellStyle(dataStyle);

            Cell cell9 = dataRow.createCell(9);
            cell9.setCellValue(rowData.getNote());
            cell9.setCellStyle(dataStyle);

            rowIndex++;
        }


    }

    @Override
    public List<String> getTitles() {
        List<String> titles = new ArrayList<>();
        titles.add("租户姓名");
        titles.add("房间编号");
        titles.add("入住时间");
        titles.add("租房合同期限 (月)");
        titles.add("身份证号");
        titles.add("手机号码");
        titles.add("年龄");
        titles.add("性别");
        titles.add("租住状态");
        titles.add("备注信息");
        return titles;
    }


    private String bigDecimalToString(BigDecimal data){
        return null==data?"":data.toString();
    }

    private String intToString(Integer data){
       return null==data?"":data.toString();
    }
}
