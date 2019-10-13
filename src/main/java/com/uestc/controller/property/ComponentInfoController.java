package com.uestc.controller.property;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Lists;
import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.ComponentInfo;
import com.uestc.entity.SysRole;
import com.uestc.entity.SysUser;
import com.uestc.entity.SysUserRole;
import com.uestc.mapper.ISequenceDao;
import com.uestc.service.IComponentInfoService;
import com.uestc.service.impl.OutStockFormServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 元器件库存信息表 前端控制器
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-05-30
 */
@Controller
@RequestMapping("/property/componentsInfo")
public class ComponentInfoController extends SuperController {

    private Logger logger = LoggerFactory.getLogger(ComponentInfoController.class);

    @Autowired
    private IComponentInfoService componentInfoService;

    @Autowired
    private ISequenceDao iSequenceDao;

    @Autowired
    private OutStockFormServiceImpl outStockFormService;

    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue="15") Integer pageSize,  Model model){
        model.addAttribute("pageSize", pageSize);
        Page<ComponentInfo> page = getPage(pageNumber,pageSize);
        Page<ComponentInfo> pageData = componentInfoService.selectPage(page);
        model.addAttribute("pageData", pageData);
        return "/property/listComponentStock";
    }


    /**
     * 显示元器件库存详情
     */
    @RequestMapping("/detail/{id}")
    //@RequiresPermissions("detailComponentInfo")
    public  String showDetail(@PathVariable String id,Model model){
        ComponentInfo componentInfo = componentInfoService.selectById(id);
        model.addAttribute("componentInfoDetail",componentInfo);
        return "/property/detail";
    }





    /**
     * 元器件入库界面访问
     */
    @RequestMapping("/add")
    //@RequiresPermissions("addComponentInfo")
    public  String addComponent(){


        return "/property/add";
    }


    /**
     * 元器件库存信息修改界面访问
     */
    @RequestMapping("/update/{id}")
    //@RequiresPermissions("addComponentInfo")
    public  String updateComponent(@PathVariable String id, Model model){

        ComponentInfo componentInfo = componentInfoService.selectById(id);
        model.addAttribute("componentInfoDetail",componentInfo);
        return "/property/edit";
    }

    /**
     * 元器件库存信息修改
     */
    @RequestMapping("/doEdit")
    @ResponseBody
    //@RequiresPermissions("addComponentInfo")
    public  Rest doUpdateComponent(ComponentInfo componentInfo){

        componentInfoService.updateById(componentInfo);
        return Rest.ok();
    }

    /**
     * 元器件入库
     */
    @RequestMapping("/doAddComponent")
    //@RequiresPermissions("addComponentInfo")
    @ResponseBody
    public  Rest doAddComponentInfo(ComponentInfo componentInfo){

        int nextVal = iSequenceDao.getComponentSeqNum();

        logger.debug("获取到的最新流水号："+nextVal);

        SimpleDateFormat sdfDateTime=new SimpleDateFormat("yyyyMMddhhmmss");
        componentInfo.setRegDateTime(sdfDateTime.format(new Date()));

        //拼接元器件id
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyyMMdd");
        String date = sdfDate.format(new Date());


        String netValStr = String.format("%05d",nextVal);
        String componentId = date+netValStr;

        componentInfo.setId(componentId);
        componentInfoService.insert(componentInfo);
        return Rest.ok();
    }


    /**
     * 访问元器件出库页面
     *
     */

    @RequestMapping("/outStock/{id}")
    public String componentOutStock(@PathVariable String id,Model model){
        //获取出库清单编号
        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        String outStockFormId = componentInfoService.queryOutStockFormId(user.getUserName());
        ComponentInfo componentInfo = componentInfoService.selectById(id);
        model.addAttribute("outStockFormId",outStockFormId);
        model.addAttribute("componentInfoDetail",componentInfo);
        return "property/outStock";
    }
}
