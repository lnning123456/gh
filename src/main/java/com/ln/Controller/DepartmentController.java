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

    @RequestMapping("queryAllDepartment")
    public List<Department> queryAllDepartment() {
        return departmentService.queryAllDepartment();
    }

    @RequestMapping("deleteDepartment")
    public String deleteDepartment(String departmentId) {
        System.out.println("departmentId = " + departmentId);
        return departmentService.deleteDepartment(departmentId);
    }

    @RequestMapping("queryAllDepartment1")
    public List<Department> queryAllDepartment1() {
        return departmentService.queryAllDepartment1();
    }

    @RequestMapping("queryDepartment2ByDepartment1")
    public Map<String, Object> queryDepartment2ByDepartment1(String departmentId) {
        return departmentService.queryDepartment2ByDepartment1(departmentId);
    }

    @RequestMapping("queryByDepartmentName")
    public Department queryByDepartmentName(String departmentName) {
        return departmentService.queryByDepartmentName(departmentName);
    }
    @RequestMapping("addDepartment")
    public String addDepartment(Department department) {
        System.out.println("department = " + department);
        return departmentService.addDepartment(department);
    }
}
