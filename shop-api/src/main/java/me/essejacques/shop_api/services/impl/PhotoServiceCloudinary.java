package me.essejacques.shop_api.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import me.essejacques.shop_api.services.interfaces.PhotoService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;


@Profile("cloudinary")
@Service
public class PhotoServiceCloudinary implements PhotoService {

    private final Cloudinary cloudinary;

    public PhotoServiceCloudinary(
            @Value("${cloudinary.cloud-name}") String cloudName,
            @Value("${cloudinary.api-key}") String apiKey,
            @Value("${cloudinary.api-secret}") String apiSecret) {
        this.cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", cloudName,
                "api_key", apiKey,
                "api_secret", apiSecret));
    }

    @Override
    public String uploadPhoto(MultipartFile file) throws Exception {
        try {
            HashMap<Object, Object> options = new HashMap<>();
            options.put("folder", "users");
            Map uploadedFile = cloudinary.uploader().upload(file.getBytes(), options);
            String publicId = (String) uploadedFile.get("public_id");
            String link = cloudinary.url().secure(true).generate(publicId);
            return link;
        }catch (Exception e) {
            throw e;
        }

    }

}
