package com.ln.Controller;


import com.ln.entity.Department;
import com.ln.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
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
   @RequestMapping("deleteDepartment")
    public String deleteDepartment(String departmentId){

       System.out.println("departmentId = " + departmentId);
       return departmentService.deleteDepartment(departmentId);
   }
    @RequestMapping("findAllDepartment1")
    public List<Department> findAllDepartment1(){
        System.out.println("/findAllDepartment1");
        return  departmentService.findAllDepartment1();
    }
    @RequestMapping("findDepartment2ByDepartment1")
    public  List<Department> findDepartment2ByDepartment1(String departmentId){
      return  departmentService.findDepartment2ByDepartment1(departmentId);
    }
    @RequestMapping("findByDepartmentName")
    public Department findByDepartmentName(String departmentName){

        return  departmentService.findByDepartmentName(departmentName);

    }
}
