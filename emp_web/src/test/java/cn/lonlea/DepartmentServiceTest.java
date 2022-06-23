package cn.lonlea;

import cn.lonlea.domain.Department;
import cn.lonlea.domain.UserInfo;
import cn.lonlea.service.IDepartmentService;
import cn.lonlea.service.IUserService;
import cn.lonlea.service.impl.DepartmentService;
import cn.lonlea.service.impl.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class DepartmentServiceTest {
    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        IDepartmentService departmentService = context.getBean(DepartmentService.class);
        //departmentService.addDepartment(new Department("department1"));
        //departmentService.addDepartment(new Department("department2"));
        List<Department> departments = departmentService.findAll();
        for (Department department : departments){
            System.out.println(department);
        }
    }
}
