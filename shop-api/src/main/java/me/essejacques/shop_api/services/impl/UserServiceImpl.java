package me.essejacques.shop_api.services.impl;

import me.essejacques.shop_api.entity.User;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.repositories.UserRepository;
import me.essejacques.shop_api.services.interfaces.PhotoService;
import me.essejacques.shop_api.services.interfaces.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PhotoService photoService;

    /**
     * @param user
     * @param file
     * @return User
     */
    @Override
    public User createUser(User user, MultipartFile file) {
      try {
          String fileName = photoService.uploadPhoto(file);
          user.setPhoto(fileName);
          return this.userRepository.save(user);
      }catch (Exception e){
          e.printStackTrace();
      }
      return null;
    }

    /**
     * @param user
     * @return User
     */
    @Override
    public User updateUser(User user) {
        return this.userRepository.save(user);
    }

    /**
     * @param userId
     */
    @Override
    public void deleteUser(Long userId) {
        this.userRepository.deleteById(userId);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Optional<User> findUserById(Long id) {
        return Optional.of(this.userRepository.findById(id).orElseThrow());
    }

    /**
     * @param email
     * @return
     */
    @Override
    public Optional<User> findUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    /**
     * @param email
     * @param password
     * @return
     */
    @Override
    public Optional<User> findUserByEmailAndPassword(String email, String password) {
        return this.userRepository.findByEmailAndPassword(email, password);
    }

    /**
     * @param pageRequest
     * @return
     */
    @Override
    public Page<User> getAll(PageRequest pageRequest) {
        return this.userRepository.findPagedProjectedBy(pageRequest);
    }

    @Override
    public Optional<User> findUserProjectedByEmail(String email) {
        return this.userRepository.findProjectedByEmail(email);
    }
}
