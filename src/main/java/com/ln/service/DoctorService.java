package com.ln.service;

import com.ln.entity.Doctor;

import java.util.List;
import java.util.Map;

public interface DoctorService {
    List<Doctor> findAllDoctor();
    List<Doctor> findDoctor(Doctor doctor);
    Doctor findDoctorByDoctorId(String doctorId);
    String addDoctor(Doctor doctor);
    String updateDoctor(Doctor doctor);
    String deleteDoctor(String doctorId);
}
