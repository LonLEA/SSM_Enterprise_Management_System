package cn.lonlea.controller;

import cn.lonlea.domain.Department;
import cn.lonlea.domain.Project;
import cn.lonlea.service.IDepartmentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/department")
public class departmentController {
    @Autowired
    private IDepartmentService departmentService;

    //查找所有部门，返回给ajax请求
    @RequestMapping("/findAll.do")
    @ResponseBody
    public List<Department> findAll(HttpServletRequest request){
        List<Department> departments = departmentService.findAll();
        request.getSession().setAttribute("departments",departments);
        return departments;
    }

    //查找全部部门，返回部门列表界面
    @RequestMapping("/findAll1.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<Department> departments = departmentService.findAll();
        mv.addObject("departments",departments);
        mv.setViewName("departments/department_list");
        return mv;
    }

    @RequestMapping("/addDepartment.do")
    public ModelAndView addDepartment(Department department){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("departments/department_list");
        departmentService.addDepartment(department);
        return mv;
    }

    @RequestMapping("/deleteDepartment.do")
    public ModelAndView deleteDepartment(String id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("departments/department_list");
        departmentService.deleteDepartment(id);
        return mv;
    }
}
