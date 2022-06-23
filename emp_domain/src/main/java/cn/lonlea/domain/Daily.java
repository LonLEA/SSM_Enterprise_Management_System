package cn.lonlea.domain;

import cn.lonlea.utils.DateUtil;
import cn.lonlea.utils.UUIDutil;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Daily {
    private String id = UUIDutil.getuuid();
    private String userId;
    private String title;
    @DateTimeFormat(pattern = "yyyy年MM月dd日")
    private Date date;
    private String dateStr;
    private String detail;
    private Integer state = 0;
    private String stateStr;

    public Daily() {
    }

    public Daily(String userId, String title, Date date, String detail, int state) {
        this.userId = userId;
        this.title = title;
        this.date = date;
        this.detail = detail;
        this.state = state;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        if(date != null){
            dateStr = DateUtil.date_to_String(date,"yyyy年MM月dd日");
        }
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        if(state != null){
            if(state == 0){
                stateStr = "完成";
            }else if(state == 1){
                stateStr = "紧急";
            }else if(state == 2){
                stateStr = "常规";
            }
        }
        this.state = state;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    @Override
    public String toString() {
        return "Daily{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", date=" + date +
                ", dateStr='" + dateStr + '\'' +
                ", detail='" + detail + '\'' +
                ", state=" + state +
                ", stateStr='" + stateStr + '\'' +
                '}';
    }
}
