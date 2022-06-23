package cn.lonlea.service;

import cn.lonlea.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    void addUser(UserInfo user,String departmentId);

    List<UserInfo> findAll(int page,int size);

    UserInfo findByUsername(String username);

    UserInfo findById(String id);

    void update(UserInfo user,String departmentId);

    void delete(String id);

    String findImgById(String id);

    void updateImg(String id, String imgbase64);

    void updateInfo(UserInfo user);

    void updatePwd(UserInfo user);
}
