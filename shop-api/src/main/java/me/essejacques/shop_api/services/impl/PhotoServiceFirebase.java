package me.essejacques.shop_api.services.impl;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import me.essejacques.shop_api.services.interfaces.PhotoService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@Profile("firebase")
@Service
public class PhotoServiceFirebase implements PhotoService {

    private final Storage storage = StorageOptions.getDefaultInstance().getService();
    private final String bucketName;

    public PhotoServiceFirebase(@Value("${firebase.bucket-name}") String bucketName) {
        this.bucketName = bucketName;
    }

    @Override
    public String uploadPhoto(MultipartFile file) throws Exception {
       try {
           String fileName = UUID.randomUUID().toString() + "-" + file.getOriginalFilename();
           BlobId blobId = BlobId.of(bucketName, fileName);
           BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType(file.getContentType()).build();
           storage.create(blobInfo, file.getBytes());
           return String.format("https://storage.googleapis.com/%s/%s", bucketName, fileName);
       }catch ( Exception e ) {
           e.printStackTrace();
           throw e;
       }
    }

}
