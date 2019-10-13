package com.uestc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.RoomInfo;
import com.uestc.entity.TenantInfo;
import com.baomidou.mybatisplus.service.IService;

import java.util.Map;

/**
 * <p>
 * 租户信息表 服务类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
public interface ITenantInfoService extends IService<TenantInfo> {

    /**
     * 分页查询租客信息
     */
    Page<Map<Object, Object>> selectTenantInfoPage(Page<Map<Object, Object>> page, String search);

    /**
     * 插入租客信息
     */
    int insertTenantInfo(TenantInfo tenantInfo);
    /**
     * 更新租客信息
     */
    int updateTenantInfo(TenantInfo tenantInfo);

    /**
     * 删除租客信息
     */
    int delete(String roomName);

}
