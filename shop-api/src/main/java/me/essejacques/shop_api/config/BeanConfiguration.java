package me.essejacques.shop_api.config;

import lombok.extern.slf4j.Slf4j;
import me.essejacques.shop_api.services.impl.PhotoServiceCloudinary;
import me.essejacques.shop_api.services.impl.PhotoServiceFirebase;
import me.essejacques.shop_api.services.interfaces.PhotoService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class BeanConfiguration {

    @Value("${photoservice.provider}")
    private String photoServiceProvider;

    private final PhotoServiceCloudinary photoServiceCloudinary;
    private final PhotoServiceFirebase photoServiceFirebase;

    public BeanConfiguration(PhotoServiceCloudinary photoServiceCloudinary, PhotoServiceFirebase photoServiceFirebase) {
        this.photoServiceCloudinary = photoServiceCloudinary;
        this.photoServiceFirebase = photoServiceFirebase;
    }

    @Bean
    public PhotoService photoService() {
        if (photoServiceProvider.equals("cloudinary")) {
            log.info("PhotoServiceProvider: cloudinary");
            return photoServiceCloudinary;
        } else if (photoServiceProvider.equals("firebase")) {
            log.info("PhotoServiceProvider: firebase");
            return photoServiceFirebase;
        }
        return null;
    }




}
