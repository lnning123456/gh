package com.ln.Controller;

import com.ln.entity.Department;
import com.ln.entity.Doctor;
import com.ln.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("doctor")
public class DoctorController {
    @Autowired
    DoctorService doctorService;


   
    @RequestMapping("queryDoctor")
    Map<String,Object> queryDoctor(Doctor doctor, Integer page, Department department) {
        doctor.setDepartment(department);
        return doctorService.queryDoctor(doctor,page);
    }
   
    @RequestMapping(  "addDoctor")
    String addDoctor(@RequestParam(value = "img") MultipartFile img, HttpSession session, Doctor doctor) {
       if (!img.isEmpty()) {
           String realPath = session.getServletContext().getRealPath("/img/");
           File file = new File(realPath);
           String filename = img.getOriginalFilename();
           String newFileName = new Date().getTime() + "_" + filename;
           try {
               img.transferTo(new File(file, newFileName));
           } catch (IOException e) {
               e.printStackTrace();
           }
           doctor.setSrc(newFileName);
        }else {
           doctor.setSrc("doctor_default.png");
       }
        return  doctorService.addDoctor(doctor);
    }
   
    @RequestMapping("queryDoctorByDoctorId")
    Doctor gotoUpdateDoctor(String doctorId ) {
        return  doctorService.queryDoctorByDoctorId(doctorId);
    }
   
    @RequestMapping("updateDoctor")
    String updateDoctor(@RequestParam(value = "img") MultipartFile img, HttpSession session,Doctor doctor) {
        System.out.println("updateDoctor doctor = " + doctor);
        if (!img.isEmpty()) {
            String filename = img.getOriginalFilename();
            String realPath = session.getServletContext().getRealPath("/img/");
            File file = new File(realPath);
            String newFileName = new Date().getTime() + "_" + filename;
            try {
                img.transferTo(new File(file, newFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            doctor.setSrc(newFileName);
        }
        return doctorService.updateDoctor(doctor);
    }


   
    @RequestMapping("deleteDoctor")
    String deleteDoctor(String doctorId) {
        return  doctorService.deleteDoctor(doctorId);
    }
}
