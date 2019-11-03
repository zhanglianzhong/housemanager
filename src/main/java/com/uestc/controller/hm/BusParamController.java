package com.uestc.controller.hm;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.uestc.common.anno.Log;
import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.BusParam;
import com.uestc.entity.SysSetting;
import com.uestc.service.IBusParamService;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 系统设置表 前端控制器
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-19
 */
@Controller
@RequestMapping("/hm/businessParam")
public class BusParamController extends SuperController {


    @Autowired
    private IBusParamService busParamService;

    /**
     * 查询系统设置
     */
    @RequiresPermissions("listBusParam")
    @RequestMapping("/page")
    public  String page(Model model){

        List<BusParam> list =  busParamService.selectList(new EntityWrapper<BusParam>().orderBy("sort",true));
        model.addAttribute("list",list);
        return "rentManager/bussiness/page";
    }



    @RequiresPermissions("doBusParamSetting")
    @Log("更新业务参数设置")
    @RequestMapping("/doSetting")
    @ResponseBody
    public Rest doSetting(String[] id, String[] sysValue){

        List<BusParam> sysSettings = new ArrayList<BusParam>();
        if(ArrayUtils.isNotEmpty(id)){
            for(int i=0;i<id.length;i++){
                BusParam setting = new BusParam();
                setting.setId(id[i]);
                setting.setSysValue(sysValue[i]);
                sysSettings.add(setting);
            }
        }
        boolean success = busParamService.updateBatchById(sysSettings);
        if(success){
            return Rest.ok("更新业务参数成功！");
        }else {
            return Rest.failure("更新业务参数失败！");
        }

    }

}
