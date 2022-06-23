package cn.lonlea.domain;

import cn.lonlea.utils.UUIDutil;

public class ProjectFile {
    private String id = UUIDutil.getuuid();
    private String projectId;
    private String fileName;
    private String url;

    public ProjectFile() {
    }

    public ProjectFile(String projectId, String fileName, String url) {
        this.projectId = projectId;
        this.fileName = fileName;
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
