package com.uestc.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.RoomInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 房源信息表 Mapper 接口
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */


@Repository
public interface RoomInfoMapper extends BaseMapper<RoomInfo> {

    List<Map<Object, Object>> selectRoomInfoList(Page<Map<Object, Object>> page, @Param("search") String search);
}
