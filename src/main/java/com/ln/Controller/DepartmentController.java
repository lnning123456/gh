package com.ln.Controller;


import com.ln.entity.Department;
import com.ln.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
   @RequestMapping("findAllDepartment")
    public List<Department> findAllDepartment(){
       System.out.println("/findAllDepartment");
       return  departmentService.findAllDepartment();
   }
}
