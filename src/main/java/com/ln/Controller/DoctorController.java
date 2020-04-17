package com.ln.Controller;

import com.ln.entity.Doctor;
import com.ln.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
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
    String addDoctor(@RequestParam(value = "img") MultipartFile img, HttpSession session, Doctor doctor, String doctorName, String src, String position) {
        System.out.println("doctor = " + doctor);
        if (img.isEmpty()) {
            System.out.println("文件为空空");
        }
        System.out.println("doctorName = " + doctorName);
        System.out.println("img = " + img);
        System.out.println("position = " + position);
       String realPath = session.getServletContext().getRealPath("/img/");
        File file = new File(realPath);
        String filename = img.getOriginalFilename();
        String newFileName = new Date().getTime() + "_" + filename;
        try {
            img.transferTo(new File(file, newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  doctorService.addDoctor(doctor);
     //   return "back/main";
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
