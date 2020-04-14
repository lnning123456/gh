package com.ln.Controller;

import com.ln.entity.Doctor;
import com.ln.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("doctor")
public class DoctorController {
    @Autowired
    DoctorService doctorService;

    @ResponseBody
    @RequestMapping("findDoctorByDepartment")
    List<Doctor> findDoctorByDepartment(String departmentId) {
        return doctorService.findDoctorByDepartment(departmentId);
    }
    @ResponseBody
    @RequestMapping("findDoctorByDoctorName")
    Doctor findDoctorByDoctorName(String doctorName) {
        return doctorService.findDoctorByDoctorName(doctorName);
    }
    @ResponseBody
    @RequestMapping("addDoctor")
    String addDoctor(Doctor doctor) {
        return  doctorService.addDoctor(doctor);
    }
    @ResponseBody
    @RequestMapping("updateDoctor")
    String updateDoctor(Doctor doctor) {
        return doctorService.updateDoctor(doctor);
    }

    @RequestMapping("gotoUpdateDoctor")
    String gotoUpdateDoctor(String doctorId , HttpServletRequest request) {
        System.out.println("gotoUpdateDoctor doctorId = " + doctorId);
        Doctor doctor = doctorService.findDoctorByDoctorId(doctorId);
        request.setAttribute("doctor",doctor);
        return "back/test";
    }
    @ResponseBody
    @RequestMapping("deleteDoctor")
    String deleteDoctor(String doctorId) {
        return  doctorService.deleteDoctor(doctorId);
    }
}
