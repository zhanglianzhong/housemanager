package com.uestc.controller.hr;

import com.uestc.common.controller.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hr")
public class HrController extends SuperController {

    /**
     * 显示打卡页面
     * @return
     */
    @RequestMapping("/punchClock")
    public String listTodayPunck(){
       //return "/hr/punchClock";
        return "/hr/punchClock";
    }


}
