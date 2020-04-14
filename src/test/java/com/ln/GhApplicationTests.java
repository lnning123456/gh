package com.ln;

import com.ln.dao.AdminDao;
import com.ln.dao.DepartmentDao;
import com.ln.dao.DoctorDao;
import com.ln.entity.Admin;
import com.ln.entity.Department;
import com.ln.entity.Doctor;
import com.ln.service.DepartmentService;
import com.ln.service.DoctorService;
import com.ln.util.PageUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.SimpleDateFormat;
import java.util.*;

@SpringBootTest(classes = GhApplication.class)
@RunWith(SpringRunner.class)
public class GhApplicationTests {
    @Autowired
    AdminDao adminDao;
    @Autowired
    DepartmentDao departmentDao;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    PageUtil pageUtil;
    @Autowired
    DoctorDao doctorDao;
    @Autowired
    DoctorService doctorService;

    @Test
    public void MyTest() {
        System.out.println("true = " + true);
    }

    @Test
    public void findAdmin() {
        Admin byName = adminDao.findByName("ln");
        System.out.println("byName = " + byName);
    }

    @Test
    public void findAllDepartment() {
        List<Department> allDepartment = departmentDao.findAllDepartment();
        for (Department department : allDepartment) {
            System.out.println("department = " + department);
        }
    }

    @Test
    public void addDepartment() {
        Department department = new Department();
        department.setDepartmentId(UUID.randomUUID().toString());
        department.setDepartmentName("其他科室");
        department.setLevels(1);
        // department.setParentId("1");
        departmentDao.addDepartment(department);
    }

    @Test
    public void deleteDepartment() {
        System.out.println(departmentService.deleteDepartment("1"));
    }

    @Test
    public void departmentCount() {
        System.out.println(departmentDao.getLevelsCount(2));
    }

    @Test
    public void departmentPage() {
        List<Department> departments = departmentDao.queryByPage(1, 2, 3);
        for (Department department : departments) {
            System.out.println("department = " + department);
        }
    }

    /* @Test
     public  void  departmentServicePage(){
         Map<String, Object> map = departmentService.queryByPage(1, 3);
         Set<Map.Entry<String, Object>> entries = map.entrySet();
         for (Map.Entry<String, Object> entry : entries) {
             System.out.println("entry = " + entry);
         }
     }*/
    @Test
    public void allDepartment1() {
        List<Department> departments = departmentDao.findAllDepartment1();
        for (Department department : departments) {
            System.out.println("department = " + department);
        }
    }

    @Test
    public void findDepartment2ByDepartment1Id() {
        List<Department> departments = departmentDao.findDepartment2ByDepartment1Id("1");
        for (Department department : departments) {
            System.out.println("department = " + department);
        }
    }

    @Test
    public void findDepartmentById() {
        Department department = departmentDao.findByDepartmentId("8");
        System.out.println("department = " + department);
    }

    @Test
    public void findByDepartmentName() {
        Department department = departmentService.findByDepartmentName("口腔种植科");
        System.out.println("department = " + department);
    }

    @Test
    public void pageTest() {
        Map myMap = PageUtil.getMyMap(10);
        Set keySet = myMap.keySet();
        for (Object o : keySet) {
            System.out.println("o = " + o);
            System.out.println("result" + myMap.get(o));
        }
    }

    @Test
    public void pageTest2() {
        Map<String, Object> pageMap = pageUtil.getPageMap(1, 2, 3);
        Set<Map.Entry<String, Object>> entries = pageMap.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            System.out.println("entry = " + entry);
        }
    }

    @Test
    public void testTime() {
        // DateTime.Now.ToString().SubString(0,2)>12?( "下午"+ DateTime.Now):( "上午"+
        Date date = new Date();
        System.out.println("date = " + date);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("simpleDateFormat = " + simpleDateFormat.format(date));

        Calendar c = Calendar.getInstance();

        c.set(Calendar.HOUR_OF_DAY, 1);
        System.out.println("c = " + c.get(Calendar.HOUR_OF_DAY));
    }

    @Test
    public void findAllDoctor() {
        List<Doctor> allDoctor = doctorService.findAllDoctor();
        System.out.println("allDoctor = " + allDoctor);
    }
    @Test
    public void  findDoctorByDepartmentId() {
        List<Doctor> allDoctor = doctorService. findDoctorByDepartment("5");
        System.out.println("allDoctor = " + allDoctor);
    }
    @Test
    public void  findDoctorByDoctorName() {
        Doctor allDoctor = doctorService.findDoctorByDoctorName("华佗");
        System.out.println("allDoctor = " + allDoctor);
    }
    @Test
    public void  findDoctorByDoctorId() {
        Doctor allDoctor = doctorDao.findDoctorByDoctorId("3");
        System.out.println("allDoctor = " + allDoctor);
    }
    @Test
    public void  addDoctor() {
        Doctor doctor = new Doctor();
        doctor.setDoctorName("孙思邈");
        doctor.setDepartmentId("5");
        doctor.setPosition("sfesdf");
        doctorService.addDoctor(doctor);
    }
    @Test
    public void  deleteDoctor() {
        System.out.println("dsfsdg"+doctorService.deleteDoctor("3"));
    }

    @Test
    public void  updateDoctor() {
        Doctor doctor = new Doctor();
        doctor.setDoctorId("2");
        doctor.setDepartmentId("7");
        doctor.setPosition("gfrd");
        doctor.setPresentation("sfdsfd");
        doctor.setSrc("tff");
        doctor.setStatus("休息");
        System.out.println("dsfsdg"+doctorService.updateDoctor(doctor));
    }
}
