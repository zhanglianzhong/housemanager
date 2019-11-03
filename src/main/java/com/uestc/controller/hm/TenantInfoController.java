package com.uestc.controller.hm;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.common.anno.Log;
import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.RoomInfo;
import com.uestc.entity.TenantInfo;
import com.uestc.service.IRoomInfoService;
import com.uestc.service.ITenantInfoService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * <p>
 * 租户信息表 前端控制器
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
@Controller
@RequestMapping("/hm/tenantManager")
public class TenantInfoController  extends SuperController {
    @Autowired
    ITenantInfoService tenantInfoService;

    @Autowired
    IRoomInfoService roomInfoService;

    /**
     * 分页查询租客信息
     */
    //@RequiresPermissions("listUser")
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue="15") Integer pageSize, String search, Model model){
        if(StringUtils.isNotBlank(search)){
            model.addAttribute("search", search);
        }
        Page<Map<Object, Object>> page = getPage(pageNumber,pageSize);
        model.addAttribute("pageSize", pageSize);
        Page<Map<Object, Object>> pageData = tenantInfoService.selectTenantInfoPage(page, search);
        model.addAttribute("pageData", pageData);
        return "rentManager/tenant/list";
    }


    /**
     * 编辑租客信息
     */
    @RequestMapping("/edit/{tenantId}")
    @RequiresPermissions("editTenantInfo")
    public  String edit(@PathVariable String tenantId,Model model){
        TenantInfo tenantInfo = tenantInfoService.selectOne(new EntityWrapper<TenantInfo>().eq("tenantId", tenantId));
        model.addAttribute("tenantInfo",tenantInfo);

        return "rentManager/tenant/edit";
    }


    /**
     * 执行编辑
     */
    @Log("编辑租客信息")
    @RequiresPermissions("editTenantInfo")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TenantInfo tenantInfo, Model model){
        int count = tenantInfoService.updateTenantInfo(tenantInfo);
        if(count>0){
            return Rest.ok("更新租客信息成功！");
        }else {
            return Rest.failure("更新租客信息失败!");
        }
    }


    /**
     * 新增租户
     */
    @RequiresPermissions("addTenantInfo")
    @RequestMapping("/add")
    public  String add(Model model){
        return "rentManager/tenant/add";
    }

    /**
     * 执行新增
     */
    @Log("新增租户")
    @RequiresPermissions("addTenantInfo")
    @RequestMapping("/doAdd")
    @ResponseBody
    public  Rest doAdd(TenantInfo tenantInfo){
        int count = tenantInfoService.insertTenantInfo(tenantInfo);
        if(count>0){
        return Rest.ok("新增租户成功！");
        }else {
            return  Rest.failure("新增租户失败！");
        }
    }


    /**
     * 验证房间编号是否合法
     */
    @RequestMapping("/checkRoomValid")
    @ResponseBody
    public Rest checkMenuResource(String roomName){
        int roomCount;
        roomCount = roomInfoService.selectCount(new EntityWrapper<RoomInfo>().eq("roomName",roomName));
        if(0==roomCount){
            return Rest.failure("该房间不存在，请换一个尝试.");
        }
        roomCount = roomInfoService.selectCount(new EntityWrapper<RoomInfo>().eq("roomName",roomName).eq("state",1));
        if(roomCount>0){
            return Rest.failure("该房间已经有人入住，请换一个尝试.");
        }
        return Rest.ok("该房间可用！");
    }


    /**
     * 删除租客信息
     */
    @RequiresPermissions("deleteTenantInfo")
    @Log("删除租客信息")
    @RequestMapping("/delete")
    @ResponseBody
    public  Rest delete(@RequestParam(name = "id") String tenantId){
       boolean isSuccess =  tenantInfoService.deleteById(tenantId);
       if(isSuccess){
           return Rest.ok("删除成功！");
       }else {
           return Rest.failure("删除失败，请稍后再试！");
        }
    }


}
