package com.uestc.controller;

import com.uestc.common.controller.SuperController;
import com.uestc.entity.ExcelData;
import com.uestc.entity.PropertyInfo;
import com.uestc.entity.RoomInfo;
import com.uestc.entity.TenantInfo;
import com.uestc.service.IPropertyInfoService;
import com.uestc.service.IRoomInfoService;
import com.uestc.service.ITenantInfoService;
import com.uestc.service.impl.PropertyInfoExportExcelServiceImpl;
import com.uestc.service.impl.RoomInfoExportExcelServiceImpl;
import com.uestc.service.impl.TenantInfoExportExcelServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 */

@Controller
@RequestMapping("/exportExcel")
public class ExportExcelController extends SuperController {

    @Autowired
    private RoomInfoExportExcelServiceImpl roomInfoExportExcelService;

    @Autowired
    private TenantInfoExportExcelServiceImpl tenantInfoExportExcelService;

    @Autowired
    private PropertyInfoExportExcelServiceImpl propertyInfoExportExcelService;


    @Autowired
    private IRoomInfoService roomInfoService;

    @Autowired
    private ITenantInfoService tenantInfoService;

    @Autowired
    private IPropertyInfoService propertyInfoService;


    @RequestMapping("/roomInfo")
    public void exportRoomInfoExcel(HttpServletResponse response) throws Exception{
        List<RoomInfo> dataList = roomInfoService.selectList(null);

        ExcelData<RoomInfo> excelData = new ExcelData<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        String dateTime = sdf.format(new Date());
        excelData.setSheetName("房间信息");
        excelData.setTitles(roomInfoExportExcelService.getTitles());
        excelData.setRows(dataList);

        roomInfoExportExcelService.exportExcel(response,"房间信息"+dateTime+".xlsx",excelData);
    }

    @RequestMapping("/tenantInfo")
    public void exportTenantInfoExcel(HttpServletResponse response) throws Exception{
        List<TenantInfo> dataList = tenantInfoService.selectList(null);

        ExcelData<TenantInfo> excelData = new ExcelData<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        String dateTime = sdf.format(new Date());
        excelData.setSheetName("租客信息");
        excelData.setTitles(tenantInfoExportExcelService.getTitles());
        excelData.setRows(dataList);

        tenantInfoExportExcelService.exportExcel(response,"租客信息"+dateTime+".xlsx",excelData);
    }


    @RequestMapping("/propertyInfo")
    public void exportPropertyInfoExcel(HttpServletResponse response) throws Exception{
        List<PropertyInfo> dataList = propertyInfoService.selectList(null);

        ExcelData<PropertyInfo> excelData = new ExcelData<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        String dateTime = sdf.format(new Date());
        excelData.setSheetName("水电信息");
        excelData.setTitles(propertyInfoExportExcelService.getTitles());
        excelData.setRows(dataList);

        propertyInfoExportExcelService.exportExcel(response,"水电信息"+dateTime+".xlsx",excelData);
    }

}
