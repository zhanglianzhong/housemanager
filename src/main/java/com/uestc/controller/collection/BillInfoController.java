package com.uestc.controller.collection;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.BillInfo;
import com.uestc.service.IBillInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.Map;

/**
 * <p>
 * 账单信息表 前端控制器
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-19
 */
@Controller
@RequestMapping("/collection/bill")
public class BillInfoController  extends SuperController {

    @Autowired
    IBillInfoService billInfoService;

    /**
     * 分页查询账单信息
     */
    //@RequiresPermissions("listUser")
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue="15") Integer pageSize, String search, Model model){
        if(StringUtils.isNotBlank(search)){
            model.addAttribute("search", search);
        }
        Page<Map<Object, Object>> page = getPage(pageNumber,pageSize);
        model.addAttribute("pageSize", pageSize);
        Page<Map<Object, Object>> pageData = billInfoService.selectBillInfoPage(page, search);
        model.addAttribute("pageData", pageData);
        return "collection/bill/list";
    }


    /**
     * 查询特定房间账单信息
     */
    @RequestMapping("/detail")
    public  String edit(@RequestParam("roomName") String roomName,@RequestParam("month") String month,Model model){
        BillInfo billInfo = billInfoService.selectOne(new EntityWrapper<BillInfo>().eq("roomName", roomName).eq("month",month));
        //添加总水费信息
        BigDecimal waterFee = new BigDecimal(billInfo.getRealUseWater()).multiply(billInfo.getWaterUnitPrice());
        model.addAttribute("waterFeeReverse",translateAmount(waterFee));

        //添加总电费信息
        BigDecimal eleFee = new BigDecimal(billInfo.getRealUseEle()).multiply(billInfo.getEleUnitPrice());
        model.addAttribute("eleFeeReverse",translateAmount(eleFee));

        model.addAttribute("rentalReverse",translateAmount(billInfo.getRental()));
        model.addAttribute("liftFeeReverse",translateAmount(billInfo.getLiftFee()));
        model.addAttribute("netFeeReverse",translateAmount(billInfo.getNetFee()));
        model.addAttribute("sanitaryFeeReverse",translateAmount(billInfo.getSanitaryFee()));
        model.addAttribute("publicFeeReverse",translateAmount(billInfo.getPublicFee()));

        model.addAttribute("totalFeesReverse",translateAmountChinese(billInfo.getTotalFees()));

        model.addAttribute("billInfo",billInfo);
        return "collection/bill/detail";
    }

    /**
     * 查询特定房间账单信息
     */
    @RequestMapping("/insertOrUpdate")
    @ResponseBody
    public Rest insertOrUpdate(BillInfo billInfo){
        BillInfo billInfoRecord =  billInfoService.selectOne(new EntityWrapper<BillInfo>().eq("roomName", billInfo.getRoomName()).eq("month",billInfo.getMonth()));
        if(null == billInfoRecord){
            //新增订单
            boolean sucess = billInfoService.insert(billInfo);
            if(sucess){
                return Rest.ok("新增账单成功！");
            }else {
                return Rest.failure("新增账单失败！");
            }
        }else{
            if(billInfoRecord.getPayFlag().equals("Y")){

                return Rest.failure("该月账单已存在，且已缴纳，不允许更改！");
            }
            //更新
           int count = billInfoService.updateBillInfo(billInfo);
           if(count>0){
              return Rest.ok("更新账单成功！");
           }else {

               return Rest.failure("更新账单失败！");
           }
        }
    }

    /**
     * 对金额（分为单位）反向
     * @param amount
     * @return  512.33 ===> 33.215
     */
    private  String translateAmount(BigDecimal amount){
        if(amount.equals(BigDecimal.ZERO)){
            return "0";
        }
        //四舍五入得到分为单位金额
        BigDecimal particularAmount = amount.setScale(2, BigDecimal.ROUND_DOWN);
        //反向
        return  new StringBuffer(particularAmount.toString()).reverse().toString();
    }

    /**
     * 对金额（分为单位）反向成汉字
     * @param amount
     * @return  512.33 ===> 33.215==>叁叁.贰壹伍
     */
    private  String translateAmountChinese(BigDecimal amount){

        if(amount.equals(BigDecimal.ZERO)){
            return "零";
        }

        String[] param = {"零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"};
        //四舍五入得到分为单位金额
        BigDecimal particularAmount = amount.setScale(2, BigDecimal.ROUND_DOWN);
        String reverseAmount = new StringBuffer(particularAmount.toString()).reverse().toString();

        StringBuffer chineseStr=new StringBuffer();
        char dou = '.';

        for (char c : reverseAmount.toCharArray()) {
            if(dou==c){
                chineseStr.append(".");
                continue;
            }
            chineseStr.append(param[Integer.parseInt(String.valueOf(c))]);
        }
        return chineseStr.toString();

    }

    @RequestMapping("/setStatus")
    @ResponseBody
    public Rest setTenanStatus(@RequestParam(name="roomName") String roomName,@RequestParam(name="month") String month){
       if(billInfoService.updatePayFlag(roomName,month)>0){
           return Rest.ok("更新成功");
       }else {
           return Rest.failure("更新缴纳状态失败！");
       }
    }

}
