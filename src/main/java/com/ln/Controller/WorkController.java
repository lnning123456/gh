package com.ln.Controller;

import com.ln.entity.Work;
import com.ln.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
        System.out.println("queryWork = " + work);
        return  workService.queryWork(work,page,compare);
    };
    @RequestMapping("addWork")
    String  addWork(Work work){
        System.out.println("work = " + work);
        return  workService.addWork(work);
    }
    @RequestMapping("deleteWork")
    String deleteWork(String workId) {
        System.out.println("deleteWork workId = " + workId);
        return workService.deleteWork(workId);
    }
    @RequestMapping("updateWork")
    String updateWork(Work work) {
        System.out.println("updateWork work = " + work);
        return workService.updateWork(work);
    }
    @RequestMapping("followingWork")
    public List<Work> followingWork(String doctorId) {
        System.out.println("followingWork doctorId = " + doctorId);
        return  workService.followingWork(doctorId);
    }
}
