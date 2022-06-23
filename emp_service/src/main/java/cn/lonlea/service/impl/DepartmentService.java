package cn.lonlea.service.impl;

import cn.lonlea.domain.Department;
import cn.lonlea.mapper.IDepartmentMapper;
import cn.lonlea.service.IDepartmentService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService implements IDepartmentService {
    @Autowired
    private IDepartmentMapper departmentMapper;

    @Override
    public List<Department> findAll() {
        return departmentMapper.findAll();
    }

    @Override
    public void addDepartment(Department department) {
        departmentMapper.addDepartment(department);
    }

    @Override
    public void deleteDepartment(String id) {
        departmentMapper.deleteDepartment(id);
    }
}
