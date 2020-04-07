package com.ln.service;

import com.ln.entity.Department;

import java.util.List;
import java.util.Map;

public interface DepartmentService {

    List<Department> findAllDepartment();
    List<Department> findAllDepartment1();
    List<Department> findDepartment2ByDepartment1(String departmentId);
    void  addDepartment(Department department);
    String deleteDepartment(String departmentId);
    Department findByDepartmentName(String departmentName);
}
