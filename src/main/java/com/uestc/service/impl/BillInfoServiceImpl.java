package com.uestc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.BillInfo;
import com.uestc.entity.TenantInfo;
import com.uestc.mapper.BillInfoMapper;
import com.uestc.mapper.TenantInfoMapper;
import com.uestc.service.IBillInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 账单信息表 服务实现类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-19
 */
@Service
public class BillInfoServiceImpl extends ServiceImpl<BillInfoMapper, BillInfo> implements IBillInfoService {


    @Autowired
    private BillInfoMapper billInfoMapper;


    @Override
    public Page<Map<Object, Object>> selectBillInfoPage(Page<Map<Object, Object>> page, String search) {
        page.setRecords(baseMapper.selectBillInfoList(page,search));
        return page;
    }


    @Override
    public int updateBillInfo(BillInfo billInfo) {
        return billInfoMapper.update(billInfo,new EntityWrapper<BillInfo>().eq("roomName",billInfo.getRoomName()).eq("month",billInfo.getMonth()));

    }

    @Override
    public int updatePayFlag(String roomName, String month) {
        return billInfoMapper.updatePayFlag(roomName,month);
    }


}
