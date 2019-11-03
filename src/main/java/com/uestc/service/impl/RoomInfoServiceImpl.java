package com.uestc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.RoomInfo;
import com.uestc.mapper.RoomInfoMapper;
import com.uestc.service.IRoomInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 房源信息表 服务实现类
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
@Service
public class RoomInfoServiceImpl extends ServiceImpl<RoomInfoMapper, RoomInfo> implements IRoomInfoService {


    @Autowired
    private RoomInfoMapper roomInfoMapper;


    @Override
    public Page<Map<Object, Object>> selectRoomInfoPage(Page<Map<Object, Object>> page, String search) {
        // TODO Auto-generated method stub
        page.setRecords(baseMapper.selectRoomInfoList(page, search));
        return page;
    }

    @Override
    public int insertRoomInfo(RoomInfo roomInfo) {
       return roomInfoMapper.insert(roomInfo);
    }

    @Override
    public int updateRoomInfo(RoomInfo roomInfo) {
        return roomInfoMapper.update(roomInfo,new EntityWrapper<RoomInfo>().eq("roomName",roomInfo.getRoomName()));
    }

    @Override
    public int delete(String roomName) {
         return roomInfoMapper.delete(new EntityWrapper<RoomInfo>().eq("roomName",roomName));
    }
}
