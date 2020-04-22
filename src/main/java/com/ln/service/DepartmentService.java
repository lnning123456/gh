package com.ln.service;

import com.ln.entity.Department;

import java.util.List;
import java.util.Map;

public interface DepartmentService {

    List<Department> queryAllDepartment();
    List<Department> queryAllDepartment1();
    Map<String,Object> queryDepartment2ByDepartment1(String departmentId);
    Map<String,String> addDepartment(Department department);
    Map<String,String> deleteDepartment(String departmentId);
    Department queryByDepartmentName(String departmentName);
}
