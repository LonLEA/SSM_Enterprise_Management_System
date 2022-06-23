package cn.lonlea.mapper;

import cn.lonlea.domain.Department;
import cn.lonlea.domain.Project;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IDepartmentMapper {

    @Select("SELECT * FROM department")
    @Results(id = "departmentMap",
        value = {
                @Result(id = true,property = "id",column = "id"),
                @Result(property = "departmentName",column = "departmentName"),
                @Result(property = "users",column = "id",
                        javaType = java.util.List.class,
                        many = @Many(select = "cn.lonlea.mapper.IUserMapper.findByDepartmentId"))
    })
    List<Department> findAll();

    @Insert("INSERT INTO department (id,departmentName)" +
            "VALUES" +
            "(#{id},#{departmentName})")
    void addDepartment(Department department);

    @Select("SELECT * FROM department WHERE id " +
            "IN " +
            "(SELECT departmentId FROM user_department WHERE userId=#{userId})")
    Department findByUserId(String userId);

    @Select("SELECT * FROM department WHERE id " +
            "IN " +
            "(SELECT departmentId FROM department_project WHERE projectId=#{projectId})")
    Department findByProjectId(String projectId);

    @Delete("DELETE FROM department WHERE id=#{id}")
    void deleteDepartment(String id);
}
