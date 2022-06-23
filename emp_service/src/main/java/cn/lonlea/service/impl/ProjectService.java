package cn.lonlea.service.impl;

import cn.lonlea.domain.Project;
import cn.lonlea.domain.UserInfo;
import cn.lonlea.mapper.IProjectMapper;
import cn.lonlea.service.IProjectService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService implements IProjectService {
    @Autowired
    private IProjectMapper projectMapper;

    //添加项目，并且添加项目和其所属部门的联系
    @Override
    public void addProject(Project project,String departmentId) {
        projectMapper.addProject(project);
        projectMapper.addDepartment(project.getId(),departmentId);
    }

    //分页查询所有项目
    @Override
    public List<Project> findAll(int page,int size) {
        //pageNum页码值，pageSize每页显示条数
        PageHelper.startPage(page,size);
        return projectMapper.findAll();
    }

    @Override
    public List<Project> findByDepartmentId(String departmentId) {
        return projectMapper.findByDepartmentId(departmentId);
    }

    @Override
    public Project findById(String id) {
        return projectMapper.findById(id);
    }

    @Override
    public void update(Project project, String departmentId) {
        projectMapper.update(project);
        projectMapper.updateDepartment(project.getId(),departmentId);
    }

    @Override
    public void delete(String id) {
        projectMapper.delete(id);
        projectMapper.Departmentdelete(id);
    }

}
