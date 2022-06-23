package cn.lonlea.mapper;

import cn.lonlea.domain.ProjectFile;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.io.File;
import java.util.List;

@Repository
public interface IFileMapper {

    @Select("SELECT * FROM project_file WHERE projectId=#{id}")
    List<ProjectFile> findByProjectId(String id);

    @Select("SELECT * FROM project_file WHERE id=#{id}")
    ProjectFile findById(String id);

    @Insert("INSERT INTO project_file (id,projectId,fileName,url) " +
            "VALUES" +
            "(#{id},#{projectId},#{fileName},#{url})")
    void save(ProjectFile projectFile);
}
