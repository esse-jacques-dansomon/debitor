package me.essejacques.shop_api.services.interfaces;

import org.springframework.web.multipart.MultipartFile;

public interface PhotoService {
    String uploadPhoto(MultipartFile file) throws Exception;
}
