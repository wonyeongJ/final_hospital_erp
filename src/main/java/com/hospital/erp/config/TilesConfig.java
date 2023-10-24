package com.hospital.erp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
	@Bean
    public UrlBasedViewResolver viewResolver() {
    	UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
    	tilesViewResolver.setViewClass(TilesView.class);
        //우선순위 지정 저는 0순위 가장 앞선 순위로 타일즈를 지정했습니다.
    	tilesViewResolver.setOrder(0);
    	return tilesViewResolver;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer configurer = new TilesConfigurer();
       //타일즈 설정파일 경로
        configurer.setDefinitions(new String[]{"/WEB-INF/tiles.xml"});
        configurer.setCheckRefresh(true);
        return configurer;
    }
}
