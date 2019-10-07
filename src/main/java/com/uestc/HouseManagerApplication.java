package com.uestc;

import com.uestc.common.util.SpringUtil;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@MapperScan("com.uestc.mapper*")
public class HouseManagerApplication {

	@Bean
	public ServletListenerRegistrationBean<SpringUtil> servletListenerRegistrationBean(){
		ServletListenerRegistrationBean<SpringUtil> servletListenerRegistrationBean = new ServletListenerRegistrationBean<SpringUtil>();
		servletListenerRegistrationBean.setListener(new SpringUtil());
		return servletListenerRegistrationBean;
	}

	public static void main(String[] args) {
		SpringApplication.run(HouseManagerApplication.class, args);
	}
}
