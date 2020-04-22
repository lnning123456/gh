package com.ln.service;

import com.ln.entity.Doctor;

import java.util.List;
import java.util.Map;

public interface DoctorService {
    List<Doctor> queryAllDoctor();
    Map<String,Object> queryDoctor(Doctor doctor,Integer start);
    Doctor queryDoctorByDoctorId(String doctorId);
    String addDoctor(Doctor doctor);
    String updateDoctor(Doctor doctor);
    String deleteDoctor(String doctorId);
}
