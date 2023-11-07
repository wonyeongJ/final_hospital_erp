package com.hospital.erp.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileMappingConfig implements WebMvcConfigurer {
	
	//local file 위치
//	@Value("${app2.upload.mapping2}")
//	private String filePath;
	
	//local file 위치 (윈도우)
	@Value("${app.upload.mapping}")
	private String filePath;
		
	
	//요청 URL 경로
	@Value("${app.url.path}")
	private String urlPath;
	
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		//요청 URL  /files/**
		registry.addResourceHandler(urlPath)
		//Local file 위치 file:///D:GDJ68/upload/
				.addResourceLocations(filePath);
		
	}

}
