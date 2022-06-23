package cn.lonlea.service;

import cn.lonlea.domain.Daily;

import java.util.List;

public interface IDailyService {
    List<Daily> findByUserId(String userId);
    void add(Daily daily);
    Daily findById(String id);
    void delete(String id);
    void finish(String id);
}
