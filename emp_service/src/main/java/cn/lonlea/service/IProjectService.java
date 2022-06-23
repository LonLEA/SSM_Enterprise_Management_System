package cn.lonlea.service;

import cn.lonlea.domain.Project;
import cn.lonlea.domain.UserInfo;

import java.util.List;

public interface IProjectService {
    void addProject(Project project, String departmentId);

    List<Project> findAll(int page,int size);

    List<Project> findByDepartmentId(String departmentId);

    Project findById(String id);

    void update(Project project, String departmentId);

    void delete(String id);

}
