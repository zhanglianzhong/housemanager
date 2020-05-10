package com.uestc.controller.hm;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.common.anno.Log;
import com.uestc.common.bean.BusinessException;
import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.*;
import com.uestc.service.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>
 * 物业信息表 前端控制器
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-15
 */
@Controller
@RequestMapping("/hm/propertyManager")
public class PropertyInfoController extends SuperController {

    @Autowired
    IPropertyInfoService propertyInfoService;

    @Autowired
    IBillInfoService billInfoService;


    @Autowired
    private IBusParamService busParamService;


    @Autowired
    private ITenantInfoService tenantInfoService;

    @Autowired
    private IRoomInfoService roomInfoService;

    /**
     * 分页查询物业信息
     */
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue="15") Integer pageSize, String search, Model model){
        if(StringUtils.isNotBlank(search)){
            model.addAttribute("search", search);
        }
        Page<Map<Object, Object>> page = getPage(pageNumber,pageSize);
        model.addAttribute("pageSize", pageSize);
        Page<Map<Object, Object>> pageData = propertyInfoService.selectPropertyInfoPage(page, search);
        model.addAttribute("pageData", pageData);
        return "rentManager/property/list";
    }


    /**
     * 编辑物业信息
     */
    @RequestMapping("/edit")
    @RequiresPermissions("editPropertyInfo")
    public  String edit(@RequestParam(name = "roomName")  String roomName,@RequestParam(name = "month")  String month,Model model){
        PropertyInfo propertyInfo = propertyInfoService.selectOne(new EntityWrapper<PropertyInfo>().eq("roomName", roomName).eq("month",month));
        model.addAttribute("propertyInfo",propertyInfo);

        return "rentManager/property/edit";
    }


    /**
     * 执行编辑
     */
    @Log("编辑水电信息")
    @RequiresPermissions("editPropertyInfo")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(PropertyInfo propertyInfo, Model model){
        int count = propertyInfoService.updatePropertyInfo(propertyInfo);
        if(count >0){
        return Rest.ok("更新水电信息成功！");
        }else {
            return Rest.failure("更新水电信息失败！");
        }
    }


    /**
     * 新增租户
     */
    @RequiresPermissions("addPropertyInfo")
    @RequestMapping("/add")
    public  String add(Model model){
        return "rentManager/property/add";
    }

    /**
     * 执行新增
     */
    @Log("新增水电信息")
    @RequiresPermissions("addPropertyInfo")
    @RequestMapping("/doAdd")
    @ResponseBody
    public  Rest doAdd(PropertyInfo propertyInfo){
        propertyInfo.setVersion(1);
        int count = propertyInfoService.insertPropertyInfo(propertyInfo);
        if(count>0){
           return Rest.ok("新增水电信息成功！");
        }else{
            return Rest.failure("新增水电信息失败！");
        }
    }

    /**
     * 删除水电信息
     */
    @RequiresPermissions("deleteTenantInfo")
    @Log("删除水电信息")
    @RequestMapping("/delete")
    @ResponseBody
    public  Rest delete(@RequestParam(name = "roomName")  String roomName,@RequestParam(name = "month")  String month){

        propertyInfoService.delete(roomName,month);
        return Rest.ok();
    }

    /**
     * 预览本月账单信息
     */
    @RequestMapping("/preview")
    public  String preview(@RequestParam("roomName") String roomName,@RequestParam("month") String curMonth,Model model) throws Exception{

        //读取上月水电信息
        SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM");
        String lastMonth = null;

        try {
            Date currdate = sd.parse(curMonth);
            Calendar calendar= Calendar.getInstance();
            calendar.setTime(currdate);
            calendar.set(Calendar.MONTH,calendar.get(Calendar.MONTH)-1);
            lastMonth = sd.format(calendar.getTime());

        } catch (ParseException e) {
            e.printStackTrace();
        }

        PropertyInfo lastPropertyInfo = propertyInfoService.selectOne(new EntityWrapper<PropertyInfo>().eq("roomName", roomName).eq("month",lastMonth));
        if(null == lastPropertyInfo){
            throw new BusinessException("读取上月水电数据失败，请先录入上月数据，再尝试预览账单！");
        }

        PropertyInfo curPropertyInfo = propertyInfoService.selectOne(new EntityWrapper<PropertyInfo>().eq("roomName",roomName).eq("month",curMonth));

       //读取业务参数配置
       List<BusParam> paramList = busParamService.selectList(new EntityWrapper<BusParam>());
       Map<String,String>  paramMap = new HashMap<>();
       for(BusParam busParam:paramList){
           paramMap.put(busParam.getSysKey(),busParam.getSysValue());
       }
       model.addAttribute("waterUnitPrice",paramMap.get("waterUnitPrice"));
       model.addAttribute("eleUnitPrice",paramMap.get("eleUnitPrice"));

       //查询该房间当前租客
       TenantInfo tenantInfo = tenantInfoService.selectOne(new EntityWrapper<TenantInfo>().eq("roomName",roomName).eq("tenantState",1));
       if(null ==tenantInfo){
           throw new BusinessException("未查到该房间的租客信息！");
       }


       BillInfo billInfo = new BillInfo();
       billInfo.setRoomName(roomName);  //房间信息
       billInfo.setMonth(curMonth);     //当前月份
       billInfo.setTenantName(tenantInfo.getTenantName()); //租客姓名
       billInfo.setLastMonthWater(lastPropertyInfo.getWaterNum()); //上月水量
       billInfo.setCurMonthWater(curPropertyInfo.getWaterNum());// 本月水量
       if((curPropertyInfo.getWaterNum()-lastPropertyInfo.getWaterNum())<3){
        //不足三吨以三吨记
        billInfo.setRealUseWater(3);
       }else {
           billInfo.setRealUseWater(curPropertyInfo.getWaterNum() - lastPropertyInfo.getWaterNum());
       }
       billInfo.setLastMonthEle(lastPropertyInfo.getElectricNum());
       billInfo.setCurMonthEle(curPropertyInfo.getElectricNum());
       billInfo.setRealUseEle(curPropertyInfo.getElectricNum()-lastPropertyInfo.getElectricNum());
       //电梯费
       RoomInfo roomInfo = roomInfoService.selectOne(new EntityWrapper<RoomInfo>().eq("roomName", roomName));
       int hasLift = roomInfo.getHasLift();
       if(1 ==hasLift){
           billInfo.setLiftFee(new BigDecimal(paramMap.get("liftPrice")));
       }else{
           billInfo.setLiftFee(BigDecimal.ZERO);
       }
        //月租
        billInfo.setRental(roomInfo.getRental());
       //网费
        billInfo.setNetFee(roomInfo.getNetPrice());
       //公共费
        billInfo.setPublicFee(new BigDecimal(paramMap.get("publicPrice")));

       //卫生费
        if(roomInfo.getRoomType().equals("10")){
            //单间
            billInfo.setSanitaryFee(new BigDecimal(paramMap.get("onePrice")));
        }else if(roomInfo.getRoomType().equals("11")){
            //一室一厅
            billInfo.setSanitaryFee(new BigDecimal(paramMap.get("oneOnePrice")));
        }else if(roomInfo.getRoomType().equals("21")) {
            //两房一厅
            billInfo.setSanitaryFee(new BigDecimal(paramMap.get("twoOnePrice")));
        }else if(roomInfo.getRoomType().equals("31")) {
            //三房一厅
            billInfo.setSanitaryFee(new BigDecimal(paramMap.get("threeOnePrice")));
        }else{
            billInfo.setSanitaryFee(BigDecimal.ZERO);
        }

        //总费用
        BigDecimal waterFee  = new BigDecimal(billInfo.getRealUseWater()).multiply(new BigDecimal(paramMap.get("waterUnitPrice")));
        BigDecimal eleFee = new BigDecimal(billInfo.getRealUseEle()).multiply(new BigDecimal(paramMap.get("eleUnitPrice")));
        billInfo.setTotalFees(waterFee.add(eleFee).add(billInfo.getLiftFee()).add(billInfo.getPublicFee()).add(billInfo.getSanitaryFee()).add(billInfo.getNetFee()).add(billInfo.getRental()));

       model.addAttribute("billInfo",billInfo);
       return "rentManager/property/preview";
    }


    /**
     * 验证所属年月是否合法
     */
    @RequestMapping("/checkMonthValid")
    @ResponseBody
    public Rest checkMenuResource(String roomName,String month){
        int roomCount;
        roomCount = propertyInfoService.selectCount(new EntityWrapper<PropertyInfo>().eq("roomName",roomName).eq("month",month));
        if(roomCount>0){
            return Rest.failure("该房间所填月份已有水电信息，请检查数据后再重新录入.");
        }
        return Rest.ok("该月份可用！");
    }


    /**
     * 验证房间是否合法
     */
    @RequestMapping("/checkRoomValid")
    @ResponseBody
    public Rest checkMenuResource(String roomName){
        int roomCount;
        roomCount = roomInfoService.selectCount(new EntityWrapper<RoomInfo>().eq("roomName",roomName));
        if(roomCount==0){
            return Rest.failure("系统检索不到该房间信息，请检查后重新输入");
        }
        return Rest.ok("该房间可用！");
    }


}
