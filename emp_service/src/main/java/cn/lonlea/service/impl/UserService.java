package cn.lonlea.service.impl;

import cn.lonlea.domain.UserInfo;
import cn.lonlea.mapper.IUserMapper;
import cn.lonlea.service.IUserService;
import cn.lonlea.utils.BCryptPasswordEncoderUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements IUserService {
    @Autowired
    private IUserMapper userMapper;

    @Override
    public void addUser(UserInfo user,String departmentId) {
        user.setPassword(BCryptPasswordEncoderUtils.encodePssword(user.getPassword()));
        userMapper.addUser(user);
        if (departmentId != null){
            userMapper.addDepartment(user.getId(),departmentId);
        }
    }

    @Override
    public List<UserInfo> findAll(int page,int size) {
        //pageNum页码值，pageSize每页显示条数
        PageHelper.startPage(page,size);
        return userMapper.findAll();
    }

    @Override
    public UserInfo findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public UserInfo findById(String id) {
        return userMapper.findById(id);
    }

    @Override
    public void update(UserInfo user,String departmentId) {
        userMapper.update(user);
        userMapper.updateDepartment(user.getId(),departmentId);
    }

    @Override
    public void updateInfo(UserInfo user) {
        userMapper.updateInfo(user);
    }

    @Override
    public void updatePwd(UserInfo user) {
        user.setPassword(BCryptPasswordEncoderUtils.encodePssword(user.getPassword()));
        userMapper.updatePwd(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userinfo = userMapper.findByUsername(username);
        User user = null;
        if(userinfo.getStatus() == 1){
            user = new User(userinfo.getUsername(),
                    userinfo.getPassword(),getAuthority());
        }

        return user;
    }
    public List<SimpleGrantedAuthority> getAuthority(){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        list.add(new SimpleGrantedAuthority("ROLE_USER"));
        return list;
    }
    /* User user = new User(userinfo.getUsername(),                                                                                                                                                                                                                                                                                                                                                                                                    userinfo.getPassword(),
                    userinfo.getStatus()==0?false:true,true,true,true,getAuthority());*/
    @Override
    public void delete(String id) {
        userMapper.delete(id);
        userMapper.Departmentdelete(id);
    }

    @Override
    public String findImgById(String id) {
        return userMapper.findImgById(id);
    }

    @Override
    public void updateImg(String id, String imgbase64) {
        userMapper.updateImg(id,imgbase64);
    }
}
