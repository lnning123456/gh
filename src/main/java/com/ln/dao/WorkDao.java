package com.ln.dao;

import com.ln.entity.Work;

import java.util.List;

public interface WorkDao {
    List<Work> queryWorkByDoctorId(String doctorId);
   Work queryWorkByWorkId(String WorkId);
    void addWork(Work work);
    void updateWork(Work work);
    void deleteWork(String workId);
}
