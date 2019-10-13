package com.uestc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.RoomInfo;
import com.baomidou.mybatisplus.service.IService;

import java.util.Map;

/**
 * <p>
 * 房源信息表 服务类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
public interface IRoomInfoService extends IService<RoomInfo>{


    /**
     * 分页查询房间信息
     */
    Page<Map<Object, Object>> selectRoomInfoPage(Page<Map<Object, Object>> page, String search);

    /**
     * 插入房间信息
     */
    void insertRoomInfo(RoomInfo roomInfo);
    /**
     * 更新房间信息
     */
    void updateRoomInfo(RoomInfo roomInfo);
    /**
     * 删除房间信息
     */
    void delete(String roomName);
}
