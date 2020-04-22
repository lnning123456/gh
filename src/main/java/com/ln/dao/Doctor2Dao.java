package com.ln.dao;

import com.ln.entity.Doctor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Doctor2Dao {

    Doctor queryDoctorByDoctorId(String doctorId);
    List<Doctor> query(@Param("doctor")Doctor doctor, @Param("start")Integer start);


    Integer count(@Param("doctor")Doctor doctor);

    List<Doctor> queryDoctorByDepartmentId(String departmentId);
    List<Doctor> queryDoctor(@Param("doctor") Doctor doctor, @Param("start")Integer start);
    Integer queryDoctorCount(@Param("doctor")Doctor doctor);
    List<Doctor> queryAllDoctor();

    void addDoctor(Doctor doctor);
    void deleteDoctor(String doctorId);
    void updateDoctor(Doctor doctor);
}
