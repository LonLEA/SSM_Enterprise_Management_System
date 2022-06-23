package cn.lonlea.service.impl;

import cn.lonlea.domain.ProjectFile;
import cn.lonlea.mapper.IFileMapper;
import cn.lonlea.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service
public class FileService implements IFileService {
    @Autowired
    private IFileMapper fileMapper;

    @Override
    public List<ProjectFile> findByProjectId(String id) {
        return fileMapper.findByProjectId(id);
    }

    @Override
    public void save(ProjectFile projectFile) {
        fileMapper.save(projectFile);
    }

    @Override
    public ProjectFile findById(String id) {
        return fileMapper.findById(id);
    }
}
