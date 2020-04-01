package com.ln;

import com.ln.dao.AdminDao;
import com.ln.dao.DepartmentDao;
import com.ln.entity.Admin;
import com.ln.entity.Department;
import com.ln.service.DepartmentService;
import com.ln.util.PageUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

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
   @Test
    public  void MyTest(){
       System.out.println("true = " + true);
   }

    @Test
    public void  findAdmin(){
        Admin byName = adminDao.findByName("ln");
        System.out.println("byName = " + byName);
    }
    @Test
    public  void findAllDepartment(){
        List<Department> allDepartment = departmentDao.findAllDepartment();
        for (Department department : allDepartment) {
            System.out.println("department = " + department);
        }
    }
    @Test
    public  void addDepartment(){
        Department department = new Department();
        department.setId(UUID.randomUUID().toString());
        department.setDepartmentName("其他科室");
        department.setLevels(1);
       // department.setParentId("1");
        departmentDao.addDepartment(department);
    }
    @Test
    public  void  deleteDepartment(){
       departmentDao.deleteDepartment("14");
    }
    @Test
    public  void  departmentCount(){
        System.out.println(departmentDao.getLevelsCount(2));
    }
    @Test
    public  void  departmentPage(){
        List<Department> departments = departmentDao.queryByPage(1,2, 3);
        for (Department department : departments) {
            System.out.println("department = " + department);
        }
    }
    @Test
    public  void  departmentServicePage(){
        Map<String, Object> map = departmentService.queryByPage(1, 3);
        Set<Map.Entry<String, Object>> entries = map.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            System.out.println("entry = " + entry);
        }
    }
    @Test
    public  void  allDepartment1(){
        List<Department> departments = departmentDao.findAllDepartment1();
        for (Department department : departments) {
            System.out.println("department = " + department);
        }
    }
    @Test
    public  void  allDepartment2(){
        List<Department> departments = departmentDao.findAllDepartment2ByDepartment1Id("1");
        for (Department department : departments) {
            System.out.println("department = " + department);
        }
    }
    @Test
    public  void  findDepartmentById(){
        Department department= departmentDao.findByDepartmentId("8");
        System.out.println("department = " + department);
    }
    @Test
    public void pageTest(){
        Map myMap = PageUtil.getMyMap(10);
        Set keySet = myMap.keySet();
        for (Object o : keySet) {
            System.out.println("o = " + o);
            System.out.println("result"+myMap.get(o));
        }
    }
    @Test
    public void pageTest2(){
        Map<String, Object> pageMap = pageUtil.getPageMap(1, 2, 3);
        Set<Map.Entry<String, Object>> entries = pageMap.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            System.out.println("entry = " + entry);
        }
    }
}
