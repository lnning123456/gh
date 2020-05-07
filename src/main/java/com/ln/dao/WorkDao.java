package com.ln.dao;

import com.ln.entity.Work;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkDao {
    List<Work> queryWorkByDoctorId(String doctorId);

    List<Work> queryWork(@Param("work") Work work, @Param("start") Integer start, @Param("compare") String compare);

    Integer getWorkCount(@Param("work") Work work, @Param("compare") String compare);

    Work queryWorkByWorkId(String workId);

    void addWork(Work work);

    void updateWork(Work work);

    void deleteWork(String workId);
//医生接下来的工作
    List<Work> followingWork(String doctorId);
}
