package com.ln.Controller;

import com.ln.entity.Work;
import com.ln.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("work")
public class WorkController {
    @Autowired
    WorkService workService;
    @RequestMapping("queryWork")
    Map<String, Object> queryWork(Work work, Integer page,String  compare){
        return  workService.queryWork(work,page,compare);
    };
    @RequestMapping("addWork")
    String  addWork(Work work){
        return  workService.addWork(work);
    }
    @RequestMapping("deleteWork")
    String deleteWork(String workId) {
        return workService.deleteWork(workId);
    }
    @RequestMapping("updateWork")
    String updateWork(Work work) {
        return workService.updateWork(work);
    }
    @RequestMapping("followingWork")
    public List<Work> followingWork(String doctorId) {
        return  workService.followingWork(doctorId);
    }
}
