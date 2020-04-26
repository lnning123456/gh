package com.ln.Controller;

import com.ln.entity.Work;
import com.ln.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@ResponseBody
@RequestMapping("work")
public class WorkController {
    @Autowired
    WorkService workService;
    @RequestMapping("queryWorkByDoctor")
    List<Work> queryWorkByDoctor(String doctorId){
        System.out.println("doctorId = " + doctorId);
        return  workService.queryWorkByDoctor(doctorId);
    }
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
}
