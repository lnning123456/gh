package com.ln.service;

import com.ln.entity.Work;

import java.util.List;
import java.util.Map;

public interface WorkService {

    Map<String, Object> queryWork(Work work, Integer page, String compare);

    String addWork(Work work);

    String updateWork(Work work);

    String deleteWork(String workId);

    List<Work> followingWork(String doctorId);
}
