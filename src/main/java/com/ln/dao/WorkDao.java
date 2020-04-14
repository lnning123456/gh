package com.ln.dao;

import com.ln.entity.Work;

import java.util.List;

public interface WorkDao {
    List<Work> findWorkByDoctorId(String doctorId);
    void addWork(Work work);
    void delete(String workId);
}
