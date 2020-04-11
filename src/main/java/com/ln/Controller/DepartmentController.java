package com.ln.Controller;


import com.ln.entity.Department;
import com.ln.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("findAllDepartment")
    public List<Department> findAllDepartment() {
        return departmentService.findAllDepartment();
    }

    @RequestMapping("deleteDepartment")
    public Map<String, String> deleteDepartment(String departmentId) {
        System.out.println("departmentId = " + departmentId);
        return departmentService.deleteDepartment(departmentId);
    }

    @RequestMapping("findAllDepartment1")
    public List<Department> findAllDepartment1() {
        return departmentService.findAllDepartment1();
    }

    @RequestMapping("findDepartment2ByDepartment1")
    public Map<String, Object> findDepartment2ByDepartment1(String departmentId) {
        return departmentService.findDepartment2ByDepartment1(departmentId);
    }

    @RequestMapping("findByDepartmentName")
    public Department findByDepartmentName(String departmentName) {
        return departmentService.findByDepartmentName(departmentName);
    }
    @RequestMapping("addDepartment")
    public Map<String, String> addDepartment(Department department) {
        System.out.println("department = " + department);
        return departmentService.addDepartment(department);
    }
}
