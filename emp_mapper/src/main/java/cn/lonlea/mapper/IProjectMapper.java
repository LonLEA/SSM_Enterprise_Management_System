package cn.lonlea.mapper;

import cn.lonlea.domain.Project;
import cn.lonlea.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProjectMapper {
    @Insert("INSERT INTO project (id,projectName,beginTime,endTime,description,status)" +
            "VALUES" +
            "(#{id},#{projectName},#{beginTime},#{endTime},#{description},#{status})")
    void addProject(Project project);

    @Insert("INSERT INTO department_project (departmentId,projectId)" +
            "VALUES" +
            "(#{departmentId},#{projectId})")
    void addDepartment(@Param("projectId")String projectId, @Param("departmentId")String departmentId);

    @Select("SELECT * FROM project")
    @Results(id = "projectMap",
        value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "projectName",column = "projectName"),
            @Result(property = "beginTime",column = "beginTime"),
            @Result(property = "endTime",column = "endTime"),
            @Result(property = "description",column = "description"),
            @Result(property = "status",column = "status"),
            @Result(property = "department",column = "id",
                    javaType = cn.lonlea.domain.Department.class,
                    one = @One(select = "cn.lonlea.mapper.IDepartmentMapper.findByProjectId")),
    })
    List<Project> findAll();

    @Select("SELECT * FROM project WHERE id IN " +
            "(SELECT projectId FROM department_project WHERE departmentId=#{departmentId})")
    List<Project> findByDepartmentId(String departmentId);

    @Select("SELECT * FROM project WHERE id=#{id}")
    @ResultMap("projectMap")
    Project findById(String id);

    @Update("UPDATE project SET " +
            "projectName=#{projectName},beginTime=#{beginTime},endTime=#{endTime},description=#{description},status=#{status} " +
            "WHERE id=#{id}")
    void update(Project project);

    @Insert("REPLACE INTO department_project (projectId,departmentId) " +
            "VALUES (#{projectId},#{departmentId})")
    void updateDepartment(@Param("projectId")String id, @Param("departmentId")String departmentId);

    @Delete("DELETE FROM project " +
            "WHERE id=#{id}")
    void delete(String id);

    @Delete("DELETE FROM department_project WHERE projectId=#{id}")
    void Departmentdelete(String id);




}
