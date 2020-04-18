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
    @RequestMapping("findDoctor")
    List<Doctor> findDoctor(Doctor doctor) {
        return doctorService.findDoctor(doctor);
    }
    @ResponseBody
    @RequestMapping( value = "addDoctor"/*,method = RequestMethod.POST*/)
    String addDoctor(@RequestParam(value = "img") MultipartFile img, HttpSession session, Doctor doctor) {
        System.out.println("doctor = " + doctor);
        System.out.println("img = " + img);
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
