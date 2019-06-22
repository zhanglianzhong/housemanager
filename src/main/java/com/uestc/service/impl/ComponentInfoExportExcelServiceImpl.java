package com.uestc.service.impl;

import com.uestc.entity.ComponentInfo;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Service
public class ComponentInfoExportExcelServiceImpl  extends BaseExportExcelServiceImpl{


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
        List<ComponentInfo> rowsData = (List<ComponentInfo>) rows;

        for (ComponentInfo rowData : rowsData) {
            Row dataRow = sheet.createRow(rowIndex);
            // dataRow.setHeightInPoints(25);
            Cell cell0 = dataRow.createCell(0);
            cell0.setCellValue(rowData.getId());
            cell0.setCellStyle(dataStyle);


            Cell cell1 = dataRow.createCell(1);
            cell1.setCellValue(rowData.getCompType());
            cell1.setCellStyle(dataStyle);


            Cell cell2 = dataRow.createCell(2);
            cell2.setCellValue(rowData.getPurBatchNum());
            cell2.setCellStyle(dataStyle);


            Cell cell3 = dataRow.createCell(3);
            cell3.setCellValue(rowData.getTypeDesc());
            cell3.setCellStyle(dataStyle);


            Cell cell4 = dataRow.createCell(4);
            cell4.setCellValue(bigDecimalToString(rowData.getStandValue()));
            cell4.setCellStyle(dataStyle);

            Cell cell5 = dataRow.createCell(5);
            cell5.setCellValue(bigDecimalToString(rowData.getErrorValue()));
            cell5.setCellStyle(dataStyle);


            Cell cell6 = dataRow.createCell(6);
            cell6.setCellValue(rowData.getCapsulation());
            cell6.setCellStyle(dataStyle);


            Cell cell7 = dataRow.createCell(7);
            cell7.setCellValue(bigDecimalToString(rowData.getRatedOperaVol()));
            cell7.setCellStyle(dataStyle);


            Cell cell8 = dataRow.createCell(8);

            cell8.setCellValue(bigDecimalToString(rowData.getRatedOperaCur()));
            cell8.setCellStyle(dataStyle);

            Cell cell9 = dataRow.createCell(9);
            cell9.setCellValue(bigDecimalToString(rowData.getMaxOperaVol()));
            cell9.setCellStyle(dataStyle);


            Cell cell10 = dataRow.createCell(10);
            cell10.setCellValue(bigDecimalToString(rowData.getMaxOperaCur()));
            cell10.setCellStyle(dataStyle);

            Cell cell11 = dataRow.createCell(11);
            cell11.setCellValue(bigDecimalToString(rowData.getQualityFactor()));
            cell11.setCellStyle(dataStyle);

            Cell cell12 = dataRow.createCell(12);
            cell12.setCellValue(bigDecimalToString(rowData.getPowerFactor()));
            cell12.setCellStyle(dataStyle);


            Cell cell13 = dataRow.createCell(13);
            cell13.setCellValue(bigDecimalToString(rowData.getOpeImpedance()));
            cell13.setCellStyle(dataStyle);

            Cell cell14 = dataRow.createCell(14);
            cell14.setCellValue(rowData.getQualityInStock());
            cell14.setCellStyle(dataStyle);


            Cell cell15 = dataRow.createCell(15);
            cell15.setCellValue(rowData.getCabinetNum());
            cell15.setCellStyle(dataStyle);


            Cell cell16 = dataRow.createCell(16);
            cell16.setCellValue(rowData.getBoxNum());
            cell16.setCellStyle(dataStyle);

            Cell cell17 = dataRow.createCell(17);
            cell17.setCellValue(rowData.getPurChanel());
            cell17.setCellStyle(dataStyle);

            Cell cell18 = dataRow.createCell(18);
            cell18.setCellValue(rowData.getPurName());
            cell18.setCellStyle(dataStyle);

            Cell cell19 = dataRow.createCell(19);
            cell19.setCellValue(rowData.getPurTelphone());
            cell19.setCellStyle(dataStyle);

            Cell cell20 = dataRow.createCell(20);
            cell20.setCellValue(bigDecimalToString(rowData.getUnitPrice()));
            cell20.setCellStyle(dataStyle);

            Cell cell21 = dataRow.createCell(21);
            cell21.setCellValue(rowData.getPurDate());
            cell21.setCellStyle(dataStyle);

            Cell cell22 = dataRow.createCell(22);
            cell22.setCellValue(rowData.getSupplyName());
            cell22.setCellStyle(dataStyle);

            Cell cell23 = dataRow.createCell(23);
            cell23.setCellValue(rowData.getSupplyTelphone());
            cell23.setCellStyle(dataStyle);

            Cell cell24 = dataRow.createCell(24);
            cell24.setCellValue(rowData.getSupplyAddress());
            cell24.setCellStyle(dataStyle);

            Cell cell25 = dataRow.createCell(25);
            cell25.setCellValue(rowData.getRegDateTime());
            cell25.setCellStyle(dataStyle);

            rowIndex++;
        }


    }

    @Override
    public List<String> getTitles() {
        List<String> titles = new ArrayList<>();
        titles.add("元器件id");
        titles.add("元器件类型");
        titles.add("购买批次号");
        titles.add("型号");
        titles.add("标称数值");
        titles.add("允许误差（±%）");
        titles.add("封装");
        titles.add("额定工作电压（V）");
        titles.add("额定工作电流(m A)");
        titles.add("最高工作电压（V）");
        titles.add("最高工作电流（mA）");
        titles.add("品质因数");
        titles.add("功率因数");
        titles.add("工作阻抗");
        titles.add("库存数量");
        titles.add("存放柜子编号");
        titles.add("存放盒子编号");
        titles.add("采购渠道");
        titles.add("采购人");
        titles.add("采购人联系方式");
        titles.add("采购单价");
        titles.add("采购日期");
        titles.add("供货商名称");
        titles.add("供货商联系方式");
        titles.add("供货商地址");
        titles.add("登记日期时间");
        return titles;
    }


    private String bigDecimalToString(BigDecimal data){
        return null==data?"":data.toString();
    }

    private String intToString(Integer data){
       return null==data?"":data.toString();
    }
}
