package cn.lonlea.controller;

import cn.lonlea.domain.Daily;
import cn.lonlea.domain.UserInfo;
import cn.lonlea.service.IDailyService;
import cn.lonlea.service.IUserService;
import cn.lonlea.utils.ImgUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IDailyService dailyService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(
            @RequestParam(name = "page",required = true,defaultValue = "1")int page,
            @RequestParam(name = "size",required = true,defaultValue = "5")int size){
        ModelAndView mv = new ModelAndView();
        List<UserInfo> users = userService.findAll(page,size);
        //pageinfo就是一个分页bean
        PageInfo userList = new PageInfo(users);
        mv.addObject("userList",userList);
        mv.setViewName("users/user_list");
        return mv;
    }

    @RequestMapping("/addUser.do")
    public ModelAndView addUser(UserInfo user,String departmentId){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/user_list");
        userService.addUser(user,departmentId);
        return mv;
    }

    @RequestMapping("/findByUsername.do")
    @ResponseBody
    public UserInfo findByUsername(String username, HttpServletRequest request){
        UserInfo user = userService.findByUsername(username);
        System.out.println(user);
        request.getSession().setAttribute("user",user);
        return user;
    }

    @RequestMapping("/toPersonalInfo.do")
    public ModelAndView findById(String id){
        ModelAndView mv = new ModelAndView();
        UserInfo userinfo = userService.findById(id);
        List<Daily> dailyList = dailyService.findByUserId(id);
        System.out.println(dailyList);
        mv.addObject("personalInfo",userinfo);
        mv.addObject("dailyList",dailyList);
        mv.setViewName("users/personal_info");
        return mv;
    }

    @RequestMapping("/delete.do")
    public ModelAndView delete(String id){
        ModelAndView mv = new ModelAndView();
        userService.delete(id);
        mv.setViewName("users/user_list");
        return mv;
    }

    @RequestMapping("/toEdit.do")
    public ModelAndView toEdit(String id){
        ModelAndView mv = new ModelAndView();
        UserInfo userinfo = userService.findById(id);
        mv.addObject("userInfo",userinfo);
        mv.setViewName("users/user_edit");
        return mv;
    }

    @RequestMapping("/update.do")
    public String update(UserInfo user,String departmentId){
        userService.update(user,departmentId);
        return "redirect:findAll.do?page=1&size=5";
    }

    @RequestMapping("/updateInfo.do")
    public ModelAndView updateInfo(UserInfo user){
        ModelAndView mv = new ModelAndView();
        userService.updateInfo(user);
        mv.setViewName("users/personal_info");
        return mv;
    }

    @RequestMapping("/updatePwd.do")
    public ModelAndView updatePwd(UserInfo user){
        ModelAndView mv = new ModelAndView();
        userService.updatePwd(user);
        mv.setViewName("users/personal_info");
        return mv;
    }

    @RequestMapping("/register.do")
    @ResponseBody
    public Map<String, String> register(HttpServletRequest request){
        UserInfo user = new UserInfo(request.getParameter("username"),request.getParameter("password"));
        Map<String, String> ret = new HashMap<String, String>();
        if(userService.findByUsername(user.getUsername())!=null){
            ret.put("type", "error");
            ret.put("msg", "用户名已存在");
            return ret;
        }
        userService.addUser(user,null);
        ret.put("type", "success");
        ret.put("msg", "注册成功");
        return ret;
    }

    /*返回头像图片*/
    @GetMapping(value = "/get_base64_pto.do", produces = MediaType.IMAGE_JPEG_VALUE)
    @ResponseBody
    public byte[] getBase64Pto(String id) {
        String img = userService.findImgById(id);
        return ImgUtil.decodeBase64Str(img);
    }

    /*更新用户头像*/
    @PostMapping("/updateImg.do")
    public ModelAndView updateImg(@RequestParam("userId")String id,
                                  @RequestParam("file")MultipartFile img) throws IOException {
        ModelAndView mv = new ModelAndView();
        InputStream in = (InputStream) img.getInputStream();
        BufferedImage bufferedImage = javax.imageio.ImageIO.read(in);
        String imgbase64 =  ImgUtil.getImageBase64(bufferedImage);
        userService.updateImg(id,imgbase64);
        mv.setViewName("users/personal_info");
        return mv;
    }


}
