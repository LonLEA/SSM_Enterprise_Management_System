package cn.lonlea;

import cn.lonlea.domain.UserInfo;
import cn.lonlea.service.IUserService;
import cn.lonlea.service.impl.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserServiceTest {
    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserService userService = context.getBean(UserService.class);
    }
}
