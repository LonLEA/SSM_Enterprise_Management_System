package cn.lonlea.domain;

import cn.lonlea.utils.UUIDutil;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Department {
    private String id = UUIDutil.getuuid();
    private String departmentName;
    private List<UserInfo> users;

    public Department() {
    }

    public Department(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public List<UserInfo> getUsers() {
        return users;
    }

    public void setUsers(List<UserInfo> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", name='" + departmentName + '\'' +
                '}';
    }
}
