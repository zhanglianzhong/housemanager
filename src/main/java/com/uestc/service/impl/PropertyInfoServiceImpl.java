package com.uestc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.PropertyInfo;
import com.uestc.mapper.PropertyInfoMapper;
import com.uestc.mapper.TenantInfoMapper;
import com.uestc.service.IPropertyInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 物业信息表 服务实现类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-15
 */
@Service
public class PropertyInfoServiceImpl extends ServiceImpl<PropertyInfoMapper, PropertyInfo> implements IPropertyInfoService {

    @Autowired
    private PropertyInfoMapper propertyInfoMapper;


    @Override
    public Page<Map<Object, Object>> selectPropertyInfoPage(Page<Map<Object, Object>> page, String search) {
        // TODO Auto-generated method stub
        page.setRecords(baseMapper.selectPropertyInfoList(page, search));
        return page;
    }

    @Override
    public int insertPropertyInfo(PropertyInfo propertyInfo) {
        return propertyInfoMapper.insert(propertyInfo);
    }

    @Override
    public int updatePropertyInfo(PropertyInfo propertyInfo) {

        return propertyInfoMapper.update(propertyInfo,new EntityWrapper<PropertyInfo>().eq("roomName",propertyInfo.getRoomName()).eq("month",propertyInfo.getMonth()));

    }

    @Override
    public int delete(String roomName, String month) {
        return propertyInfoMapper.delete(new EntityWrapper<PropertyInfo>().eq("roomName",roomName).eq("month",month));
    }
}
