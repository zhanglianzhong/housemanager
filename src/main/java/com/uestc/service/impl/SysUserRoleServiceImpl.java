package com.uestc.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.uestc.entity.SysUserRole;
import com.uestc.mapper.SysUserRoleMapper;
import com.uestc.service.ISysUserRoleService;
import org.springframework.stereotype.Service;



/**
 *
 * SysUserRole 表数据服务层接口实现类
 *
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {

	@Override
	public Set<String> findRolesByUid(String uid) {
		List<SysUserRole> list = this.selectList(new EntityWrapper<SysUserRole>().eq("userId", uid));

		Set<String> set = new HashSet<String>();
		for (SysUserRole ur : list) {
			set.add(ur.getRoleId());
		}
		return set;
	}
}