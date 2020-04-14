package com.ln.service;

import com.ln.entity.Work;

import java.util.List;

public interface WorkService {
    List<Work> findWorkByDoctor(String doctorId);
    void addWork(Work work);
    void delete(String workId);
}
