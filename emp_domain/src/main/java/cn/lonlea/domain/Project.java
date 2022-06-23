package cn.lonlea.domain;

import cn.lonlea.utils.DateUtil;
import cn.lonlea.utils.UUIDutil;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class Project {
    private String id = UUIDutil.getuuid();;
    private String projectName;
    @DateTimeFormat(pattern = "yyyy年MM月dd日")
    private Date beginTime;
    private String beginTimeStr;
    @DateTimeFormat(pattern = "yyyy年MM月dd日")
    private Date endTime;
    private String endTimeStr;
    private String description;
    private Integer status;
    private String statusStr;
    private Department department;

    public Project() {
    }

    public Project(String project_name) {
        this.projectName = project_name;
    }

    public Project(String projectName, Date beginTime, Date endTime, String description, int status, Department department) {
        this.projectName = projectName;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.description = description;
        this.status = status;
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public String getBeginTimeStr() {
        if(beginTime != null){
            beginTimeStr = DateUtil.date_to_String(beginTime,"yyyy年MM月dd日");
        }
        return beginTimeStr;
    }

    public void setBeginTimeStr(String beginTimeStr) {
        this.beginTimeStr = beginTimeStr;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getEndTimeStr() {
        if(endTime != null){
            endTimeStr = DateUtil.date_to_String(endTime,"yyyy年MM月dd日");
        }
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusStr() {
        if(status != null){
            if (status == 0){
                statusStr = "关闭";
            }else if (status ==1){
                statusStr = "开启";
            }else if (status == 2){
                statusStr = "完成";
            }
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
