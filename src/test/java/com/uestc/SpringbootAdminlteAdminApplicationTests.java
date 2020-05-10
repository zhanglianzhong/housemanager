package com.uestc;

import com.baomidou.mybatisplus.plugins.Page;
import com.uestc.service.IRoomInfoService;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringbootAdminlteAdminApplicationTests {


    @Autowired
    private IRoomInfoService  roomInfoServiceImpl;

    @Test
    public void testDeleteService(){
        roomInfoServiceImpl.delete("08102");

    }

    @Test
    public void testSelectService(){

        int pageNumber = 1;
        int pageSize = 15;
        String search = "";
        Page<Map<Object, Object>> page = new Page<Map<Object,Object>>(pageNumber, pageSize);

        Page<Map<Object, Object>> pageData = roomInfoServiceImpl.selectRoomInfoPage(page, search);

        System.out.println(pageData);
    }


}
