package com.uestc.service.impl;

import com.uestc.entity.RoomInfo;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Service
public class RoomInfoExportExcelServiceImpl extends BaseExportExcelServiceImpl{


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
        List<RoomInfo> rowsData = (List<RoomInfo>) rows;

        for (RoomInfo rowData : rowsData) {
            Row dataRow = sheet.createRow(rowIndex);
            // dataRow.setHeightInPoints(25);
            Cell cell0 = dataRow.createCell(0);
            cell0.setCellValue(rowData.getRoomName());
            cell0.setCellStyle(dataStyle);


            Cell cell1 = dataRow.createCell(1);
            if(rowData.getRoomType().equals("10")){
                cell1.setCellValue("单间");
            }else if(rowData.getRoomType().equals("11")){
                cell1.setCellValue("一室一厅");
            }else if(rowData.getRoomType().equals("21")){
                cell1.setCellValue("两室一厅");
            }else if(rowData.getRoomType().equals("31")){
                cell1.setCellValue("三室一厅");
            }else {
                cell1.setCellValue("未知房型");
            }

            cell1.setCellStyle(dataStyle);


            Cell cell2 = dataRow.createCell(2);
            cell2.setCellValue(rowData.getApplication());
            cell2.setCellStyle(dataStyle);


            Cell cell3 = dataRow.createCell(3);
            cell3.setCellValue(rowData.getSize());
            cell3.setCellStyle(dataStyle);


            Cell cell4 = dataRow.createCell(4);
            cell4.setCellValue(rowData.getOrientation());
            cell4.setCellStyle(dataStyle);

            Cell cell5 = dataRow.createCell(5);
            if (rowData.getState() == 1) {
                cell5.setCellValue("已出租");
            }else{
                cell5.setCellValue("未出租");
            }
            cell5.setCellStyle(dataStyle);


            Cell cell6 = dataRow.createCell(6);
            cell6.setCellValue(rowData.getAppendix());
            cell6.setCellStyle(dataStyle);


            Cell cell7 = dataRow.createCell(7);
            cell7.setCellValue(rowData.getHouseAppliances());
            cell7.setCellStyle(dataStyle);


            Cell cell8 = dataRow.createCell(8);

            cell8.setCellValue(bigDecimalToString(rowData.getRental()));
            cell8.setCellStyle(dataStyle);

            Cell cell9 = dataRow.createCell(9);
            if(rowData.getRentPatten()==1){
                cell9.setCellValue("押一付一");
            }else if(rowData.getRentPatten()==2){
                cell9.setCellValue("押二付一");
            }else {
                cell9.setCellValue("自定义");
            }
            cell9.setCellStyle(dataStyle);


            Cell cell10 = dataRow.createCell(10);
            cell10.setCellValue(bigDecimalToString(rowData.getDeposit()));
            cell10.setCellStyle(dataStyle);

            Cell cell11 = dataRow.createCell(11);
            cell11.setCellValue(bigDecimalToString(rowData.getNetPrice()));
            cell11.setCellStyle(dataStyle);

            Cell cell12 = dataRow.createCell(12);
            if(rowData.getHasLift()==1){
                cell12.setCellValue("是");
            }else {
                cell12.setCellValue("否");
            }
            cell12.setCellStyle(dataStyle);

            rowIndex++;
        }


    }

    @Override
    public List<String> getTitles() {
        List<String> titles = new ArrayList<>();
        titles.add("房间号");
        titles.add("房型");
        titles.add("用途");
        titles.add("房间面积(平方米)");
        titles.add("朝向");
        titles.add("出租状态");
        titles.add("配套设施");
        titles.add("家用电器");
        titles.add("租金");
        titles.add("押付模式");
        titles.add("押金");
        titles.add("网费");
        titles.add("是否电梯房");
        return titles;
    }


    private String bigDecimalToString(BigDecimal data){
        return null==data?"":data.toString();
    }

    private String intToString(Integer data){
       return null==data?"":data.toString();
    }
}
