package com.uestc.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.entity.PropertyInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 物业信息表 Mapper 接口
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-15
 */
@Repository
public interface PropertyInfoMapper extends BaseMapper<PropertyInfo> {


    List<Map<Object, Object>> selectPropertyInfoList(Page<Map<Object, Object>> page, @Param("search") String search);

}
