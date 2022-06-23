package cn.lonlea.service;

import cn.lonlea.domain.ProjectFile;

import java.io.File;
import java.util.List;

public interface IFileService {
    List<ProjectFile> findByProjectId(String id);

    void save(ProjectFile projectFile);

    ProjectFile findById(String id);
}
