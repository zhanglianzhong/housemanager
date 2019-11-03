package com.uestc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.PropertyInfo;
import com.baomidou.mybatisplus.service.IService;
import com.uestc.entity.TenantInfo;

import java.util.Map;

/**
 * <p>
 * 物业信息表 服务类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-15
 */
public interface IPropertyInfoService extends IService<PropertyInfo> {
    /**
     * 分页查询物业信息
     */
    Page<Map<Object, Object>> selectPropertyInfoPage(Page<Map<Object, Object>> page, String search);

    /**
     * 插入物业信息
     */
    int insertPropertyInfo(PropertyInfo propertyInfo);
    /**
     * 更新物业信息
     */
    int updatePropertyInfo(PropertyInfo propertyInfo);

    /**
     * 删除物业信息
     */
    int delete(String roomName,String month);
}
