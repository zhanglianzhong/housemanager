package com.uestc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.BillInfo;
import com.baomidou.mybatisplus.service.IService;

import java.util.Map;

/**
 * <p>
 * 账单信息表 服务类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-19
 */

public interface IBillInfoService extends IService<BillInfo> {


     Page<Map<Object, Object>> selectBillInfoPage(Page<Map<Object, Object>> page, String search);

    int updateBillInfo(BillInfo billInfo);
    int updatePayFlag(String roomName,String month);
}
