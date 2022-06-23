package cn.lonlea.mapper;

import cn.lonlea.domain.Daily;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IDailyMapper {
    @Select("SELECT * FROM user_daily WHERE id=#{id}")
    Daily findById(String id);

    @Select("SELECT * FROM user_daily WHERE userId=#{userId} ORDER BY date")
    List<Daily> findByUserId(String userId);

    @Insert("INSERT INTO user_daily (id,userId,title,date,detail,state) " +
            "VALUES " +
            "(#{id},#{userId},#{title},#{date},#{detail},#{state})")
    void add(Daily daily);

    @Delete("DELETE FROM user_daily WHERE id=#{id}")
    void delete(String id);

    @Update("UPDATE user_daily SET state=0 WHERE id=#{id}")
    void finish(String id);
}
