package com.ln.service;

import com.ln.entity.Department;

import java.util.List;
import java.util.Map;

public interface DepartmentService {
    Map<String, Object> queryByPage(Integer page, Integer rows);
    List<Department> findAllDepartment();
    List<Department> findDepartment1(String departmentId);
    List<Department> findDepartment2ByDepartment1(String departmentId);
    void  addDepartment(Department department);
    String deleteDepartment(Department department);
}
