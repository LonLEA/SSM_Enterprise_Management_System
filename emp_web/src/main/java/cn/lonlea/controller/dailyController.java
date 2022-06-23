package cn.lonlea.controller;

import cn.lonlea.domain.Daily;
import cn.lonlea.service.IDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/dailys")
public class dailyController {
    @Autowired
    private IDailyService dailyService;

    @RequestMapping("/add.do")
    public ModelAndView add(Daily daily){
        ModelAndView mv = new ModelAndView();
        dailyService.add(daily);
        List<Daily> dailyList = dailyService.findByUserId(daily.getUserId());
        mv.addObject("dailyList",dailyList);
        mv.setViewName("users/personal_info");
        return mv;
    }

    @RequestMapping("/delete.do")
    public ModelAndView delete(String id){
        ModelAndView mv = new ModelAndView();
        Daily daily = dailyService.findById(id);
        dailyService.delete(id);
        List<Daily> dailyList = dailyService.findByUserId(daily.getUserId());
        mv.addObject("dailyList",dailyList);
        mv.setViewName("users/personal_info");
        return mv;
    }

    @RequestMapping("/findByUserId.do")
    @ResponseBody
    public List<Daily> findByUserId(String userId, HttpServletRequest request){
        List<Daily> dailys = dailyService.findByUserId(userId);
        request.getSession().setAttribute("dailys",dailys);
        return dailys;
    }

    @RequestMapping("/finish.do")
    public ModelAndView finish(String id){
        ModelAndView mv = new ModelAndView();
        dailyService.finish(id);
        mv.setViewName("main");
        return mv;
    }
}
