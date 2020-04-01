package com.ln.dao;

import com.ln.entity.Department;
import com.ln.entity.Doctor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorDao {
    List<Department> queryByPage( @Param("start") Integer start, @Param("rows") Integer rows);
    Integer getCount();
    List<Doctor> findDoctorByDepartment(String departmentId);
    List<Doctor> findAllDoctor();
    void addDoctor(Doctor doctor);
    void deleteDoctor(String doctorId);
    void updateDoctor(Doctor doctor);
}
