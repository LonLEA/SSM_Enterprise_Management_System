package cn.lonlea.domain;

import cn.lonlea.utils.BCryptPasswordEncoderUtils;
import cn.lonlea.utils.UUIDutil;
import org.springframework.stereotype.Component;

@Component
public class UserInfo {
    private String id = UUIDutil.getuuid();;
    private String username;
    private String password;
    private String name;
    private int age;
    private String phone;
    private Department department;
    private Integer status = 0;
    private String statusStr;

    public UserInfo() {
    }

    public UserInfo(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public UserInfo(String username,  String name, int age, String phone) {
        this.username = username;
        this.name = name;
        this.age = age;
        this.phone = phone;
    }

    public UserInfo(String username, String password, String name,
                    int age, String phone, Department department, Integer status) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.department = department;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusStr() {
        if (status != null){
            if (status == 1){
                statusStr = "开启";
            }
            if (status == 0){
                statusStr = "关闭";
            }
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                '}';
    }
}
