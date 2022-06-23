package cn.lonlea.mapper;

import cn.lonlea.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface IUserMapper {
    @Select("SELECT * FROM user")
    @Results(id = "userMap",
        value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "name",column = "name"),
            @Result(property = "age",column = "age"),
            @Result(property = "status",column = "status"),
            @Result(property = "department",column = "id",
                    javaType = cn.lonlea.domain.Department.class,
                    one = @One(select = "cn.lonlea.mapper.IDepartmentMapper.findByUserId"))
    })
    List<UserInfo> findAll();

    @Select("SELECT * FROM user WHERE username=#{username}")
    @ResultMap("userMap")
    UserInfo findByUsername(String username);

    @Select("SELECT * FROM user WHERE id=#{id}")
    @ResultMap("userMap")
    UserInfo findById(String id);

    @Insert("INSERT INTO user (id,username,password,name,age,phone,status)" +
            "VALUES" +
            "(#{id},#{username},#{password},#{name},#{age},#{phone},#{status})")
    void addUser(UserInfo user);

    @Select("SELECT * FROM user WHERE id IN" +
            "(SELECT userId FROM user_department WHERE departmentId=#{departmentId})")
    List<UserInfo> findByDepartmentId(String departmentId);

    @Insert("INSERT INTO user_department (userId,departmentId)" +
            "VALUES" +
            "(#{userId},#{departmentId})")
    void addDepartment(@Param("userId") String userId,@Param("departmentId") String departmentId);

    @Update("UPDATE user SET " +
            "username=#{username},name=#{name},age=#{age},phone=#{phone},status=#{status} " +
            "WHERE id=#{id}")
    void update(UserInfo user);

    @Insert("REPLACE INTO user_department (userId,departmentId) " +
            "VALUES (#{userId},#{departmentId})")
    void updateDepartment(@Param("userId") String userId,@Param("departmentId") String departmentId);

    @Delete("DELETE FROM user " +
            "WHERE id=#{id}")
    void delete(String id);

    @Delete("DELETE FROM user_department WHERE userId=#{id}")
    void Departmentdelete(String id);

    @Select("Select img FROM user_img WHERE userId=#{id}")
    String findImgById(String id);

    @Insert("REPLACE INTO user_img (userId,img) " +
            "VALUES (#{userId},#{imgbase64})")
    void updateImg(@Param("userId") String id, @Param("imgbase64") String imgbase64);


    @Update("UPDATE user SET " +
            "name=#{name},age=#{age},phone=#{phone} " +
            "WHERE id=#{id}")
    void updateInfo(UserInfo user);

    @Update("UPDATE user SET " +
            "password=#{password} " +
            "WHERE id=#{id}")
    void updatePwd(UserInfo user);
}
