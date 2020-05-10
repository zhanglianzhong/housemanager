package com.uestc.common.bean;

/**
 * @ClassName BussinessException
 * @Description 业务异常类
 * @Author:Zhang Lianzhong
 * @Date 2020/5/10 4:07 下午
 * @Version 1.0
 **/

public class BusinessException extends Exception {

    public BusinessException(){super();}

    public BusinessException(String message) {
        super(message);
    }

    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }
}