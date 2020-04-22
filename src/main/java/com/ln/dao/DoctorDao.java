package com.ln.dao;


import com.ln.entity.Doctor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorDao {
    List<Doctor> queryDoctorByDepartmentId(String departmentId);
    List<Doctor> queryDoctor( @Param("doctor") Doctor doctor,@Param("start")Integer start);
   Integer queryDoctorCount(@Param("doctor")Doctor doctor);
    List<Doctor> queryAllDoctor();
    Doctor queryDoctorByDoctorId(String doctorId);
    void addDoctor(Doctor doctor);
    void deleteDoctor(String doctorId);
    void updateDoctor(Doctor doctor);
}
