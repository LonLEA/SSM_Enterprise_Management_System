package cn.lonlea.service;

import cn.lonlea.domain.Department;

import java.util.List;

public interface IDepartmentService {
    List<Department> findAll();
    void addDepartment(Department department);

    void deleteDepartment(String id);
}
