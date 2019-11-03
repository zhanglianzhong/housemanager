package com.uestc.controller.hm;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.common.anno.Log;
import com.uestc.common.bean.Rest;
import com.uestc.common.controller.SuperController;
import com.uestc.entity.RoomInfo;
import com.uestc.service.IRoomInfoService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * <p>
 * 房源信息表 前端控制器
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
@Controller
@RequestMapping("/hm/roomManager")
public class RoomInfoController extends SuperController {

	@Autowired
	IRoomInfoService roomInfoService;

    /**
	 * 分页查询房间信息
	 */
	//@RequiresPermissions("listUser")
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue="15") Integer pageSize, String search, Model model){
		if(StringUtils.isNotBlank(search)){
			model.addAttribute("search", search);
		}
    	Page<Map<Object, Object>> page = getPage(pageNumber,pageSize);
    	model.addAttribute("pageSize", pageSize);
    	Page<Map<Object, Object>> pageData = roomInfoService.selectRoomInfoPage(page, search);
    	model.addAttribute("pageData", pageData);
    	return "rentManager/room/list";
    }


	/**
	 * 编辑房间信息
	 */
	@RequestMapping("/edit/{roomName}")
	@RequiresPermissions("editRoomInfo")
	public  String edit(@PathVariable String roomName,Model model){
		RoomInfo roomInfo = roomInfoService.selectOne(new EntityWrapper<RoomInfo>().eq("roomName", roomName));
		model.addAttribute("roomInfo",roomInfo);

		return "rentManager/room/edit";
	}


	/**
	 * 执行编辑
	 */
	@Log("编辑房间信息")
	@RequiresPermissions("editRoomInfo")
	@RequestMapping("/doEdit")
	@ResponseBody
	public Rest doEdit(RoomInfo roomInfo, Model model){
		int count = roomInfoService.updateRoomInfo(roomInfo);
		if(count>0)	{
			return Rest.ok("更新房间信息成功！");
		}else {
			return Rest.failure("更新房间信息失败！");
		}
	}


	/**
	 * 新增房间信息
	 */
	@RequiresPermissions("addRoomInfo")
	@RequestMapping("/add")
	public  String add(Model model){
		return "rentManager/room/add";
	}

	/**
	 * 执行新增
	 */
	@Log("新增房间信息")
	@RequiresPermissions("addRoomInfo")
	@RequestMapping("/doAdd")
	@ResponseBody
	public  Rest doAdd(RoomInfo roomInfo){

		int count = roomInfoService.insertRoomInfo(roomInfo);
		if(count>0){
		   return Rest.ok("新增房间信息成功");
		}else {
		   return Rest.failure("新增房间信息失败，请检查输入数据！");
		}
	}

	/**
	 * 删除房间信息
	 */
	@RequiresPermissions("deleteRoomInfo")
	@Log("删除房间信息")
	@RequestMapping("/delete")
	@ResponseBody
	public  Rest delete(String roomName) {
		boolean isSuccess = roomInfoService.delete(new EntityWrapper<RoomInfo>().eq("roomName", roomName));

		if (isSuccess) {
			return Rest.ok("删除成功！");
		} else {
			return Rest.failure("删除失败！");
		}

	}
}
