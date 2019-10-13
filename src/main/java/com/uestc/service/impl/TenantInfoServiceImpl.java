package com.uestc.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.TenantInfo;
import com.uestc.mapper.TenantInfoMapper;
import com.uestc.service.ITenantInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 租户信息表 服务实现类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
@Service
public class TenantInfoServiceImpl extends ServiceImpl<TenantInfoMapper, TenantInfo> implements ITenantInfoService {



    @Autowired
    private TenantInfoMapper tenantInfoMapper;


    @Override
    public Page<Map<Object, Object>> selectTenantInfoPage(Page<Map<Object, Object>> page, String search) {
        page.setRecords(baseMapper.selectTenantList(page,search));
        return page;
    }

    @Override
    public int insertTenantInfo(TenantInfo tenantInfo) {
           return tenantInfoMapper.insert(tenantInfo);
    }

    @Override
    public int updateTenantInfo(TenantInfo tenantInfo) {
        return tenantInfoMapper.updateById(tenantInfo);

    }


    @Override
    public int delete(String tenantId) {
        return tenantInfoMapper.deleteById(tenantId);

    }
}
