package com.ln.dao;

import com.ln.entity.Department;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.Primary;

import java.util.List;

@Primary
public interface DepartmentDao {
    List<Department> queryByPage(@Param("levels")Integer levels, @Param("start") Integer start, @Param("rows") Integer rows);
    Integer getLevelsCount(Integer levels);
    List<Department> queryAllDepartment();
    Department queryByDepartmentId(String departmentId);
    Department queryByDepartmentName(String departmentName);
    List<Department> queryAllDepartment1();
    List<Department> queryDepartment2ByDepartment1Id(String departmentId);
    void  addDepartment(Department department);
    void deleteDepartment(String departmentId);
}
