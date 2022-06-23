package cn.lonlea.service.impl;

import cn.lonlea.domain.Daily;
import cn.lonlea.mapper.IDailyMapper;
import cn.lonlea.service.IDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DailyService implements IDailyService {
    @Autowired
    private IDailyMapper dailyMapper;

    @Override
    public List<Daily> findByUserId(String userId) {
        return dailyMapper.findByUserId(userId);
    }

    @Override
    public void add(Daily daily) {
        dailyMapper.add(daily);
    }

    @Override
    public Daily findById(String id) {
        return dailyMapper.findById(id);
    }

    @Override
    public void delete(String id) {
        dailyMapper.delete(id);
    }

    @Override
    public void finish(String id) {
        dailyMapper.finish(id);
    }
}
