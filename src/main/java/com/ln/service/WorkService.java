package com.ln.service;

import com.ln.entity.Work;

import java.util.List;

public interface WorkService {
    List<Work> queryWorkByDoctor(String doctorId);
    String  addWork(Work work);
    String deleteWork(String workId);
}
