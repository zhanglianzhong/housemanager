package com.uestc.controller;

import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.ComponentInfo;
import com.uestc.entity.ExcelData;
import com.uestc.service.IComponentInfoService;
import com.uestc.service.impl.ComponentInfoExportExcelServiceImpl;
import com.uestc.service.impl.ComponentInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */

@Controller
@RequestMapping("/exportExcel")
public class ExportExcelController extends SuperController {
    @Autowired
    private ComponentInfoExportExcelServiceImpl componentInfoExportExcelService;
    @Autowired
    private IComponentInfoService componentInfoService;

    @RequestMapping("/componentsInfo")
    public void exportComponentInfoExcel(HttpServletResponse response) throws Exception{
        List<ComponentInfo> dataList = componentInfoService.selectList(null);

        ExcelData<ComponentInfo> excelData = new ExcelData<>();
        excelData.setSheetName("元器件库存信息");
        excelData.setTitles(componentInfoExportExcelService.getTitles());
        excelData.setRows(dataList);

        componentInfoExportExcelService.exportExcel(response,"元器件库存信息.xlsx",excelData);


    }



}
