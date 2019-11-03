package com.uestc.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.BillInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 账单信息表 Mapper 接口
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-19
 */

@Repository
public interface BillInfoMapper extends BaseMapper<BillInfo> {

    List<Map<Object, Object>> selectBillInfoList(Page<Map<Object, Object>> page, @Param("search") String search);
    int updatePayFlag(String roomName,String month);
}
