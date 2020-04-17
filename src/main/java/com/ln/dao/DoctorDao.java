package com.ln.dao;

import com.ln.entity.Department;
import com.ln.entity.Doctor;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DoctorDao {
    List<Doctor> findDoctorByDepartmentId(String departmentId);
    List<Doctor> findDoctor(Doctor doctor);
    List<Doctor> findAllDoctor();
    Doctor findDoctorByDoctorId(String doctorId);
    Doctor findDoctorByDoctorName(String doctorName);
    void addDoctor(Doctor doctor);
    void deleteDoctor(String doctorId);
    void updateDoctor(Doctor doctor);
}
